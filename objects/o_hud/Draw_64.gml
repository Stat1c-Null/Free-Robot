/// @description 

//Health
if(instance_exists(o_player)){
	draw_sprite(s_hud_back, 1, 20, 9)
	draw_sprite_ext(s_hud_health, 1, 20, 9, max(0, global.phealth/global.phealth_max), 1, 0, c_white,1)
}

//Jump Stamina
if(instance_exists(o_player)){
	draw_sprite(s_hud_back, 1, 20, 64)
	draw_sprite_ext(s_hud_jump, 1, 20, 64, max(0, global.jump_stamina/global.jump_stamina_max), 1, 0, c_white,1)
}

//Dash Stamina
if(instance_exists(o_player)){
	draw_sprite(s_hud_back, 1, 20, 124)
	draw_sprite_ext(s_hud_dash, 1, 20, 124, max(0, global.dash_stamina/global.dash_stamina_max), 1, 0, c_white,1)
}

//Hook Stamina
if(instance_exists(o_player)){
	draw_sprite(s_hud_back, 1, 20, 179)
	draw_sprite_ext(s_hud_hook, 1, 20, 179, max(0, global.hook_stamina/global.hook_stamina_max), 1, 0, c_white,1)
}
