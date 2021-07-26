
if(place_meeting(x, y, o_player) and global.key_use and (global.jump_stamina < global.jump_stamina_max)and visib == true){
	image_index = 1
	visib = false
	if (global.jump_stamina < global.jump_stamina_max) {
		global.jump_stamina	+= jump_regen
		if (global.jump_stamina  > global.jump_stamina_max){
			global.jump_stamina = global.jump_stamina_max	
		}
	}
}