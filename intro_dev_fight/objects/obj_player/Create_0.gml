accel = 0.6;
jump_vel = -30;
jump_gain = -1;
bounce_vel = -20;
return_vel = -10;
grav = 0.6;
x_vel = 0;
y_vel = 0;
r_x = 0;
r_y = 0;
vel_decrease = 0.9;
wall_buffer = 8;

on_ground = false;

facing = 1;

player = 0;
state = "initial";
animation_state = "fall";
can_turn = true; // ** need to lock sprite facing when this is false

debug_visual = false;
hold_jump = false;
in_dash = false;
can_dash = true;
dash_cooldown = 80;
dash_particle = false;

can_drop = true;
rigid_drop = false;

can_attack = true;
attack_delay = 5;
hitbox = noone;
attack_duration = 15;
attack_reset = 20;
break_reset = 80;
break_repel = 60;

can_block = true;
block_delay = 1;
block_duration = 10;
block_reset = 30;

stun = false;
stun_duration = 100;

invincible_duration = 70;
invincible = false;

respawn_timer = 30;

head = noone;
mask = noone;

left = ord("A");
right = ord("D");
jump = ord("W");
dash = vk_lshift;
attack = ord("F");
block = ord("Q");
down = ord("S");

attack_block_object = obj_attack;

max_hitpoint = 20;
hitpoint = max_hitpoint;

other_player = noone;

part = part_system_create();
part_system_depth(part,-3);

pix = part_type_create();
part_type_shape(pix,pt_shape_pixel);
part_type_size(pix,2,4,0.01,0.2);
part_type_speed(pix,2,4,-0.02,0.4);
part_type_direction(pix,0,180,0,0.2);
part_type_life(pix,10,20)

pix_360 = part_type_create();
part_type_shape(pix_360,pt_shape_pixel);
part_type_size(pix_360,2,4,0.01,0.2);
part_type_speed(pix_360,3,5,-0.02,0.4);
part_type_direction(pix_360,0,360,0,0);
part_type_life(pix_360,15,25);


pix_drop = part_type_create();
part_type_shape(pix_drop,pt_shape_pixel);
part_type_size(pix_drop,2,4,0.01,0.2);
part_type_speed(pix_drop,3,5,-0.02,0.8);
part_type_direction(pix_drop,75,105,0,5);
part_type_life(pix_drop,15,25);

pix_wall = part_type_create();
part_type_shape(pix_wall,pt_shape_pixel);
part_type_size(pix_wall,3,5,0.01,0.2);
part_type_speed(pix_wall,6,8,-0.04,0.4);
part_type_direction(pix_wall,-90,90,0,0.2);
part_type_life(pix_wall,15,25);
part_type_color1(pix_wall,c_yellow);

pix_hit = part_type_create();
part_type_shape(pix_hit,pt_shape_pixel);
part_type_size(pix_hit,3,5,0.01,0.2);
part_type_speed(pix_hit,6,8,-0.04,0.4);
part_type_direction(pix_hit,-90,90,0,0.2);
part_type_life(pix_hit,15,25);

squish_timer = 0
squish_speed = 0.05;
squish_duration = 30;
