switch(state){
	case "initial":
		
		var camera_follow = instance_create_depth(room_width/2,room_height/2,-10,obj_camera_follow);
		
		var camera = instance_create_depth(room_width/2,room_height/2,-10,obj_camera);
		camera.follow = camera_follow;
		
		//alarm_set(0,1);
		//alarm_set(1,1);
		//alarm_set(2,1);
		//alarm_set(3,1);
		//alarm_set(4,1);
		
		state = "generate";
		break;
	
	case "generate":
		
		//if(instance_number(obj_cloud)>= 8){
			
		var p1 = instance_create_depth(generate_x,generate_y,-1,obj_player);
		array_push(player_array,p1);
		p1.player = 0;
		
		var p2 = instance_create_depth(room_width - generate_x,generate_y,-1,obj_player);
		array_push(player_array,p2);
		p2.player = 1;
		
		p1.other_player = p2;
		p2.other_player = p1;
		
			//obj_camera_follow.player_array = player_array;
		state = "game";
		//}
		
		update_hitpoint();
		
		break;
		
	case "game":
		
		//for(var i = 0; i<array_length(cloud_array); i++){
		//	if(array_length(cloud_array[i]) < max_cloud_each && alarm_get(i)<0){
		//		alarm_set(i,irandom_range(random_gen_time-random_gen_dev,random_gen_time+random_gen_dev));
		//	}
		//}
		
		//show_debug_message(cloud_array)
		
		//if(instance_number(obj_cloud) < max_cloud && alarm_get(4) <= -1){
		//	alarm_set(4,irandom_range(random_gen_dev,random_gen_time));
		//}
		
		break;
}

//show_debug_message(array_volume(cloud_array))
//show_debug_message(alarm_get(4))