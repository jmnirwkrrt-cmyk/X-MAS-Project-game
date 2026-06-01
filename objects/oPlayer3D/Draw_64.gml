
/*

// 2D полоса здоровья
var health_line;
var scale = 0.5;
var coeff_x = 1;
var coeff_s = 1;

coeff_s = hp / max_hp;
coeff_x = min(1, coeff_s * 2);

if (hp > max_hp / 2.5) health_line = draw_sprite_ext(health_line_much, 0, 50, 75, scale, scale, 0, c_white, 1);
else
if (hp > max_hp / 10) health_line = draw_sprite_ext(health_line_not_much, 0, 50, 75, scale, scale, 0, c_white, 1);
else
health_line = draw_sprite_ext(health_line_near_dead, 0, 50, 75, scale, scale, 0, c_white, 1);

 
draw_sprite_ext(health_bar_s, 0, 50, 75, scale, scale, 0, c_white, 1);
*/

// 3D полоса здоровья\энергии\боекомплекта
var x_bar = 50;
var y_bar = 75;
var scale = 0.25;
var ammo_space_x = 0;
var ammo_space_y = 0;

var frame_index = 0;
frame_index = 100 - (hp / max_hp * 100);
if (hp < 1) frame_index = 100;
draw_sprite_ext(health_bar_3D, frame_index, x_bar, y_bar * 1, scale, scale, 0, c_white, 1);

frame_index = 100 - (energy / max_energy * 100);
if (energy < 1) frame_index = 100;
draw_sprite_ext(energy_bar_3D, frame_index, x_bar, y_bar * 2, scale, scale, 0, c_white, 1);

if (ammo > 0)
{
	frame_index = 1;
	scale = 0.5;
	
	var ammo_sprite = bullet_new_sprite_3D;
	if (hero_numb == 4) 
	{ 
		ammo_sprite = LandmineS; 
		frame_index = 0; 
		scale = 1.2;
		x_bar += 10;
	}
	
	for (var i = 0; i < ammo; i++)
	{
		draw_sprite_ext(ammo_sprite, frame_index, x_bar + ammo_space_x, y_bar * 3 + ammo_space_y, scale, scale, 0, c_white, 1);	
		ammo_space_y += 10;
		if (ammo_space_y == 30) { ammo_space_y = 0; ammo_space_x += 10; }
	}
}

draw_set_font(font_general_18);
draw_set_halign(fa_left);
draw_set_colour(c_lime);
var medkits_subimage = 0;
if (keyboard_check(vk_f1)) medkits_subimage = 1;
draw_sprite_ext(medkits_s, medkits_subimage, x_bar + 540, y_bar * 3, 1, 1, 0, c_white, 1);
draw_text_ext(x_bar + 450, y_bar * 3 - 25, $"{global.txt2} F1: {oArena3D.medkits}", 20, 300);
draw_sprite_ext(grenades_s, 0, x_bar + 830, y_bar * 3 - 5, 1, 1, 0, c_white, 1);
draw_text_ext(x_bar + 750, y_bar * 3 - 25, $"{global.txt1} F2: {oArena3D.grenades}", 20, 300);

if (instance_exists(chaos_emerald) && !chaos_emerald.founded)
{
	var distance_to_emerald = point_distance_3d(x, y, z, chaos_emerald.x, chaos_emerald.y, chaos_emerald.z);
	var search_subimage = 0;
	if (distance_to_emerald < global.emerald_stage_radius * 1) search_subimage = 4;
	else
	if (distance_to_emerald < global.emerald_stage_radius * 2) search_subimage = 3;
	else
	if (distance_to_emerald < global.emerald_stage_radius * 3) search_subimage = 2;
	else
	if (distance_to_emerald < global.emerald_stage_radius * 4) search_subimage = 1;
	else
	if (distance_to_emerald > global.emerald_stage_radius * 4) search_subimage = 0;
	draw_sprite_ext(emerald_detector, search_subimage, x_bar + 1050, y_bar * 2, 1, 1, 0, c_white, 1);
}

draw_set_colour(c_white);


