if (sprite_index == s_skeleton_ult_attack){
	visible = true;
	
	move_and_collide_enemy((4 * image_xscale),0);
}else{
	visible = false;
}
if (sound_playing > 0){
	sound_playing -= 1;
}