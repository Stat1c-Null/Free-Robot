if(hp <= 0) {
	instance_create_layer(x,y-50,"DeadEnemyIsAGoodEnemy", o_melee_dead)
	instance_destroy()
}