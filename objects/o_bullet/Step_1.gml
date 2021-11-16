/// @description 
if(place_meeting(x,y,o_wall)) 
{
	audio_play_sound(snd_wall_hit1, 3, false)
	instance_destroy()
} else if( place_meeting(x,y,o_jumpthroughplatform)) {
	audio_play_sound(snd_wall_hit2, 3, false)
	instance_destroy()
} else if( place_meeting(x,y,o_hMovingPlat)) {
	audio_play_sound(snd_wall_hit3, 3, false)
	instance_destroy()
} else if( place_meeting(x,y,o_vMovingPlat)) {
	audio_play_sound(snd_wall_hit4, 3, false)
	instance_destroy()
}