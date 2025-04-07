/// @description generate hitbox
can_turn = false;
hitbox = instance_create_depth(x,y,-1,attack_block_object);
hitbox.image_xscale = -facing;
hitbox.owner = id;

switch(attack_block_object){
	case obj_attack:
		alarm_set(4,attack_duration)
		break;
		
	case obj_block:
		alarm_set(4,block_duration);
		break;
}
