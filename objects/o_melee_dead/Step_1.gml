direction = hitfrom
hsp = lengthdir_x(1000, direction) //Push player away from the bullet when they die
vsp = lengthdir_y(1000, direction)
image_xscale = sign(dir) * 0.5