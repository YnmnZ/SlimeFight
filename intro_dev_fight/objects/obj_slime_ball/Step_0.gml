if(state == "initial"){
	x_vel = random_range(10,20) * spawn_direction;
	y_vel = min(-abs(x_vel) + random_range(-5,5),-5);
	state = "generate";
}

if(state == "generate"){
	x_vel *= vel_decrease;
	y_vel += grav;

	r_x += x_vel;
	r_y += y_vel;

	var tar_x = round(r_x);
	var tar_y = round(r_y);

	r_x -= tar_x;
	r_y -= tar_y;

	var dir = sign(tar_y);

	var dist_to_rwall = room_width-x-wall_buffer;
	var dist_to_lwall = x -wall_buffer;

	if(tar_x >= dist_to_rwall){
		x = room_width-(wall_buffer + 1);
		x_vel *= -1;
		r_x = 0;
	}
	else if(tar_x <= -dist_to_lwall){
		x = wall_buffer +1;
		x_vel *= -1;
		r_x = 0;
	}
	else{
		x+=x_vel;
	}
	
	while(tar_y != 0){
		y+=dir;
		tar_y -= dir;
	}
	
	if(y > target_y && y_vel > 0){
		state = "pickup"
	}
}

if(state == "pickup"){
	var picker = instance_place(x,y,obj_player);
	if(instance_exists(picker)){
		if(picker.hitpoint > 0 && picker.hitpoint < picker.max_hitpoint){
			picker.hitpoint ++;
			var temp_text = instance_create_depth(x,y,-1,obj_temp_text);
			temp_text.text = "HEAL!"
			temp_text.color = c_lime;
			update_hitpoint();
			audio_play_sound(slime_heal,2,false)
			instance_destroy();
		}
	}
}

part_particles_create(part,x,y,pix,5)