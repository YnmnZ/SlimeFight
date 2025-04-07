state = "initial";

player_array = [];
generate_x = 150;
generate_y = 450;

randomize();

cloud_array =	[[],[],
				 [],[]]

wall_buffer = 32;
max_cloud = 15;
max_cloud_each = ceil(max_cloud/4);

random_gen_time = 20;
random_gen_dev = 10;

player_score = [0,0];

show_hitbox = false;

over = false;
loser = 0;