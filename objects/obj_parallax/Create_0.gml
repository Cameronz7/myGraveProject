close_red = 140;
close_green = 140;
close_blue = 140;
far_red = 158;
far_green = 158;
far_blue = 158;
close_grey_red = 102;
close_grey_green = 102;
close_grey_blue = 102;
far_grey_red = 127;
far_grey_green = 127;
far_grey_blue = 127;
sky_red = 178;
sky_green = 178;
sky_blue = 178;
cloud_red = 215;
cloud_green = 215;
cloud_blue = 215;
floor_red = 32;
floor_green = 32;
floor_blue = 32;
moon_red = 149;
moon_green = 149;
moon_blue = 149;



rain_grey_close = make_colour_rgb(close_red, close_green, close_blue);
rain_grey_far = make_colour_rgb(far_red, far_green, far_blue);
close_grey = make_colour_rgb(close_grey_red, close_grey_green, close_grey_blue);
far_grey = make_colour_rgb(far_grey_red, far_grey_green, far_grey_blue);
sky_grey =  make_colour_rgb(sky_red, sky_green, sky_blue);
cloud_grey =  make_colour_rgb(cloud_red, cloud_green, cloud_blue);
floor_grey =  make_colour_rgb(floor_red, floor_green, floor_blue);
moon_grey = make_colour_rgb(moon_red, moon_green, moon_blue);


var layer_id = layer_get_id("CloseGravesBackground");
var background_id = layer_background_get_id(layer_id);
layer_background_blend(background_id, close_grey);

layer_id = layer_get_id("FarGravesBackground");
background_id = layer_background_get_id(layer_id);
layer_background_blend(background_id, far_grey);

layer_id = layer_get_id("RainBackground");
background_id = layer_background_get_id(layer_id);
layer_background_blend(background_id, rain_grey_far);

layer_id = layer_get_id("RainBackground_2");
background_id = layer_background_get_id(layer_id);
layer_background_blend(background_id, rain_grey_close);

layer_id = layer_get_id("Background");
background_id = layer_background_get_id(layer_id);
layer_background_blend(background_id, sky_grey);

layer_id = layer_get_id("CloudsBackground");
background_id = layer_background_get_id(layer_id);
layer_background_blend(background_id, cloud_grey);

layer_id = layer_get_id("FloorBackground");
background_id = layer_background_get_id(layer_id);
layer_background_blend(background_id, floor_grey);

layer_id = layer_get_id("GrassBackground");
background_id = layer_background_get_id(layer_id);
layer_background_blend(background_id, floor_grey);

layer_id = layer_get_id("MoonBackground");
background_id = layer_background_get_id(layer_id);
layer_background_blend(background_id, moon_grey);