switch(state){
	case "chase":
		set_state_sprite(s_boss_walk, 0.6, 0);
		boss_chase_state();
		boss_knockback();
	break;
	
	case "death":
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
		death_state(s_boss_die, experience);
	break;
	
	case "stall":
		set_state_sprite(s_boss_idle, 0.6, 0);
		if (alarm[1] <= 0){
			state = "chase";
		}
		boss_knockback();
	break;
	
	case "attack":
			set_state_sprite(s_boss_attack, 1, 0);
			if (animation_hit_frame(7)){
				add_screenshake(10,32);
				create_hitbox(x,y,self,s_boss_attack_damage, 10, 3, 20, image_xscale);
				
			}
			if(animation_end()){
				state = "stall";
				alarm[1] = 100;
			}
			boss_knockback();
	break;
}