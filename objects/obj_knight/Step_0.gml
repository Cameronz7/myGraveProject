switch(state){
	case "chase":
		#region Chase State
		set_state_sprite(s_knight_walk, 0.5, 0);
		
		if (not instance_exists(obj_Skeleton)){
			break;	
		}
		image_xscale = sign(obj_Skeleton.x - x);
		if (image_xscale == 0){
			image_xscale = 1;
		}
		var direction_facing = image_xscale;
		var distance_to_player = point_distance(x,y,obj_Skeleton.x, obj_Skeleton.y);
		if (distance_to_player <= attack_range){
			state = "attack";	
		}
		else{
			move_and_collide_enemy(direction_facing * chase_speed, 0);
		}
		
		#endregion
		break;
	case "attack":
		#region Attack State
		set_state_sprite(s_knight_attack, 0.9, 0);
		
		if animation_hit_frame(4){
			audio_play_sound(a_swipe, 3, false);
			create_hitbox(x,y, self, s_skeleton_attack_one_damage, 4, 8, damage, image_xscale);
		}
		
		
		if (animation_end()){
			state = "chase";
		}
		#endregion
		break;
	case "knockback":
		#region KnockBack State
		knockback_state(s_knight_hitstun, "chase");
		
		#endregion
		break;
	case "death":
		#region Death State
		if (instance_exists(obj_Skeleton)){
			if (is_dead == 0){
				is_dead = 1;
				var blood_splatter = instance_create_layer(x , obj_Skeleton.y , "blood_stain", obj_blood_stain);
				blood_splatter.image_index = random_range(0,2);
				obj_Skeleton.kills += 1;
				repeat (experience){
					var exp_orb = instance_create_layer(x + random_range(-6, 6), y + random_range(-4, 4), "Effects", obj_experience);
					exp_orb.image_index = random(3);
				}
			}
		}
		death_state(s_knight_die, experience);
		#endregion
		break;
	case "wait":
		#region Wait State
		set_state_sprite(s_knight_idle, 0.5, 0);
		if (waiting_time > 0){
			waiting_time -= 1;
		}
		if (instance_exists(obj_Skeleton)){
			var direction_facing = image_xscale;
			var distance_to_player = point_distance(x,y,obj_Skeleton.x, obj_Skeleton.y);
			if (distance_to_player <= attack_range){
				state = "attack";	
			}else{
				if (waiting_time == 0){
					state = "chase";
				}
			}
		}
		#endregion
		break
	default:
		show_debug_message("State " + state + " does not exist.");
		state = "chase";
		break;
}