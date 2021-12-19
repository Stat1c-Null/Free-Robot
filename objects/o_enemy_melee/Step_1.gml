if(hp <= 0) {
	with(instance_create_layer(x,y-50,"DeadEnemyIsAGoodEnemy", o_melee_dead)){
		direction = other.hitfrom
		hsp = lengthdir_x(10, direction)
		vsp = lengthdir_y(10, direction) - 2
		if(sign(hsp) != 0) image_xscale = sign(hsp)
	}
	instance_destroy()
} else if(hp < hp_max) {
	isAttacking = true	
}