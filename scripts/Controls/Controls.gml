
function Controls(){
	//Key Inputs
	key_left = keyboard_check(ord("A"))
	key_right = keyboard_check(ord("D"))
	key_down = keyboard_check(ord("S"))
	key_up = keyboard_check(ord("W"))
	key_jump = keyboard_check_pressed(ord("W"))
	key_dash = keyboard_check_pressed(vk_shift)
	key_hook = mouse_check_button_pressed(mb_left)
	global.key_use = keyboard_check_pressed(ord("E"))
}