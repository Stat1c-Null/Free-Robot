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
		show_debug_message("Check 1")
		var notInsidePlatform = !collision_rectangle(bbox_left, bbox_bottom-1, bbox_right, bbox_top, onPlatform, false, false) 
		if(notInsidePlatform)
		{
			//Jump
			show_debug_message("Check 2")
			if(place_meeting(x, y+1, obj) and key_jump)
			{
				vsp -= 10
			}
			
		}
	}
}

/*	//Subtract jump speed from vertical speed because gamemaker is retarded and goes up y axis only if numbers are negative
				vsp -= jumpspd
				jump_current -= 1
				sprite_index = s_player_jumpstart
				image_speed = 1
			} else {
				//In the air
				if (key_jump) and jump_current > 0 and global.jump_stamina > 0{
					vsp -= jumpspd
					jump_current -= 1
					global.jump_stamina -= 1
					//Animate Jump
					sprite_index = s_player_jump
					image_speed = 1
				}
			}
			*/
			