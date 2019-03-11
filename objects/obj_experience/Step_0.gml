if (not instance_exists(obj_Skeleton)){
	exit;
}
var dir = point_direction(x,y, obj_Skeleton.x, obj_Skeleton.y);
var acceleration = 0.2;
motion_add(dir, acceleration);
var max_speed = 3;
if(speed > max_speed){
	speed = max_speed;
}