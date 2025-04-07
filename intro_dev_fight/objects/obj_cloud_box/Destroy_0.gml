//show_debug_message(owner.id)

instance_destroy(owner);
//show_debug_message("die")
var effect = instance_create_depth(x,y,0,obj_disappear_effect);
effect.sprite_num = plat_size - 1;
effect.sprite_index = effect.effect_array[plat_size-1];