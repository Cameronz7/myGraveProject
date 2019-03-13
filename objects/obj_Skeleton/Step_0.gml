
switch (state){
	case "move":
		#region Move State
		with(obj_input){
				allow_move = 1;
			}
		if (input.right){
			move_and_collide_player(run_speed,0);
			image_xscale = 1;
			sprite_index = sprite_run;
			image_speed = 0.6;
		}
		if (input.left){
			move_and_collide_player(-run_speed,0);
			image_xscale = -1;
			sprite_index = sprite_run;
			image_speed = 0.6;
		}
		if (not input.right and not input.left){
			sprite_index = sprite_idle;
			image_speed = 0.4;
		}else{
			if((animation_hit_frame(2) or animation_hit_frame(5))){
				audio_play_sound(a_footstep, 2, false);
			}	
		}
		
		
		
		if ((input.rolling) and (roll_delay == 0)){	
			state = "roll";
		}
		if (input.attacking){
			state = "attack one";
		}
		#endregion
		break;
	case "roll":
		#region Roll State
		player_immune = 10;
		roll_delay = 20;
		set_state_sprite(sprite_roll, 1.4, 0);
		with(obj_input){
				allow_move = 0;
				alarm[0] = 2;
			}
		if ((input.right) or (input.left)){	
			if ((input.right)){
				image_xscale = 1;
				move_and_collide_player(roll_speed,0);
			
			}
			if((input.left)){
				image_xscale = -1;
				move_and_collide_player(-roll_speed,0);
			}
		}else{
			if ((image_xscale == 1)){
				move_and_collide_player(roll_speed,0);
			
			}
			if((image_xscale == -1)){
				move_and_collide_player(-roll_speed,0);
			}
		}
		
		if (animation_end()){
			with(obj_input){
				allow_move = 1;
			}
			state = "move";
		}
		
		#endregion
		break;
	case "attack one":
		#region Attack One State
		set_state_sprite(sprite_attack_1, 1.1, 0);
		
		if animation_hit_frame(0){
			audio_play_sound(a_swipe, 3, false);
			
			if (ult_state){
				create_hitbox(x + (25 * image_xscale),y, self, s_skeleton_ult_attack, 6, 25, 5, image_xscale);
			}else{
				create_hitbox(x,y, self, s_skeleton_attack_one_damage, 2, 8, 5, image_xscale);
			}
		}
		
		if (input.attacking and animation_hit_frame_range(2,6)){
			state = "attack two";
		}
		
		if (input.rolling and animation_hit_frame_range(2,6) and (roll_delay == 0)){	
			state = "roll";
		}
		if (animation_end()){
			state = "move";
		}
		
		#endregion
		break;
	case "attack two":
		#region Attack two State
		set_state_sprite(sprite_attack_2, 1.2, 0);
		
		if animation_hit_frame(1){
			audio_play_sound(a_swipe, 3, false);
			
			if (ult_state){
				create_hitbox(x + (25 * image_xscale),y, self, s_skeleton_ult_attack, 6, 40, 5, image_xscale);
			}else{
				create_hitbox(x,y, self, s_skeleton_attack_two_damage, 1.5, 8, 5, image_xscale);
			}
		}
		
		if (input.attacking and animation_hit_frame_range(2,6)){
			state = "attack three";
		}
		if (input.rolling and animation_hit_frame_range(2,6) and (roll_delay == 0)){	
			state = "roll";
		}
		if (animation_end()){
			state = "move";
		}
		#endregion
		break;
	case "attack three":
		#region Attack three State
		set_state_sprite(sprite_attack_3, 0.8, 0);
		
		if animation_hit_frame(2){
			audio_play_sound(a_swipe, 3, false);
			
			if (ult_state){
				create_hitbox(x + (25 * image_xscale),y, self, s_skeleton_ult_attack, 6, 50, 8, image_xscale);
			}else{
				create_hitbox(x,y, self, s_skeleton_attack_three_damage, 5, 8, 8, image_xscale);
			}
			
		}
		if (input.rolling and animation_hit_frame_range(2,5) and (roll_delay == 0)){	
			state = "roll";
		}
		
		if (animation_end()){
			state = "move";
		}
		#endregion
		break;
	case "knockback":
		#region KnockBack State
		with(obj_input){
				allow_move = 1;
			}
		knockback_state(sprite_knockback, "move");
		#endregion
		break;
	default:
		show_debug_message("State " + state + " does not exist.");
		state = "move";
		break;
}

if (player_immune > 0){
	player_immune -= 1;
	//show_debug_message("immune counter: " + string(player_immune));
}

if (roll_delay > 0){
	roll_delay -= 1;
	//show_debug_message("roll counter: " + string(roll_delay));
}
if (ult_meter > ult_meter_max){
	ult_meter = ult_meter_max;
}

