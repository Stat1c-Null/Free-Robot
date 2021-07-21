/// @description 

/// @description Parallax Backgrounds
var near = layer_get_id("Background_Near")
var still_near = layer_get_id("Background_StillNear")
var not_near = layer_get_id("Background_NotNear")
var distant = layer_get_id("Background_Distant")

// Move to the place we want to be following the player
x += (xTo - x)/25
y += (yTo - y)/25



//Set camera take x and y position of player as position to move to

if(follow != noone) {
	xTo = follow.x
	yTo = follow.y
}
/*distance_to_player = point_distance(o_player.x, o_player.y, mouse_x, mouse_y)
if(distance_to_player < 900)
{
	xTo = mouse_x
	yTo = mouse_y
} else if(distance_to_player > 900) {
	xTo = o_player.x
	yTo = o_player.y
}

*/

//Dont let camera move outside of the level view
x = clamp(x, 1980/2, room_width-(1980/2))
y = clamp(y, 1080/2, room_height-(1080/2))
layer_x(near, lerp(0, x, 0.5))
layer_x(still_near, lerp(0, x, 0.65))
layer_x(not_near, lerp(0, x, 0.75))
layer_x(distant, lerp(0, x, 0.85))
var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0)
camera_set_view_mat(camera,vm)

