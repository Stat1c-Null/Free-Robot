
function FlipImage(){
	global.scale = 0.4
	//Flip Image
	if(key_right)
	{
		global.scale = 0.4
		image_xscale = global.scale
	} else if(key_left) {
		global.scale = -0.4
		image_xscale = global.scale
	}
}