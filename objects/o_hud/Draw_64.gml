/// @description 
draw_set_font(fnt_text)

if(instance_exists(o_player)){
	//Health
	draw_text(20, 20, "CONDITION")
	draw_sprite(s_hud_back, 1, 20, 34)
	draw_sprite_ext(s_hud_health, 1, 20, 34, max(0, global.phealth/global.phealth_max), 1, 0, c_white,1)
	//Jump Stamina
	draw_text(20, 90, "AIRPUMP")
	draw_sprite(s_hud_back, 1, 20, 104)
	draw_sprite_ext(s_hud_jump, 1, 20, 104, max(0, global.jump_stamina/global.jump_stamina_max), 1, 0, c_white,1)
	//Dash Stamina
	draw_text(20, 160, "SPEED DASH")
	draw_sprite(s_hud_back, 1, 20, 174)
	draw_sprite_ext(s_hud_dash, 1, 20, 174, max(0, global.dash_stamina/global.dash_stamina_max), 1, 0, c_white,1)
	//Hook Stamina
	draw_text(20, 230, "SKY HOOK")
	draw_sprite(s_hud_back, 1, 20, 244)
	draw_sprite_ext(s_hud_hook, 1, 20, 244, max(0, global.hook_stamina/global.hook_stamina_max), 1, 0, c_white,1)
	//Ammo Limit
	draw_text(20, 300, "AMMO")
	draw_sprite(s_hud_back, 1, 20, 314)
	draw_sprite_ext(s_hud_ammo, 1, 20, 314, max(0, global.ammo_limit/global.ammo_limit_max), 1, 0, c_white,1)
	//Overheat
	draw_text(20, 370, "WEAPON HEAT")
	draw_sprite(s_hud_back, 1, 20, 384)
	draw_sprite_part_ext(s_hud_overheat, 1, 0, 0, global.overheat, 38, 20, 384, 1, 1, c_white, 1)
}




