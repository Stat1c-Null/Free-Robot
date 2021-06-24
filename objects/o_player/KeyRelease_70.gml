/// @description Insert description here
// You can write your code in this editor
fullscreen_counter += 1
if (fullscreen_counter == 1){
	window_set_fullscreen(true)
} else if(fullscreen_counter == 2){
	window_set_fullscreen(false)
	fullscreen_counter = 0
}