if(can_step_on == false && alarm_get(0) <= -1){
	//owner.state = "die";
	//owner.animation_state = "die";
	alarm_set(0,step_timer);
}
//show_debug_message(can_step_on)