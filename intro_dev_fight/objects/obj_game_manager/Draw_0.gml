draw_set_font(fnt_pixel);
draw_set_color(c_aqua);
draw_set_halign(fa_center);
draw_rectangle(wall_buffer,wall_buffer,wall_buffer+player_score[0]*20,wall_buffer+30,false);
draw_text(wall_buffer+player_score[0]*20 + 20,wall_buffer,player_score[0]);
draw_set_color(c_lime);
draw_rectangle(room_width - wall_buffer,wall_buffer,room_width-(wall_buffer+player_score[1]*20),wall_buffer+30,false);
draw_text(room_width-(wall_buffer+player_score[1]*20) - 20,wall_buffer,player_score[1]);
draw_set_halign(fa_left);