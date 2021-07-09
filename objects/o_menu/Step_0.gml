if(!global.pause) exit;

input_up_p		= keyboard_check_pressed(global.key_up);
input_down_p	= keyboard_check_pressed(global.key_down);
input_enter_p	= keyboard_check_pressed(global.key_enter);
input_revert_p	= keyboard_check_pressed(global.key_revert);

var ds_ = menu_pages[page], ds_height = ds_grid_height(ds_);

if(inputting){
	
	switch(ds_[# 1, menu_option[page]]){
		case menu_element_type.shift:
			var hinput = keyboard_check_pressed(global.key_right) - keyboard_check_pressed(global.key_left);
			if(hinput != 0){
				//audio
				ds_[# 3, menu_option[page]] += hinput;
				ds_[# 3, menu_option[page]] = clamp(ds_[# 3, menu_option[page]], 0, array_length_1d(ds_[# 4, menu_option[page]])-1);
			}
		break;
		
		case menu_element_type.slider:
			//Play a corresponding sound depending on the slider that we are on
			switch(menu_option[page]){//Only play if sound is already not playing
				case 0: if(!audio_is_playing(snd_mas_test)){ audio_play_sound(snd_mas_test, 1, false); } break; //Master volume
				case 1: if(!audio_is_playing(snd_snd_test)){ audio_play_sound(snd_snd_test, 1, false); } break; //Sounds volume
				case 2: if(!audio_is_playing(snd_msc_test)){ audio_play_sound(snd_msc_test, 1, false); } break; //Music volume
			}
			var hinput = keyboard_check(global.key_right) - keyboard_check(global.key_left);
			if(hinput != 0){
				ds_[# 3, menu_option[page]] += hinput*0.01;
				ds_[# 3, menu_option[page]] = clamp(ds_[# 3, menu_option[page]], 0, 1);
				script_execute(ds_[# 2, menu_option[page]], ds_[# 3, menu_option[page]]);
			}
			
		break;
		
		case menu_element_type.toggle:
		var hinput = keyboard_check_pressed(global.key_right) - keyboard_check_pressed(global.key_left);
			if(hinput != 0){
				//audio
				ds_[# 3, menu_option[page]] += hinput;
				ds_[# 3, menu_option[page]] = clamp(ds_[# 3, menu_option[page]], 0, 1);
			}
		break;
		
		case menu_element_type.input:
		var kk = keyboard_lastkey;
		if(kk != vk_enter){
			if(kk != ds_[# 3, menu_option[page]]) //audio
			ds_[# 3, menu_option[page]] = kk;
			variable_global_set(ds_[# 2, menu_option[page]], kk);
		}
		
		break;
	}
	
} else {
	var ochange = input_down_p - input_up_p;
	if(ochange != 0){
		menu_option[page] += ochange;
		if(menu_option[page] > ds_height-1) { menu_option[page] = 0; }
		if(menu_option[page] < 0) { menu_option[page] = ds_height-1; }
		//audio
	}
}

if(input_enter_p){
	switch(ds_[# 1, menu_option[page]]){
		case menu_element_type.script_runner: script_execute(ds_[# 2, menu_option[page]]); break;
		case menu_element_type.page_transfer: page = ds_[# 2, menu_option[page]]; break;
		case menu_element_type.shift:
		case menu_element_type.slider:
		case menu_element_type.toggle: if(inputting){ script_execute(ds_[# 2, menu_option[page]], ds_[# 3, menu_option[page]]); }
		case menu_element_type.input:
			inputting = !inputting;
			break;
	}
	
	//audio
}