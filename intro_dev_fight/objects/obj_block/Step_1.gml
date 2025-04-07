facing = owner.facing;

var break_block = instance_place(x+facing,y,obj_attack);

if(break_block != noone && facing != break_block.facing){
	
	if((facing = 1 && break_block.x > x)||(facing = -1 && break_block.x < x)){
		show_debug_message("attack break!")
		audio_play_sound(slime_parry,3,false)
		with(owner){
			x_vel += -facing * break_repel * 0.2;
		}
		var other_player = break_block.owner;
	
		with(other_player){
			instance_destroy(hitbox);
			hitbox = noone;
			can_turn = true;
			alarm_set(5,attack_reset);
			x_vel += -facing * break_repel;
			state = "knockback";
		}
	
	}
}