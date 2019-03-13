if (not instance_exists(obj_Skeleton)){
	exit;	
}

var direction_facing = image_xscale;
var distance_to_player = point_distance(x,y,obj_Skeleton.x, obj_Skeleton.y);
if ((distance_to_player <= attack_range) and (distance_to_player > backup_range)){
	state = "attack";	
}


if (distance_to_player > attack_range){
	image_xscale = sign(obj_Skeleton.x - x);
	if (image_xscale == 0){
		image_xscale = 1;
	}
	move_and_collide_enemy(direction_facing * chase_speed, 0);
}

if (distance_to_player <= attack_range){
	
	if(direction_facing != sign(obj_Skeleton.x - x)){
		image_xscale = sign(obj_Skeleton.x - x);
		if (image_xscale == 0){
			image_xscale = 1;
		}
	}
	
	move_and_collide_enemy(-direction_facing * chase_speed, 0);
}