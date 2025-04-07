switch(state){
	case "read":
		var button1 = instance_create_depth((room_width-left_bound)/2-200,y,0,obj_remap_button);
		var button2 = instance_create_depth((room_width-left_bound)/2+200,y,0,obj_remap_button);

		button1.index = index;
		button2.index = index;
		button1.player = 0;
		button2.player = 1;
		
		state = "ready"

		break;
}