/// @description Movement
//Key Inputs
var key_left = keyboard_check(vk_left) or keyboard_check(ord("A"))
var key_right = keyboard_check(vk_right) or keyboard_check(ord("D"))
var key_jump = keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"))
var key_dash = keyboard_check_pressed(vk_shift)


#region MOVEMENT
	//Calculate movement
	var move = key_right - key_left//Movement direction

	//Horizontal Movement
	//Move as long as player doesnt dash
	if(is_dashing == false and wall_jump_delay == 0) {
		hsp = move * walk_speed
	}
#endregion

#region JUMPING
	//Gravity
	//if we are dashing, do not apply gravity because player enters jesus state while dashing
	if(is_dashing == false){
		vsp += grv
	} else {
		vsp = 0	
	}

	//Jump
	if(place_meeting(x, y+1, o_wall) and (key_jump) and jump_current > 0 and is_dashing == false)
	{
		//Subtract jump speed from vertical speed because gamemaker is retarded and goes up y axis only if numbers are negative
		vsp -= jumpspd
		jump_current -= 1
	} else {
		//In the air
		if (key_jump) and jump_current > 0 {
			vsp -= jumpspd
			jump_current -= 1
		}
	}

	//Wall Jump
	onground = place_meeting(x, y+1, o_wall)
	onwall = place_meeting(x+1, y, o_wall) - place_meeting(x-1, y, o_wall)
	wall_jump_delay = max(wall_jump_delay - 1, 0)
	//Actual Wall jump Logic
	//Check if we are on the wall not on ground and pressing jump key
	if(onwall != 0 and !onground and key_jump)
	{
		wall_jump_delay = wall_jump_delay_max
		hsp = -onwall * hsp_wall_jump
		vsp = vsp_wall_jump
	}
	//Wall Sliding
	var grv_final = grv
	var vsp_max_final = walk_speed
	if (onwall != 0 and vsp > 0)//If we are on the wall, apply wall gravity
	{
		grv_final = grv_wall
		vsp_max_final = vsp_wall_jump
		vsp += grv_final
		vsp = clamp(vsp, -grv_final*7, grv_final*7)
	}
	
	//Check if we are off the ground and on the wall
	//Dust from been on the wall
	if(!onground and onwall != 0){
		var side = bbox_left//Create Dust on left by default
		if(onwall == 1) side = bbox_right//But if we are on right wall, switch it the right obviously
		dust++
		//Create Dust
		if((dust > 2) and (vsp > 0)) with (instance_create_layer(side, bbox_top, "Behind", o_dust))
		{
			other.dust = 0
			hspeed = other.onwall * 0.5
		}
	} else {//If we are off the wall reset dust and turn it off
		dust = 0	
	}
#endregion

#region COLLISION
	//Horizontal Collision
	if(place_meeting(x+hsp, y, o_wall))
	{
		while(!place_meeting(x+sign(hsp), y, o_wall))
		{
			x += sign(hsp)
		}
		hsp = 0	
	}

	x += hsp

	//Vertical Collision
	if(place_meeting(x, y+vsp, o_wall))
	{
		while(!place_meeting(x, y+sign(vsp), o_wall))
		{
			y += sign(vsp)
		}
		vsp = 0	
		jump_current = jump_max//Reset jumps ones player landed
	}

	y += vsp
#endregion

#region DASH
//Dash
if(key_dash and is_dashing == false) {
	is_dashing = true
	alarm[0] = room_speed / 3//Dash Duration Alarm
	
	//Get direction of dash
	var horizontal_dir = sign(move)
	
	hsp += dash_speed * horizontal_dir
}

if(is_dashing){
	dash_counter += 1
	if(dash_counter mod 120){
		instance_create_depth(x, y, depth + 1, o_player_effect)
	}
}
#endregion DASH


