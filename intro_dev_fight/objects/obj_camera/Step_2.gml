if(screen_shake){
	screen_shake_duration--;
	x += choose(-screen_shake_intensity,screen_shake_intensity);
	y += choose(-screen_shake_intensity,screen_shake_intensity);
	if(screen_shake_duration <= 0){
		screen_shake = false;
		screen_shake_intensity = 0;
		screen_shake_duration = 0;
	}
}
if(!screen_shake){
	if(follow!= noone){
		x_target = follow.x;
		y_target = follow.y;
		y += (y_target - y)/5;
		x += (x_target - x)/5;
	}
}



camera_set_view_pos(view_camera[0],x-camera_width / 2,y-camera_height / 2);

