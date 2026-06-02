if (write and !instance_exists(ask_infweapon) and !instance_exists(ask_question_i) and !instance_exists(ask_message))
{
txt = newname;
global.team[ask_inf.indx, 1] = txt;
write = false;
image_blend = c_white;
}

