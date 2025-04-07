// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function array_volume(array){
	var volume = 0;
	for(var i = 0; i < array_length(array);i++){
		if(is_array(array[i])){
			volume += array_length(array[i]);
		}
	}
	return volume;
}