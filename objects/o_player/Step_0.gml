/// @description Movement
//Key Inputs
key_left = keyboard_check(vk_left)
key_right = keyboard_check(vk_right)
key_jump = keyboard_check_pressed(vk_space)

//Calculate movement
var move = key_right - key_left//Movement direction

hsp = move * walkspd

vsp += grv

//Jump
if(place_meeting(x, y+1, o_wall)) and (key_jump)
{
	vsp -= jumpspd
}

//Horizontal Collision
if(place_meeting(x+hsp, y, o_wall))
{
	while(!place_meeting(x+sign(hsp), y, o_wall))
	{
		x = x + sign(hsp)
	}
	hsp = 0	
}

x += hsp

//Vertical Collision
if(place_meeting(x, y+vsp, o_wall))
{
	while(!place_meeting(x, y+sign(vsp), o_wall))
	{
		y = y + sign(vsp)
	}
	vsp = 0	
}

y += vsp


