draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

draw_text(x,y,"Game End!");
draw_text(x,y + 30,"The Winner is Player " + string(global.winner));
draw_text(x,y + 60,"Press Space to return to restart");

draw_set_halign(fa_left);
draw_set_valign(fa_top);