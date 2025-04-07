function clear_array_cloud(cloud,array){
	//clear array
	for(var i = 0; i < array_length(array); i++){
		//show_debug_message(array[i]);
		//show_debug_message(cloud.id);
		if(array_contains(array[i],cloud.id)){
			//show_debug_message("hello")
			array_delete(array[i],array_get_index(array[i],cloud.id),1);
		}
	}
	
}