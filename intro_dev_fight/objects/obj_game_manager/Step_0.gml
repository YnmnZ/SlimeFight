switch(state){
	case "game":
		if(over){
			if(loser == 1){
				global.winner = 2
			}else{
				global.winner = 1
			}
			room_goto(rm_end);
		}
		break;
}