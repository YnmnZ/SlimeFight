image_speed = 0;
image_index = 4;


if(hitbox == noone){
	hitbox = instance_create_depth(x,y,-2,obj_cloud_box);
	hitbox.owner = self;
}else{
	//hitbox.plat_size = plat_size;
	//hitbox.sprite_index = hitbox.sprite_array[plat_size-1];
}

if(plat_size < max_size){
	alarm_set(0,irandom_range(180,300));
}