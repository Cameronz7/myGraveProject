var hp_x = 8;
var hp_y = 8;
var hp_width = 198;
var hp_height = 6;
if (instance_exists(obj_Skeleton)){
	draw_hp = lerp(draw_hp, obj_Skeleton.hp, 0.2);
	draw_max_hp = obj_Skeleton.max_hp;
	
	
	
	var camera_id = view_camera[0];
	var view_width = camera_get_view_width(camera_id);
	var view_height = camera_get_view_height(camera_id);
	
		if((obj_Skeleton.ult_meter == obj_Skeleton.ult_meter_max) and (obj_Skeleton.ult_state == false)){
			draw_sprite(s_x, 0,view_width/2, view_height/2 + 8);
		}
		if (obj_Skeleton.ult_state == true){
			draw_ult = lerp(draw_ult, (obj_Skeleton.ult_time), 0.2);	
			draw_max_ult = obj_Skeleton.ult_time_max;
			
		}else{
			draw_ult = lerp(draw_ult, obj_Skeleton.ult_meter, 0.2);	
			draw_max_ult = obj_Skeleton.ult_meter_max;
		}
	
}else{
	draw_hp = lerp(draw_hp, 0, 0.2);
	draw_ult = lerp(draw_ult, 0, 0.2);
}

var ult_percent = draw_ult / draw_max_ult;
//show_debug_message("ult_percent: " + string(draw_ult) + " / " + string(draw_max_ult));
var hp_percent = draw_hp / draw_max_hp;

draw_rectangle_color(hp_x, hp_y, hp_x + (hp_width * hp_percent), hp_y + hp_height, c_white, c_white, c_white,c_white, false);
draw_line_width_color(hp_x - 1, hp_y - 1, hp_x + hp_width, hp_y - 1, 1, c_dkgray, c_dkgray);
draw_line_width_color(hp_x - 1, hp_y + hp_height, hp_x + hp_width, hp_y + hp_height, 1, c_dkgray, c_dkgray);
draw_line_width_color(hp_x - 1, hp_y - 1, hp_x - 1, hp_y + hp_height, 1, c_dkgray, c_dkgray);
draw_line_width_color(hp_x + hp_width, hp_y - 1, hp_x + hp_width, hp_y + hp_height, 1, c_dkgray, c_dkgray);

hp_y += 7;

draw_rectangle_color(hp_x, hp_y, hp_x + (hp_width * ult_percent), hp_y + hp_height, c_red, c_red, c_red,c_red, false);
draw_line_width_color(hp_x - 1, hp_y - 1, hp_x + hp_width, hp_y - 1, 1, c_dkgray, c_dkgray);
draw_line_width_color(hp_x - 1, hp_y + hp_height, hp_x + hp_width, hp_y + hp_height, 1, c_dkgray, c_dkgray);
draw_line_width_color(hp_x - 1, hp_y - 1, hp_x - 1, hp_y + hp_height, 1, c_dkgray, c_dkgray);
draw_line_width_color(hp_x + hp_width, hp_y - 1, hp_x + hp_width, hp_y + hp_height, 1, c_dkgray, c_dkgray);

if (not instance_exists(obj_Skeleton)){
	exit;
}
var text = "Kills: " + string(obj_Skeleton.kills);
var text_width = string_width(text);
var text_height = string_height(text);
var start_x = 8;
var start_y = 26;
var padding_x = 4;
var padding_y = 4; 

draw_rectangle_color(start_x, start_y, start_x + text_width + padding_x, start_y + text_height + padding_y, c_dkgray, c_dkgray ,c_dkgray ,c_dkgray, false);
draw_text(start_x + (padding_x / 2), start_y + padding_y, text);

var text = "Level: " + string(obj_Skeleton.level);
start_x += text_width + padding_x * 3;
var text_width = string_width(text);
var text_height = string_height(text);



draw_rectangle_color(start_x, start_y, start_x + text_width + padding_x, start_y + text_height + padding_y, c_dkgray, c_dkgray ,c_dkgray ,c_dkgray, false);
draw_text(start_x + (padding_x / 2), start_y + padding_y, text);

