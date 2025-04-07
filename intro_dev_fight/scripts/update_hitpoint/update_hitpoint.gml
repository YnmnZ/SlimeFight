// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function update_hitpoint(){
	with(obj_game_manager){
		var player1 = player_array[0];
		var player2 = player_array[1];
		player_score = [player1.hitpoint,player2.hitpoint];
	}
}