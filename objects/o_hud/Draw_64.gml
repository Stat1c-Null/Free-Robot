/// @description 
draw_set_font(fnt_text)

if(instance_exists(o_player)){
	//Health
	draw_sprite_ext(s_final_health, 1, 96, 49, max(0, global.phealth/global.phealth_max), 1, 0, c_white,1)
	draw_sprite(s_final_back_health, 1, 68, 45)
	
	//Dash Stamina
	draw_sprite(s_energyBarBack, 1, 30, 120)
	draw_sprite_ext(s_energybarFront, 1, 96, 119, max(0, global.dash_stamina/global.dash_stamina_max), 1, 0, c_white,1)

	//Jump Stamina
	draw_sprite(s_hud_back, 1, 30, 680)
	draw_sprite_ext(s_hud_jump, 1, 30,680, max(0, global.jump_stamina/global.jump_stamina_max), 1, 0, c_white,1)
	//Hook Stamina
	draw_sprite(s_hud_back, 1, 30, 730)
	draw_sprite_ext(s_hud_hook, 1, 30, 730, max(0, global.hook_stamina/global.hook_stamina_max), 1, 0, c_white,1)
	
	//Ammo Limit
	draw_sprite(s_hud_back, 1, 1060, 680)
	draw_sprite_ext(s_hud_ammo, 1, 1060, 680, max(0, global.ammo_limit/global.ammo_limit_max), 1, 0, c_white,1)
	//Overheat
	draw_sprite(s_hud_back, 1, 1060, 730)
	draw_sprite_part_ext(s_hud_overheat, 1, 0, 0, global.overheat, 38, 1060, 730, 1, 1, c_white, 1)
}




