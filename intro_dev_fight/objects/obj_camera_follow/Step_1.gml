if(array_length(player_array)>1){
	var p1 = player_array[0];
	var p2 = player_array[1];
	x = round(p1.x+p2.x)/2;
	//y = round(p1.y+p2.y)/2
	y = min(round(p1.y+p2.y)/2,room_height/2);
	y = max(80,y);
	//show_debug_message(y);
	//show_debug_message(room_height/2)
}else if(array_length(player_array)>0){
	var p1 = player_array[0];
	x = p1.x;
	y = p1.y;
}
else{
	x = room_width / 2;
	y = room_height / 2;
}