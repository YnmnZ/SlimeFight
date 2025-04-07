/// @description actual cloud generator
var cloud = instance_create_depth(random_range(wall_buffer,room_width-wall_buffer),random_range(2*wall_buffer,room_height-2*wall_buffer),1,obj_cloud);
with(cloud){
	while(instance_place(x,y,obj_cloud) || instance_place(x,y,obj_player) || instance_place(x,y,obj_cloud_box)){
		show_debug_message("overlapping! old location is (" + string(x) + ", " + string(y) + ")")
		x = random_range(other.wall_buffer,room_width-other.wall_buffer);
		y = random_range(other.wall_buffer,room_height-4*other.wall_buffer);
		show_debug_message("new location is (" + string(x) + ", " + string(y) + ")")
		show_debug_message("//////////////////")
	}
}

if(instance_number(obj_cloud) < max_cloud){
	alarm_set(4,irandom_range(random_gen_time-random_gen_dev,random_gen_time+random_gen_dev));
}