if (!instance_exists(ask_message) and !instance_exists(mouse_target_inter))
{
global.click = true;
button_sound_effect();
image_index = 0;

mos = instance_create(0, 0, mouse_target_inter);
mos.indx = ask_escort.indx;
mes = instance_create(1200 / 2, 100, ask_message);
mes.event = -10;
instance_destroy(ask_escort);
}

