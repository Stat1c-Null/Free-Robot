//Everything happens here before anything else happens
//Draw gun on the player
//Make gun follow player's sprite
if(not keyboard_check(ord("A")) and not keyboard_check(ord("W")) and not keyboard_check(ord("D")) and not keyboard_check(ord("S"))){
	x = o_player.x+2
	y = o_player.y-17
} else if(keyboard_check(ord("A")) or (keyboard_check(ord("D")))) {
	x = o_player.x
	y = o_player.y-17
} else if(keyboard_check(ord("W"))) {
	x = o_player.x
	y = o_player.y-25
}



image_angle = point_direction(x,y, mouse_x, mouse_y)

firingdelay -= 1//Delay bullet creation
recoil = max(0, recoil - 1)
if(mouse_check_button(mb_left) and (firingdelay < 0) and global.ammo_limit > 0)
{
	recoil = 4
	firingdelay = 5
	global.ammo_limit -= 1
	//With applies code between curly brackets to whatever object is 
	//in circle brackets instead of actually object where code is written
	with (instance_create_layer(x,y,"Bullets", o_bullet))
	{
		speed = 25
		//other inside of instance with applies code to the object in which we writting code
		direction = other.image_angle + random_range(-3, 3)
		image_angle = direction
	}
}
//Move gun backwards with recoil
x = x - lengthdir_x(recoil, image_angle)
y = y - lengthdir_y(recoil, image_angle)

if(image_angle > 90) and (image_angle < 270)
{
	image_yscale = -0.2
} else {
	image_yscale = 0.2
}



