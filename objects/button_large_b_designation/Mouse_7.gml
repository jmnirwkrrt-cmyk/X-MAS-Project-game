if (!instance_exists(ask_infweapon) and !instance_exists(ask_question_i) and global.team[ask_inf.indx, 4] >= global.team[ask_inf.indx, 5])
{
global.click = true;
button_sound_effect();
image_index = 0;
instance_create(1200 / 2, 900 / 2, ask_infdesignation);
}

