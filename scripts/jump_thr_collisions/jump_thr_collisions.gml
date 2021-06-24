///@description Jump Through Platform Collisions
///@param objectName
function jump_thr_collisions(argument0){
	with(argument0){
		if(other.vsp > 0)
		{
			if(place_meeting(x, y-other.vsp, other) and !place_meeting(x, y, other))
			{
				while(!place_meeting(x, y-1, other))
				{
					other.y += 1	
				} 
				other.vsp = 0 
			}
		}
	}
}
