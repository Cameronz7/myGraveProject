my_grey = make_colour_rgb(32, 32, 32);
draw_text_color(4 * (view_width/10) - 15, view_height/4 - 24, "You Died", my_grey,my_grey,my_grey,my_grey,1);
draw_text_color(4 * (view_width/10) - 15, view_height/4, "Kills: " + string(kills), my_grey,my_grey,my_grey,my_grey,1);
draw_text_color(4 * (view_width/10) - 32 - 20, view_height/4 + 24, "Highscore: " + string(highscore), my_grey,my_grey,my_grey,my_grey,1);