/// @description 
draw_set_font(fnt_text)
//Health
if(instance_exists(o_player)){
	draw_text(20, 20, "CONDITION")
	draw_sprite(s_hud_back, 1, 20, 30)
	draw_sprite_ext(s_hud_health, 1, 20, 30, max(0, global.phealth/global.phealth_max), 1, 0, c_white,1)
}

//Jump Stamina
if(instance_exists(o_player)){
	draw_text(20, 90, "AIRPUMP")
	draw_sprite(s_hud_back, 1, 20, 104)
	draw_sprite_ext(s_hud_jump, 1, 20, 104, max(0, global.jump_stamina/global.jump_stamina_max), 1, 0, c_white,1)
}

//Dash Stamina
if(instance_exists(o_player)){
	draw_text(20, 164, "SPEED DASH")
	draw_sprite(s_hud_back, 1, 20, 180)
	draw_sprite_ext(s_hud_dash, 1, 20, 180, max(0, global.dash_stamina/global.dash_stamina_max), 1, 0, c_white,1)
}

//Hook Stamina
if(instance_exists(o_player)){
	draw_text(20, 240, "SKY HOOK")
	draw_sprite(s_hud_back, 1, 20, 254)
	draw_sprite_ext(s_hud_hook, 1, 20, 254, max(0, global.hook_stamina/global.hook_stamina_max), 1, 0, c_white,1)
}
