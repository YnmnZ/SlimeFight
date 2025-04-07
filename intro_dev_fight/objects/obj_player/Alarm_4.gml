/// @description destroy hitbox
instance_destroy(hitbox);
hitbox = noone;
can_turn = true;
switch(attack_block_object){
	case obj_attack:
		alarm_set(5,attack_reset)
		break;
		
	case obj_block:
		alarm_set(6,block_reset);
		break;
}