var direction_facing = obj_Skeleton.image_xscale;
if (direction_facing == 1){
	var dir_vir = random_range(20,160);
	if (dir_vir > 70){
		direction = dir_vir - 50;
	}else{
		if (dir_vir >= 110){
			direction = dir_vir + 180;
		}
	}
	
}else{
	direction = random_range(110,230);
}
image_angle = direction;
speed = random_range(3,5);
alarm[0] = random_range(8,14);