x = __view_get( e__VW.XView, 0 ) + 20;
y = __view_get( e__VW.YView, 0 ) + 200
txt1.x = x + 16;
txt1.y = y + 0;
txt2.x = x + 42;
txt2.y = y + 52;
txt3.x = x + 103;
txt3.y = y + 40;
txt3.txt = global.grenades;


/// F1 и F2
if (keyboard_check_pressed(vk_f1) and global.grenades > 0)
{
image_index = 1;
}
if (keyboard_check_released(vk_f1) and global.grenades > 0 and !instance_exists(mouse_follower) and !instance_exists(throw_grenade))
{
instance_create(x, y, mouse_follower);
image_index = 0;
}

