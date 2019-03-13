enemy_count = instance_number(obj_enemy_parent);
//show_debug_message(enemy_count);


if (instance_exists(obj_Skeleton))
{
	var current_level = obj_Skeleton.level;
	
	with(obj_Skeleton){
		if(ult_meter == ult_meter_max){
			if ((ult_state = false) and (input.activate_ult)){
				//show_debug_message("ult on");
				if (hp < 80){
				hp += 20;
				}
				if (hp > max_hp){
					hp = max_hp;
				}
				ult_state = true;
				sprite_idle = s_skeleton_idle_2;
				sprite_run = s_skeleton_run_2;
				sprite_roll = s_skeleton_roll_2;
				sprite_attack_1 = s_skeleton_attack_one_2;
				sprite_attack_2 = s_skeleton_attack_two_2;
				sprite_attack_3 = s_skeleton_attack_three_2;
				sprite_knockback = s_skeleton_hitstun_2;
				ult_time = ult_time_max;
			}
		}else{
			ult_state = false;
		}
	
	
		if(ult_state == true){
			ult_time -= 1;
			if(ult_time == 0){
				//show_debug_message("ult off");
				sprite_idle = s_skeleton_idle;
				sprite_run = s_skeleton_run;
				sprite_roll = s_skeleton_roll;
				sprite_attack_1 = s_skeleton_attack_one;
				sprite_attack_2 = s_skeleton_attack_two;
				sprite_attack_3 = s_skeleton_attack_three;
				sprite_knockback = s_skeleton_hitstun;
				obj_Skeleton.ult_meter = 0;
			}
		}
	}
	
	
	if (enemy_count >= enemy_max){
		exit;
	}
	var enemy = choose(obj_knight, obj_crow, obj_crow);
	
	if((obj_Skeleton.kills > 50) and (!instance_exists(obj_boss))){
		enemy = choose(obj_knight,obj_knight, obj_crow, obj_crow, obj_crow, obj_boss);
	}
	
	var new_x = random_range(220, room_width - 220);
	while (point_distance(new_x, 0, obj_Skeleton.x, 0) < 200)
	{
		new_x = random_range(220, room_width - 220);
	}
	
	instance_create_layer(new_x, obj_Skeleton.y, "Instances", enemy);
}

if (keyboard_check_pressed(ord("R"))){
	game_restart();
}