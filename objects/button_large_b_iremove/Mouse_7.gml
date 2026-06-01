if (!instance_exists(ask_infweapon) and !instance_exists(ask_question_i))
{
global.click = true;
button_sound_effect();
image_index = 0;
if (type = 1)
{
instance_create(1200 / 2, 900 / 2, ask_question_i);
}
if (type = 2)
{
instance_destroy(ask_inf);
}
}

