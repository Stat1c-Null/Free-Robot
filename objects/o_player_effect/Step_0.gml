/// @description 

key_left = keyboard_check(vk_left) or keyboard_check(ord("A"))
key_right = keyboard_check(vk_right) or keyboard_check(ord("D"))

image_alpha -= fade_speed

if(image_alpha <= 0) {
	instance_destroy()
}

FlipImage()