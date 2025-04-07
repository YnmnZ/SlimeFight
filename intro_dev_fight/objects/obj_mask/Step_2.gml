x = owner.x;
y = owner.y;

image_xscale = owner.image_xscale;
image_yscale = owner.image_yscale;

//animation

switch(owner.animation_state){
	case "ground":
		sprite_index = spr_player_groun;
		break;
	case "fall":
		sprite_index = spr_player_fall;
		break;
		
	case "jump":
		sprite_index = spr_player_up_1;
		break;
	
	case "up":
		sprite_index = spr_player_up;
		break;
	
	case "die":
		sprite_index = spr_player_die;
		break;
}

if(owner.on_ground){
	sprite_index = spr_player_groun;
}

//if(owner.invincible){
//	image_color = c_yellow;
//}else{
//	image_color = c_white;
//}

if(hit_impact && alarm_get(0) <= -1){
	alarm_set(0,30);
}