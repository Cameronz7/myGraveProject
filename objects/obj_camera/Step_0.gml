x += random_range(-screenshake, screenshake);
y += random_range(-screenshake, screenshake);

if(not instance_exists(obj_Skeleton)){
	exit;
}

var target_x = obj_Skeleton.x + obj_Skeleton.image_xscale * 6 ;
var target_y = obj_Skeleton.y - 48;
x = lerp(x, target_x, 0.15);
y = lerp(y, target_y, 0.15);

camera_set_view_pos(view_camera[0], x - (width/2), y - (height/2));

