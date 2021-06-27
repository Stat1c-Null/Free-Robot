/// @description Player Variables
//Default Variables
room_speed = 60
hsp = 0
vsp = 0
grv = 0.5
walk_speed = 10
state = pState.normal
fullscreen_counter = 0

//Stamina
global.phealth = 100
global.phealth_max = 100
global.jump_stamina = 12
global.jump_stamina_max = 12
global.dash_stamina = 10
global.dash_stamina_max = 10
global.hook_stamina = 7
global.hook_stamina_max = 7
global.jumpthru = false

//Jumping
jumpspd = 14
jump_max = 2
jump_current = jump_max


//Wall Jumps
onground = false
onwall = 0
dust = 0
grv_wall = 0.2//Gravity when player is on the wall
hsp_wall_jump = 13//Speed at which we jump away from the wall horizontally
vsp_wall_jump = -13
wall_jump_delay = 0//dont allow player to jump up one wall
wall_jump_delay_max = 17

//Dashing
is_dashing = false
dash_max = 2
dash_current = dash_max
dash_speed = walk_speed * 1.5
dash_counter = 0

//Hooks
swing_move_acceleration = 0.08//How much can player swing using left and right keys while on the rope
distance_toHook = 500//Max hook distance

enum pState 
{
	normal, 
	swing
}


