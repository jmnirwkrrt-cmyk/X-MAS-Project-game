if (write and !instance_exists(ask_infweapon) and !instance_exists(ask_question_i) and !instance_exists(ask_message))
{
txt = newname;
global.team[ask_inf.indx, 1] = txt;
write = false;
}
else
if (!instance_exists(ask_planeweapon) and !instance_exists(ask_question_p))
{
global.click = true;
button_sound_effect();
image_index = 0;
write = true;
keyboard_string = "";
newname = "";
}

