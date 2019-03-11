switch (state){
	case "chase":
		if (not instance_exists(obj_Skeleton)){
			break;	
		}
		if (place_meeting(x,y, obj_Skeleton) and (attacked == false)){
			create_hitbox(x,y, self, sprite_index, knockback, 1 ,damage, image_xscale);
			attacked = true;
		}
		if(attacked == true){
			vspeed = -1;
		}
		break;
	case "death":
		repeat(6){
			instance_create_layer(x + random_range(-4,4), y - 16 + random_range(-4,4), "Effects", obj_feather);
		}
		if (is_dead == 0){
			is_dead = 1;
			if (instance_exists(obj_Skeleton)){
				obj_Skeleton.kills += 1;
				
				var  blood_splatter = instance_create_layer(x , obj_Skeleton.y , "blood_stain", obj_blood_stain);
				blood_splatter.image_index = random_range(0,2);
				repeat (experience){
					var exp_orb = instance_create_layer(x + random_range(-6, 6), y + random_range(-4, 4), "Effects", obj_experience);
					exp_orb.image_index = random(3);
				}
			}
		}
		audio_play_sound(a_crow_pop, 2, false);
		instance_destroy();
		break;

}