
if(place_meeting(x, y, o_player) and global.key_use and (global.dash_stamina < global.dash_stamina_max or global.hook_stamina < global.hook_stamina_max)and visib == true){
	image_index = 1
	visib = false
	if (global.dash_stamina < global.dash_stamina_max){
		global.dash_stamina += dash_regen
		if (global.dash_stamina  > global.dash_stamina_max){
			global.dash_stamina = global.dash_stamina_max	
		}
	}
	if (global.hook_stamina < global.hook_stamina_max) {
		global.hook_stamina	+= hook_regen
		if (global.hook_stamina  > global.hook_stamina_max){
			global.hook_stamina = global.hook_stamina_max	
		}
	}
}