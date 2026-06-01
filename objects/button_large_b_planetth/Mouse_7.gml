if (!instance_exists(ask_plane))
{
global.click = true;
button_sound_effect();
image_index = 0;
mes = instance_create(1200 / 2, 900 / 2, ask_plane); 
mes.indx = indx;
}

