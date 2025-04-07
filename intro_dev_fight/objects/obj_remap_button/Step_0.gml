switch(state){
	case "read":
		key = global.control_setting[player][index];
		state = "ready";
		break;
	
	case "ready":
		if(mouse_check_button_pressed(mb_left) && place_meeting(x,y,obj_cursor)){
			obj_remap_button.ready_to_input = false;
			ready_to_input = true;
		}
		
		if(ready_to_input){
			if(keyboard_check_pressed(vk_anykey) && keyboard_key != vk_escape){
				global.control_setting[player][index] = keyboard_key;
				if(keyboard_key == vk_shift){
					if(keyboard_check_pressed(vk_lshift)){
						global.control_setting[player][index] = 160;
					}else{
						global.control_setting[player][index] = 161;
					}
				}
				ready_to_input = false;
				key = global.control_setting[player][index];
			}
		}
		break;
}