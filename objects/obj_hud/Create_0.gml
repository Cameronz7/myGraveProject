
var camera_id = view_camera[0];
var view_width = camera_get_view_width(camera_id);
var view_height = camera_get_view_height(camera_id);
display_set_gui_size(view_width, view_height);
if (not instance_exists(obj_Skeleton)){
	exit;
}
draw_hp = obj_Skeleton.hp;
draw_max_hp = obj_Skeleton.max_hp;

draw_ult = obj_Skeleton.ult_meter;
draw_max_ult = obj_Skeleton.ult_meter_max;
draw_set_font(f_one);

audio_play_sound(a_music, 4, true);