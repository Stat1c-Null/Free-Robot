
if(place_meeting(x, y, o_player) and global.key_use and (global.phealth < global.phealth_max)){
	instance_destroy(o_health_box)
	if (global.phealth < global.phealth_max){
		global.phealth += hp_regen
		if (global.phealth  > global.phealth_max){
			global.phealth = global.phealth_max	
		}
	}
}