if (instance_exists(target_hero)) {

hp = target_hero.hp / target_hero.hpmax * 100;
ammo = target_hero.ammo / target_hero.ammomax * 100;
draw_healthbar(x, y, x + 30, y + 10, hp, c_black, c_red, c_green, 90, true, true);
if (target_hero.hero_numb = 1 or target_hero.hero_numb = 2) { draw_healthbar(x, y + 13, x + 30, y + 10, ammo, c_black, c_red, c_orange, 90, true, true); }
}
else { instance_destroy(self); }

