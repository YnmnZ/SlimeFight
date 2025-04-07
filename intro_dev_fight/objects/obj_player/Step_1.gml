switch(state){
	case "initial":
	
		mask = instance_create_depth(x,y,0,obj_mask);
		mask.image_index = player;
		mask.owner = self;
		

		left = global.control_setting[player][0];
		right = global.control_setting[player][1];
		jump = global.control_setting[player][2];
		dash = global.control_setting[player][3];
		attack = global.control_setting[player][4];
		block = global.control_setting[player][5];
		down = global.control_setting[player][6];


		
		head = instance_create_depth(x,y,-10,obj_player_head);
		head.owner = self;
		
		state = "game";
		//audio_play_sound(snd_spawn,1,false);
		animation_state = "up";
		x_vel = irandom_range(-10,10);
		y_vel = return_vel;
		break;
}