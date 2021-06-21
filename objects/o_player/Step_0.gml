/// @description Movement
//Key Inputs
key_left = keyboard_check(vk_left) or keyboard_check(ord("A"))
key_right = keyboard_check(vk_right) or keyboard_check(ord("D"))
key_down = keyboard_check(vk_down) or keyboard_check(ord("S"))
key_up = keyboard_check(vk_up) or keyboard_check(ord("W"))
var key_jump = keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("W"))
var key_dash = keyboard_check_pressed(vk_shift)
var key_hook = mouse_check_button_pressed(mb_left)
onwall = place_meeting(x+1, y, o_wall) - place_meeting(x-1, y, o_wall)
onground = place_meeting(x, y+1, o_wall)
switch (state)
{
	case pState.normal: 
	{
		#region MOVEMENT
			//Dont let stamina go over board
			if(global.phealth > global.phealth_max){
				global.phealth = global.phealth_max	
			}
			if (global.phealth < 0)
			{
				global.phealth = 0	
			}
			//Calculate movement
			var move = key_right - key_left//Movement direction
			var ground_accel = .1
			var ground_deccel = .12
			
			
			//Horizontal Movement
			//Move as long as player doesnt dash
			if(is_dashing == false and wall_jump_delay == 0 and onground) {
				acceleration(ground_accel, ground_deccel, walk_speed)
				image_speed = 1
				if (not pressingKeys()) { // Idle sprite
					sprite_index = s_player_idle
				} else {//Running sprite
					sprite_index = s_player_running
				}
				FlipImage()
			} else {
				// In air
				acceleration(ground_accel, ground_deccel, walk_speed/2)
			}
			
			//Push away from the wall
			if(onground and onwall != 0 and key_right)
			{
				hsp += walk_speed/2
			} else if(onground and onwall != 0 and key_left) {
				hsp -= walk_speed/2	
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
			
			//Dont let stamina go over board
			if(global.jump_stamina > global.jump_stamina_max){
				global.jump_stamina = global.jump_stamina_max	
			}
			if (global.jump_stamina < 0)
			{
				global.jump_stamina = 0	
			}
			//Jump
			if(place_meeting(x, y+1, o_wall) and (key_jump) and jump_current > 0 and is_dashing == false)
			{
				//Subtract jump speed from vertical speed because gamemaker is retarded and goes up y axis only if numbers are negative
				vsp -= jumpspd
				jump_current -= 1
			} else {
				//In the air
				if (key_jump) and jump_current > 0 and global.jump_stamina > 0{
					vsp -= jumpspd
					jump_current -= 1
					global.jump_stamina -= 1
					//Animate Jump
					sprite_index = s_player_jump
					image_speed = 1.1
				}
			}

			//Wall Jump
			wall_jump_delay = max(wall_jump_delay - 1, 0)
			//Animate first jump
			if(not onground and vsp < 0 and jump_current == 2)
			{
				sprite_index = s_player_jumpstart
				image_speed = 1
			}
			
			//Falling Down
			if(not onground and vsp > 0)
			{
				sprite_index = s_player_fall
				FlipImage()
			}
			//Actual Wall jump Logic
			//Check if we are on the wall not on ground and pressing jump key
			if(onwall != 0 and !onground and key_jump)
			{
				wall_jump_delay = wall_jump_delay_max
				hsp = -onwall * hsp_wall_jump
				vsp = vsp_wall_jump
				global.jump_stamina += 1
				sprite_index = s_player_slide
			}
			//Wall Sliding
			var grv_final = grv
			if (onwall != 0 and vsp > 0 and !onground)//If we are on the wall, apply wall gravity
			{
				grv_final = grv_wall
				vsp += grv_final
				vsp = clamp(vsp, -grv_final*7, grv_final*7)
				sprite_index = s_player_slide
				image_speed = 0
				if(onwall == 1){
					image_xscale = 0.4	
				} else {
					image_xscale = -0.4	
				}
				if(key_left or key_right){
					wall_jump_delay = wall_jump_delay_max
					hsp = -onwall * hsp_wall_jump/2
					vsp = vsp_wall_jump/2
					global.jump_stamina += 1
					sprite_index = s_player_slide
				}
			}
	
			//Check if we are off the ground and on the wall
			//Dust from been on the wall
			if(!onground and onwall != 0){
				var side = bbox_left//Create Dust on left by default
				if(onwall == 1) side = bbox_right//But if we are on right wall, switch it the right obviously
				dust++
				//Create Dust
				if((dust > 2) and (vsp > 0)) with (instance_create_layer(side, bbox_top + 10, "Behind", o_dust) and instance_create_layer(side, bbox_bottom + 25, "Behind", o_dust))
				{
					other.dust = 0
					hspeed = other.onwall * 0.5
				}
			} else {//If we are off the wall reset dust and turn it off
				dust = 0	
			}
			
			
		#endregion

		#region DASH
		
		//Dont let stamina go over board
		if(global.dash_stamina > global.dash_stamina_max){
			global.dash_stamina = global.dash_stamina_max	
		}
		if (global.dash_stamina < 0)
		{
			global.dash_stamina = 0	
		}
		//Dash
		if(key_dash and is_dashing == false and global.dash_stamina > 0) {
			is_dashing = true
			sprite_index = s_player_dash
			global.dash_stamina -= 1
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
		
		#region HOOK
		//Dont let stamina go over board
		if(global.hook_stamina > global.hook_stamina_max){
			global.hook_stamina = global.hook_stamina_max	
		}
		if (global.hook_stamina < 0)
		{
			global.hook_stamina = 0	
		}
		//Check if we are clicking mouse
		if(key_hook and global.hook_stamina > 0){
			//Find distance between player and place they want to grapple on
			dist = point_distance(o_player.x, o_player.y, mouse_x, mouse_y)
			//Check if player is trying to grapple with a wall and their arent too far away
			if(place_meeting(mouse_x, mouse_y, o_wall) and (dist < distance_toHook))
			{
				sprite_index = s_player_fall
				global.hook_stamina -= 1
				grappleX = mouse_x
				grappleY = mouse_y
				ropeX = x
				ropeY = y
				ropeAngleVelocity = 0//How quickly player swings
				ropeAngle = point_direction(grappleX, grappleY, x, y)//Angle of swing
				ropeLength = point_distance(grappleX, grappleY, x, y)
				state = pState.swing
			}
		}
		#endregion
	} break
	//Swinging on the hook
	case pState.swing:
	{
		var ropeAngleAcceleration = -0.2 * dcos(ropeAngle)//Calculate how much to swing
		
		ropeAngleAcceleration += (key_right - key_left) * swing_move_acceleration//Let player swing left and right
		ropeLength += (key_down - key_up) * 2//Allow player to go up and down the rope
		ropeLength = max(ropeLength, 5)
		
		ropeAngleVelocity += ropeAngleAcceleration
		ropeAngle += ropeAngleVelocity
		ropeAngleVelocity *= 0.99
		//Calculate length of the rope and where it should be
		ropeX = grappleX + lengthdir_x(ropeLength, ropeAngle)
		ropeY = grappleY + lengthdir_y(ropeLength, ropeAngle)
		//Apply swinging
		hsp = ropeX - x
		vsp = ropeY - y
		FlipImage()
		
		if(keyboard_check_pressed(vk_space))
		{
			state = pState.normal	
			vsp += grv
		}
		
		
	}break
	
}

#region COLLISION
		//Horizontal Collision
		if(place_meeting(x+hsp, y, o_wall))
		{
			while(!place_meeting(x+sign(hsp), y, o_wall))
			{
				x += sign(hsp)
			}
			//If rope collides with wall stop swinging
			if(state = pState.swing)
			{
				ropeAngle = point_direction(grappleX, grappleY, x, y)
				ropeAngleVelocity = 0
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
			//If rope collides with wall stop swinging
			if(state = pState.swing)
			{
				ropeAngle = point_direction(grappleX, grappleY, x, y)
				ropeAngleVelocity = 0
			}
			vsp = 0	
			jump_current = jump_max//Reset jumps ones player landed
		}
		
		

		y += vsp
#endregion


