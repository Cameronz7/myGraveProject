
var camera_id = view_camera[0];
var view_width = camera_get_view_width(camera_id);
var view_height = camera_get_view_height(camera_id);
instance_create_layer(view_width/2,view_height/2 + 100,"Effects", obj_x);