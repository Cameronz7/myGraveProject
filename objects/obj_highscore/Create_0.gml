ini_open("save.ini");
kills = ini_read_real("Scores", "Kills", 0);
highscore = ini_read_real("Scores", "Highscore", 0);
//show_debug_message("highscore made");
draw_set_font(f_two);
var camera_id = view_camera[0];
view_width = camera_get_view_width(camera_id);
view_height = camera_get_view_height(camera_id);
display_set_gui_size(view_width, view_height);