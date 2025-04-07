if(hit_impact){
	draw_sprite_ext(sprite_index,2,x,y,image_xscale,1,0,image_color,1);
}else{
	draw_sprite_ext(sprite_index,-1,x,y,image_xscale,1,0,image_color,1);
}
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(x,y-20,owner.hitpoint);



if(owner.stun){
	draw_set_color(c_yellow);
	draw_text(x,y-40,"STUNNED!");
}else if(owner.state == "knockback"){
	draw_set_color(c_yellow);
	draw_text(x,y-40,"KNOCKBACK!");
}else if(owner.state == "pfall"){
	draw_set_color(c_yellow);
	draw_text(x,y-40,"CRASH FALL!");
}

if(owner.invincible){
	draw_set_color(c_orange);
	draw_text(x,y-60,"INVINCIBLE!");
}

draw_set_color(c_white);