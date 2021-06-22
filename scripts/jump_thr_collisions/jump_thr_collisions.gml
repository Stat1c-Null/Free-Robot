///@description Jump Through Platform Collisions
///@param objectName
function jump_thr_collisions(argument0){
	var key_jump = keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("W"))
	var obj = argument0
	var falling = vsp > 0//Check if we falling
	var platformBelow = instance_place(x, y+vsp, obj)//Check for platform under player
	
	if(falling){
		if(platformBelow != noone) 
		{
			var notClipping = !place_meeting(x, y, platformBelow)
			if(notClipping)//Until there is a platform under player, keep falling
			{
				while(!place_meeting(x, y+1, platformBelow))
				{
					y += 1	
				}
				vsp = 0
			}
		}
	}
	
	var onPlatform = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom + 1, obj, false, false)
	
	if(onPlatform != noone){
		var notInsidePlatform = !collision_rectangle(bbox_left, bbox_bottom-1, bbox_right, bbox_bottom, onPlatform, false, false) 
		if(notInsidePlatform)
		{
			//Jump
		
			if(place_meeting(x, y+1, o_jumpthroughplatform) and (key_jump) and jump_current > 0 and is_dashing == false)
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
		}
	}
}