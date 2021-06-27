///@description Jump Through Platform Collisions
///@param objectName
function jump_thr_collisions(argument0){
	onground = place_meeting(x, y+1, o_wall) or place_meeting(x, y+1, o_jumpthroughplatform)
	var key_jump = keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("W"))
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
	
	if(place_meeting(x,y+1, o_jumpthroughplatform) and (key_jump) and global.jumpthru == true){
		vsp -= jumpspd
		jump_current -= 1
		sprite_index = s_player_jumpstart
		image_speed = 1.2
	} else {
		if(!onground and key_jump and global.jump_stamina > 0 and global.jumpthru == true){
			vsp -= jumpspd
			jump_current -= 1
			if(onwall == 0){
				global.jump_stamina -= 1
			}
			//Animate Jump
			sprite_index = s_player_jump
			image_speed = 1
		}
	}
}
