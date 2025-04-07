if(owner != noone){
	x = owner.x;
	y = owner.y;
	facing = owner.facing;
}

var target = instance_place(x + facing,y,obj_player);

if(target != noone){
	damage(owner,target,2,-facing,10);
}