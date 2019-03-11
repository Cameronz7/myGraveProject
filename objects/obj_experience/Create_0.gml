
image_speed = 0;
var direction_facing = obj_Skeleton.image_xscale;
if (direction_facing == 1){
	direction = random(80);
}else{
	direction = random_range(100,160);
}
image_angle = direction;
speed = random_range(15,20);