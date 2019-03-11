if ((instance_exists(obj_Skeleton)) and (state != "attack")){
	var direction_facing = image_xscale;
	var distance_to_player = point_distance(x,y,obj_Skeleton.x, obj_Skeleton.y);
	var other_distance_to_player = point_distance(other.x,other.y,obj_Skeleton.x, obj_Skeleton.y);
	//looking right
	if ((distance_to_player >= other_distance_to_player) and (other.state != "death")){
		waiting_time = 10;
		state = "wait";	
	}
}