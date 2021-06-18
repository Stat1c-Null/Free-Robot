/// @description 

// Move to the place we want to be following the player
x += (xTo - x)/25
y += (yTo - y)/25

if(follow != noone)
{
	//Set camera take x and y position of player as position to move to
	xTo = follow.x
	yTo = follow.y
}

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0)
camera_set_view_mat(camera,vm)

