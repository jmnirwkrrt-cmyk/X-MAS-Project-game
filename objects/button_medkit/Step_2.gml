x = __view_get( e__VW.XView, 0 ) + 20;
y = __view_get( e__VW.YView, 0 ) + 300
txt1.x = x + 16;
txt1.y = y + 0;
txt2.x = x + 42;
txt2.y = y + 52;
txt3.x = x + 103;
txt3.y = y + 40;
txt3.txt = global.medkits;


/// F1 и F2
if (keyboard_check_pressed(vk_f2) and global.medkits > 0)
{
image_index = 1;
}
if (keyboard_check_released(vk_f2) and global.medkits > 0)
{
global.medkits--;

if (instance_exists(X_MAS_team))
{
ally = instance_nearest(x, y, X_MAS_team);
var i;
for (i = 0; i < instance_number(X_MAS_team); i += 1)
{
   ally[i] = instance_find(X_MAS_team, i);
   if (ally[i].hp < ally[i].hpmax)
   {
   ally[i].hp += ally[i].hpmax - ally[i].hp;
   }
}
}

image_index = 0;
}

