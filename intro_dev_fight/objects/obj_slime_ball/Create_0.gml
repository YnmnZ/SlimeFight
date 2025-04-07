state = "initial";

accel = 1;
jump_vel = -30;
jump_gain = -1;
bounce_vel = -15;
return_vel = -35;
grav = 0.5;
spawn_direction = 1;
x_vel = random_range(10,20) * spawn_direction;
y_vel = min(-abs(x_vel) + random_range(-5,5),-5);
r_x = 0;
r_y = 0;
vel_decrease = 0.9;
wall_buffer = 8;

target_y = min(random_range(10,y),10);

part = part_system_create();
part_system_depth(part,-3);

pix = part_type_create();
part_type_shape(pix,pt_shape_pixel);
part_type_size(pix,2,4,-0.02,0.2);
part_type_speed(pix,0.8,1,-0.02,0.01);
part_type_direction(pix,0,360,0,0.2);
part_type_life(pix,50,70);
part_type_color2(pix,c_green,c_lime);
part_type_alpha1(pix,0.2);
