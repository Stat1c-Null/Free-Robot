function change_window_mode() {
	//Switch window between fullscreen and windowed
	switch(argument0){
		case 0: window_set_fullscreen(true); break;
		case 1: window_set_fullscreen(false); break;
	}

}
