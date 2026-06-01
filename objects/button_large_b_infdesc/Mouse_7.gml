if (!instance_exists(ask_inf) && (global.team[indx, 0] == 0 || global.planes[global.team[indx, 0], 14] == 0))
{
global.click = true;
button_sound_effect();
image_index = 0;
mes = instance_create(1200 / 2, 900 / 2, ask_inf); 
mes.indx = indx;
}

