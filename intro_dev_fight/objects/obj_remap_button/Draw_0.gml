draw_self();

draw_set_color(c_black);

if(!ready_to_input){
	draw_text(x+5,y,keytostring(key));
}else{
	draw_text(x,y,"---");
}

draw_set_color(c_white)