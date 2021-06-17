/// @description Player Variables
//Default Variables
room_speed = 60
hsp = 0
vsp = 0
grv = 0.5
walk_speed = 8
state = pState.normal

//Jumping
jumpspd = 11
jump_max = 3
jump_current = jump_max

//Wall Jumps
onground = false
onwall = 0
dust = 0
grv_wall = 0.2//Gravity when player is on the wall
hsp_wall_jump = 8//Speed at which we jump away from the wall horizontally
vsp_wall_jump = -7
wall_jump_delay = 0//dont allow player to jump up one wall
wall_jump_delay_max = 17

//Dashing
is_dashing = false
dash_speed = walk_speed * 1.5
dash_counter = 0

//Hooks
swing_move_acceleration = 0.08//How much can player swing using left and right keys while on the rope

enum pState 
{
	normal, 
	swing
}


