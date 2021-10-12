vsp = vsp + grv

//Horizontal Collision
if(place_meeting(x + hsp, y, o_wall))
{
	while(!place_meeting(x+sign(hsp), y, o_wall))
	{
		x = x + sign(hsp)
	}
	hsp = 0
}
x = x + hsp 

//Vertical Collision
if(place_meeting(x, y + vsp, o_wall))
{
	while(!place_meeting(x, y+sign(vsp), o_wall))
	{
		y = y + sign(vsp)
	}
	vsp = 0 
}
y = y + vsp

//Animate 
if(instance_exists(o_player))
{
	var distToPlayer = distance_to_object(o_player)
	moveTowardPlayer = (distToPlayer <= followRange and distToPlayer >= minimumRange)
	if(moveTowardPlayer) {
		sprite_index = s_enemy_run
		image_speed = 1
		mp_potential_step(o_player.x, y, 10, false)
	} else {
		image_speed = 1
		sprite_index = s_enemy_idle	
	}
}

