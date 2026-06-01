global.click = true;
if (global.money > global.onmapbuilding[mcurrent, 4] - 1)
{
obj = instance_create(1200 / 2, 900 / 2, ask_question_m);
obj.type = mcurrent;
obj.x_base = m_x;
obj.y_base = m_y;
}
else { mes = instance_create(1200 / 2, 900 / 2, ask_message); mes.event = 6; }

instance_destroy(self);

