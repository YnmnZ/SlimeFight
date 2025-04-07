upper_bound = 30;
left_bound = 60;
heading_height = 60;
spacing = 80;

command_array = ["Move Left", "Move Right","Jump","Dash","Attack","Block","Smash Down"]

for (var i = 0; i<array_length(global.control_setting[0]); i++){
	var remap = instance_create_depth(left_bound,heading_height + 20 + upper_bound + i * spacing,0,obj_remap_key);
	remap.command = command_array[i];
	remap.left_bound = left_bound;
	remap.index = i;
}

instance_create_depth(mouse_x,mouse_y,-1,obj_cursor);