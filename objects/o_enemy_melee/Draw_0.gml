/// @description
draw_self();

if (flash > 0)
{
	shader_set(sh_white_flash)
	draw_self()
	shader_reset()
	flash--;
}