/// @description 
//use other so we can refer to specific enemy we hit, not just every enemy on the map
with (other) {
	hp--
	flash = 3
	global.hitfrom = other.direction//Get current direction of a bullet
} 

instance_destroy()