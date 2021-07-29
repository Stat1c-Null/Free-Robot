shader_set(sh_glow_roofs)

shader_set_uniform_f(uni_add, add)
shader_set_uniform_f(uni_time, current_time / 8000)
draw_self();

shader_reset()

