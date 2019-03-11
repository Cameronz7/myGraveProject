///@arg death_sprite
///@arg dropped_exp
var death_sprite = argument0;
var dropped_exp = argument1;
//show_debug_message("entering death state");
set_state_sprite(death_sprite, 0.5, 0);

friction = true;

if(image_index >= image_number - 1){
	image_index = image_number - 1;
	image_speed = 0;
	if (image_alpha > 0){
		image_alpha -= 0.01;
	}else{
		//show_debug_message("destroying");
	
		instance_destroy();
	}
	
}

move_and_collide_enemy(knockback_speed, 0);
var knockback_friction = 0.3;
knockback_speed = approach(knockback_speed, 0, knockback_friction);