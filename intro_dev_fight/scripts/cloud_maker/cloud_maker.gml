// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function cloud_maker(cloud_x,cloud_y,alarm_num){
	var cloud = instance_create_depth(cloud_x,cloud_y,0,obj_cloud);
	
	array_push(cloud_array[alarm_num],cloud);

	if(array_length(cloud_array[alarm_num]) < max_cloud_each){
		alarm_set(alarm_num,irandom_range(random_gen_time-random_gen_dev,random_gen_time+random_gen_dev));
	}
}