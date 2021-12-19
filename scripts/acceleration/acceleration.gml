function acceleration(argument0, argument1, argument2){
	///@param accel
	///@param deccel
	///@param maxHsp
	
	var keyPressed = key_right - key_left//Movement direction
	var accel = argument0
	var deccel = argument1
	var userMaxHsp = argument2
	
	if(pressingKeys())
	{
		hsp = lerp(hsp, userMaxHsp*keyPressed, accel)
		
		
	} else {
		hsp = lerp(hsp, 0, deccel)	
	}
}