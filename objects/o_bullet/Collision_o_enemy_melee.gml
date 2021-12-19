/// @description 
//use other so we can refer to specific enemy we hit, not just every enemy on the map
with (other) {
	hp--
	flash = 3
	hitfrom = other.direction//Get current direction of a bullet
	//Hit sound
	audio_play_sound(snd_enemy_hit,2,false)
} 

instance_destroy()