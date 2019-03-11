///@arg allowed
var allowed = argument0;
if (allowed == 1){
	right = keyboard_check(vk_right);
	left = keyboard_check(vk_left);
	rolling = keyboard_check_pressed(vk_space);
	attacking = keyboard_check_pressed(vk_lcontrol);
	if ((right) and (left)){
		left = false;
	}

}