if (creator == noone or creator == other or ds_list_find_index(hit_objects, other) != -1){
	exit;
}//prevent hit
if(!(creator.object_index == obj_Skeleton) and (other.object_index != obj_Skeleton)){
	exit;
}//prevent enemy team damage
with(obj_Skeleton){
	var player_can_be_hit = player_immune;
}
if((creator.object_index != obj_Skeleton) and (player_can_be_hit > 0)){
	exit;
}//prevent getting hit when in i frames
var damage_dealt = damage;

if(instance_exists(obj_Skeleton)){
	if((obj_Skeleton.ult_state == true) and (other.object_index == obj_Skeleton)){
		other.hp -= (damage_dealt / 3);
	}else{
		other.hp -= damage_dealt;
	}
}

if (sound_playing == 0){
	audio_play_sound(a_medium_hit,3,false);
	sound_playing = 2;
}
//show_debug_message("HitParticle!");
var blood_splat_num = random_range(3,5);
repeat(blood_splat_num){
	instance_create_layer(other.x, other.y -12, "Blood", obj_blood_splat);
	
}
if(instance_exists(obj_Skeleton)){
	
		
	if ((other.object_index == obj_Skeleton)){
		//hitbox hits player
		with(obj_Skeleton){
			player_immune = 32;
		}
		other.state = "knockback";
		other.knockback_speed = knockback * image_xscale;
		add_screenshake(4,12);
		repeat(15){
			instance_create_layer(other.x, other.y -12, "Effects", obj_hit_effect);
		}
		if((other.hp < 0) and (other.ult_state == true)){
			other.hp = 1;
		}
		if (other.hp <= 0){//death
			var number = sprite_get_number(s_skeleton_bones);
			for(var i = 0; i < number; i++){
				var bx = other.x + random_range(-8,8);
				var by = other.y + random_range(-24,8);
				var bone = instance_create_layer(bx,by, "Instances", obj_skeleton_bone);
				
				bone.direction = 90 - (image_xscale * random_range(30,60));
				bone.speed = random_range(3,8);
				bone.image_index = i;
				if (i == 5){
					bone.image_angle = 130;
				}
				ini_open("save.ini");
				ini_write_real("Scores", "Kills", other.kills);
				var highscore = ini_read_real("Scores", "Highscore", 0);
				if (other.kills > highscore){
					ini_write_real("Scores", "Highscore", other.kills);
				}
				ini_close();
			}
		}
	}else{
		//hitbox hits eneemy
		
		other.alarm[0] = 120;	
		add_screenshake(2,5);
	}
		
}
	
	
ds_list_add(hit_objects, other);
//show_debug_message(other.hp);
if ((other.state != "death") and (other.object_index != obj_boss)){
	other.state = "knockback";
}

other.knockback_speed = knockback * image_xscale;

