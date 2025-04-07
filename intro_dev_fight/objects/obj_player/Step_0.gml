if(state != "initial"){
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
		
		if(state = "knockback" && alarm_get(7)<=-1){
			state = "stun";
			audio_play_sound(slime_stun,2,false);
			stun = true;
			obj_camera.screen_shake = true;
			obj_camera.screen_shake_duration = 20;
			obj_camera.screen_shake_intensity = 3;
			show_debug_message("stun");
			part_type_direction(pix_wall,90,270,0,5);
			part_particles_create(part,x,y+33,pix_wall,50);
			alarm_set(7,stun_duration);
		}
		
	}
	else if(tar_x <= -dist_to_lwall){
		x = wall_buffer +1;
		x_vel *= -1;
		r_x = 0;
		
		if(state = "knockback" && alarm_get(7)<=-1){
			state = "stun";
			audio_play_sound(slime_stun,2,false);
			stun = true;
			obj_camera.screen_shake = true;
			obj_camera.screen_shake_duration = 20;
			obj_camera.screen_shake_intensity = 3;
			show_debug_message("stun");
			part_type_direction(pix_wall,-90,90,0,5);
			part_particles_create(part,x,y+33,pix_wall,50);
			alarm_set(7,stun_duration);
		}
		
	}
	else{
		x+=x_vel;
	}
	
	var x_collide = noone;
	
	if(instance_place(x+facing,y,other_player)){
		x_collide = instance_place(x+facing,y,other_player);
	}
	
	if(x_collide != noone){
		x_vel -= 1.5 * facing * abs(x_collide.x_vel);
		if(abs(x_collide.x_vel) >= 25){
			state = "knockback";
		}
	}
	
	
	while(tar_y != 0 && state != "respawn" && !on_ground){
		var colliding = false;
		var collided = noone;
		//debug_visual = false;
		
		if(dir >= 0){
			if(state != "respawn" && state != "die"){
				animation_state = "fall";
			}
			collided = instance_place(x,y+dir,obj_wall);

			//step on player
			if(collided != noone && collided.can_step_on && state != "die" && state != "respawn" && !on_ground && !invincible){
				if(place_meeting(x,y,collided) == false){
					colliding = true;
					audio_play_sound(choose(slime_jump1,slime_jump2),1,false);
					
					//step on head
					if(collided.is_player){
						//obj_game_manager.player_score[player] ++;
						collided.can_step_on = false;
						collided.squish_timer = 90;
						damage(id,collided.owner,1);
						//repeat(3){
						//	instance_create_depth(collided.x,collided.y,-1,obj_star);
						//}
					}
					
				}
			}
		}
	
		//if(place_meeting(x,y,obj_bottom_zone) && dir >= 0){
		//	if(state != "die"){
		//		repeat(irandom(1) + 3){
		//			instance_create_depth(x, y + 30,-1,obj_star);
		//		}
		//	}
		//	audio_play_sound(snd_fall,1,false);
		//	state = "respawn";
		//	animation_state = "die";
		//	x_vel = 0;
		//	y_vel = 0;
		//	r_x = 0;
		//	r_y = 0;
		//	obj_game_manager.player_score[player] --;
		//	//show_debug_message("player " + string(player)+ " has fallen");
		//	bounce_cleaning();
		//	alarm_set(1,respawn_timer);
		
		//	//randomize respawn place
		//	x = random_range(wall_buffer * 4, room_width - wall_buffer * 4);
		//	y = 980;
		
		//	break;
		//}
	
		if(!colliding){
			y+=dir;
			tar_y -= dir;
		}else if (colliding && collided.is_player){
			//audio_play_sound(choose(slime_jump1,slime_jump2),1,false);
			if(collided.owner.player = 0){
				part_type_color3(pix_360,c_blue,c_aqua,c_white);
			}else{
				part_type_color3(pix_360,c_green,c_lime,c_white);
			}
			part_particles_create(part,x,y+68,pix_360,100);
			rigid_drop = false;
			y+=dir
			y_vel = bounce_vel
			bounce_cleaning();
			break;
		}else{
			audio_play_sound(choose(grass_impact1,grass_impact2),0,false);
			part_particles_create(part,x,y+68,pix,100);
			rigid_drop = false;
			y+=dir;
			//bounce_vel = lerp(bounce_vel,0,0.6);
			
			y_vel = - min(abs(-y_vel * 0.8),-jump_vel);
			if(y_vel >= -10 || state == "pfall"){
				y_vel = 0;
				on_ground = true;
				animation_state = "ground";
				if(state == "pfall"){
					state = "game";
				}
			}
			
			
			
			bounce_cleaning();
			break;
		}
	
	}
	
	if(on_ground){
		if(state = "pfall"){
			state = "game";
		}
	}
	
	//all controls go here
	if(state != "die" && state != "respawn" && state != "knockback" && state != "stun" && !stun){
		
		if(!rigid_drop){
			x_vel += (keyboard_check(right)-keyboard_check(left)) * accel;
		}
		
		if(keyboard_check_pressed(jump) && on_ground){
			on_ground = false;
			y_vel = jump_vel;
			hold_jump = true;
			//show_debug_message("jump");
			animation_state = "up"
			part_particles_create(part,x,y+68,pix,100);
			audio_play_sound(choose(slime_jump1,slime_jump2),1,false);
		}
		
		if(keyboard_check_pressed(down) && !on_ground && can_drop && state != "pfall"){
			y_vel = -jump_vel;
			x_vel = 0;
			r_x = 0;
			r_y = 0;
			//show_debug_message("jump");
			animation_state = "fall";
			rigid_drop = true;
			alarm_set(9,60);
			can_drop = false;
			audio_play_sound(slime_drop,2,false);
			
		}
		
		if(keyboard_check_pressed(dash) && can_dash && can_turn && (keyboard_check(right) - keyboard_check(left)) != 0){
			state = "game";
			can_dash = false;
			rigid_drop = false;
			dash_particle = true;
			alarm_set(10,10);
			x_vel += 40 * (keyboard_check(right) - keyboard_check(left));
			alarm_set(2,dash_cooldown);
			audio_play_sound(slime_dash,1,false);
		}
		
		if(keyboard_check_pressed(attack) && can_attack && alarm_get(3) <= -1){
			attack_block_object = obj_attack;
			can_attack = false;
			alarm_set(3,attack_delay);
			audio_play_sound(choose(slime_attack1,slime_attack2),2,false);
		}
		
		if(keyboard_check_pressed(block) && can_block && alarm_get(3) <= -1){
			attack_block_object = obj_block;
			can_block = false;
			alarm_set(3,block_delay);
		}
		
	}

	if(state == "die"){
		animation_state = "die";
	}
	
	if(state = "knockback" && abs(x_vel) <= 10){
		state = "game";
	}
	
	if(can_turn){
		if(other_player.x > x){
			facing = 1;
			image_xscale = -facing;
			
		}else if (other_player.x < x){
			facing = -1;
			image_xscale = -facing;
			
		}
	}
	

}

//if(invincible){
//	show_debug_message("invincible")
//}

//show_debug_message(hold_jump)

if(instance_exists(obj_bwall) && y + 67 > obj_bwall.y && !on_ground){
	y = obj_bwall.y -68;
	show_debug_message("saved");
	r_y = 0;
	on_ground = true;
}

//if(squish_timer > 0){
//	squish_timer -= squish_speed;
	
//	image_xscale = squish_timer;
//	image_yscale = 1+squish_timer;
	
//}

//if(squish_timer <= 0){
//	image_xscale = 1;
//	image_yscale = 1;
//}

image_xscale = facing * abs(image_xscale);

if(rigid_drop){
	part_type_direction(pix_drop,75,105,0,5);
	part_particles_create(part,x,y,pix_drop,50);
}

if(dash_particle){
	part_type_direction(pix_drop,90-90*facing-15,90-90*facing+15,0,5);
	part_particles_create(part,x,y+33,pix_drop,50);
}

if(hitpoint <= 0){
	obj_game_manager.over = true;
	obj_game_manager.loser = player+1;
}