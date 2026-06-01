if (instance_exists(enemy))
{
enemy.x = x;
enemy.y = y;
enemy.hspeed = 0;
enemy.vspeed = 0;
enemy.image_index = ind;
enemy.hp = hp;
enemy.fight = 0;
enemy.fall = 0;
enemy.flash = 0;
enemy.jump = 0;

}
else { cooldown = 0; }
cooldown--;
if (cooldown < 1) { instance_destroy(self); }

