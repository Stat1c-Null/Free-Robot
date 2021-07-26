
if(place_meeting(x, y, o_player) and global.key_use and (global.ammo_limit < global.ammo_limit_max)){
	instance_destroy(o_ammo_box)
	if (global.ammo_limit < global.ammo_limit_max){
		global.ammo_limit += ammo_refill
		if (global.ammo_limit  > global.ammo_limit_max){
			global.ammo_limit = global.ammo_limit_max	
		}
	}
}