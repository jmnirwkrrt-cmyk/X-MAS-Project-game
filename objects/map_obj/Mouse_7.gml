drag = 0;
if (global.isbuild and !instance_exists(ask_build_onmap) and global.base_exists and !global.click and !instance_exists(ask_question_m))
{
ask = instance_create(1200 / 2, 900 / 2, ask_build_onmap);
ask.m_x = mouse_x;
ask.m_y = mouse_y;
global.isbuild = true;
global.click = true;
}
else
if (!global.base_exists and global.isbuild and !global.click and !instance_exists(ask_question_m))
{
ask = instance_create(1200 / 2, 900 / 2, ask_question_m);
ask.x_base = mouse_x;
ask.y_base = mouse_y;
ask.type = 1;
global.isbuild = true;
global.click = true;
}

