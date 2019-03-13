if (not instance_exists(other)){
	exit;
}
audio_play_sound(a_expr,1,false);
with (other){
	experience += 1;
	if (ult_meter < ult_meter_max){
		ult_meter += 1;
	}
	if (experience >= max_experience){
		level += 1;
		with(obj_spawner){
			enemy_max += 1;
		}
		experience = experience - max_experience;
		max_experience += (max_experience / 5);
		max_hp += 3;
		if (hp + (max_hp/2) >  max_hp){
			hp = max_hp;
		}else{
			hp = hp + (max_hp/2);
		}
		strength += 5;
	}
	
}
instance_destroy();