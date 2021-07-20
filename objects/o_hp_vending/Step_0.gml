
if(place_meeting(x, y, o_player) and global.key_use and (global.phealth < global.phealth_max or global.jump_stamina < global.jump_stamina_max)and visib == true){
	image_index = 1
	visib = false
	if (global.phealth < global.phealth_max){
		global.phealth += hp_regen
		if (global.phealth  > global.phealth_max){
			global.phealth = global.phealth_max	
		}
	}
	if (global.jump_stamina < global.jump_stamina_max) {
		global.jump_stamina	+= jump_regen
		if (global.jump_stamina  > global.jump_stamina_max){
			global.jump_stamina = global.jump_stamina_max	
		}
	}
}