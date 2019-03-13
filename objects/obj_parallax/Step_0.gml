
if (not instance_exists(obj_camera)){
	exit;
}
var trans_val = 0.00005;
if (instance_exists(obj_Skeleton)){
	if (obj_Skeleton.level > 1){
		close_red = lerp(close_red, 153, trans_val);
		close_green = lerp(close_green, 15, trans_val);
		close_blue = lerp(close_blue, 20, trans_val);
		far_red = lerp(far_red, 204, trans_val);
		far_green = lerp(far_green, 81, trans_val);
		far_blue = lerp(far_blue,85, trans_val);
		close_grey_red = lerp(close_grey_red, 147, trans_val);
		close_grey_green = lerp(close_grey_green, 9, trans_val);
		close_grey_blue = lerp(close_grey_blue, 12, trans_val);
		far_grey_red = lerp(far_grey_red, 96, trans_val);
		far_grey_green = lerp(far_grey_green, 6, trans_val);
		far_grey_blue = lerp(far_grey_blue, 9, trans_val);
		sky_red = lerp(sky_red, 220, trans_val);
		sky_green = lerp(sky_green, 99, trans_val);
		sky_blue = lerp(sky_blue, 99, trans_val);
		cloud_red = lerp(cloud_red, 198, trans_val);
		cloud_green = lerp(cloud_green, 89, trans_val);
		cloud_blue = lerp(cloud_blue, 89, trans_val);
		floor_red = lerp(floor_red, 71, trans_val);
		floor_green = lerp(floor_green, 4, trans_val);
		floor_blue = lerp(floor_blue, 6, trans_val);
		moon_red = lerp(moon_red, 170, trans_val);
		moon_green = lerp(moon_green, 16, trans_val);
		moon_blue = lerp(moon_blue, 21, trans_val);



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
	}
}

layer_x("RainBackground_2", obj_camera.x / 3);
layer_x("CloseGravesBackground", obj_camera.x / 2.5);
layer_x("FarGravesBackground", obj_camera.x / 1.8);
layer_x("RainBackground", obj_camera.x / 1.6);
layer_x("CloudsBackground", obj_camera.x / 1.2);
layer_x("MoonBackground", obj_camera.x  + 80);
layer_y("MoonBackground", obj_camera.y  - 85);
