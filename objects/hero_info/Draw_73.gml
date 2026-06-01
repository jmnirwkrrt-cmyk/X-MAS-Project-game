if (instance_exists(hero_obj)) {

hp = hero_obj.hp / hero_obj.hpmax * 100;
ammo = hero_obj.ammo / hero_obj.ammomax * 100;
draw_healthbar(x, y, x + 100, y + 30, hp, c_black, c_red, c_green, 90, true, true);
if (hero_obj.hero_numb = 1 or hero_obj.hero_numb = 2) { draw_healthbar(x, y + 40, x + 100, y + 30, ammo, c_black, c_red, c_orange, 90, true, true); }
}

