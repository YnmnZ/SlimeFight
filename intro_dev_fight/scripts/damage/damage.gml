// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function damage(hitter,target,amount,facing = 0,knock = 40){
	if(target.invincible == false){
		audio_play_sound(slime_hit,2,false);
		target.hitpoint -= amount;
		update_hitpoint();
		obj_camera.screen_shake = true;
		obj_camera.screen_shake_intensity = amount;
		obj_camera.screen_shake_duration = 5*amount;
		//repeat(3+amount * 2){
		//	instance_create_depth(target.x,target.y,-1,obj_star);
		//}
		with(target){
			show_debug_message(invincible)
			invincible = true;
			alarm_set(8,invincible_duration)
			if(!on_ground && y < 640){
				state = "pfall";
			}
			
			mask.hit_impact = true;
			
		}
		
		if(facing != 0 && amount >= 2){
			var slime = instance_create_depth(target.x,target.y,0,obj_slime_ball);
			slime.spawn_direction = -facing;
			target.x_vel += 1.2 * knock * -facing;
			target.state = "knockback";
			hitter.x_vel -= knock * -facing;
			
			with(target){
				if(player = 0){
					part_type_color3(pix_hit,c_blue,c_aqua,c_white);
				}else{
					part_type_color3(pix_hit,c_green,c_lime,c_white);
				}
				if(facing == -1){
					part_type_direction(pix_hit,-60,60,0,10);
				}else{
					part_type_direction(pix_hit,120,240,0,10);
				}
				
				part_particles_create(part,target.x,y+33,pix_hit,100);
			}
			
		}
		
	}
}