//// oArena3D: Create
/// 3D-арена: пол, столбы, камера, биллборды актёров

// ==== ПАРАМЕТРЫ БОЯ ====
global.xp_gain_total = 0;
global.killed_total = 0;
global.loss_total = 0;

battle_type = global.ground_battle_type; // 1 - Уничтожить всех, 2 - выживать в течении,
// 3 - найти изумруд и съебаться, 4 - уничтожить лифты для роботов и всех остальных, 5 - выживать в течении (защита базы)
survive_timer = global.survive_timer;
spawn_timer_max = 100;
spawn_timer = spawn_timer_max;
spawn_timer_deviation = 100;
emerald_taken_by = noone;

current_level = global.levels[0];
saved_forces = array_create(0);


battle_end = false;
drop_pause = 0;
set_pause = 0;

metal_corpses = 0;
pawn_corpses = 0;
beetle_corpses = 0;
ufo_corpses = 0;
turret_corpses = 0;

grenades = -1;
medkits = -1;

grenades_original = 0;
medkits_original = 0;

grenades_on_stockpile = 0;
medkits_on_stockpile = 0;

var possible_levels = array_create(0);
for (var i = 0; i < array_length(global.levels); i++)
{
	var level = global.levels[i];
	if (battle_type != level.map_type) continue;
	show_debug_message($"possible level: {level.name}");
	array_insert(possible_levels, 0, level);
}
current_level = possible_levels[irandom_range(0, array_length(possible_levels) - 1)];
show_debug_message($"current_level: {current_level.name}");

// ==== ПАРАМЕТРЫ АРЕНЫ ====
arena_half    = current_level.arena_size;
pillar_height = 40;
pillar_size   = 80;

// ==== КАМЕРА ====
cam = view_camera[0];

cam_dist   = 800;
cam_height = 400;
cam_angle  = 45;

cam_rot_speed      = 2;
cam_zoom_speed     = 8;
cam_height_speed   = 4;
cam_auto_rot_speed = 0.3;

// Позиция камеры в мире (нужно актёрам для разворота биллборда)
cam_eye_x = 0;
cam_eye_y = 0;
cam_eye_z = 0;

// Блок для рейкаста

proj_w = arena_half * 2;
proj_h = proj_w * (display_get_height() / display_get_width());

// Точка, куда смотрит камера (по умолчанию центр арены)
cam_target_x = 0;
cam_target_y = 0;
cam_target_z = 0;

// ==== СТОЛБЫ: случайный спавн без пересечений ====
pillars = [];
var pillar_count_random = irandom_range(current_level.min_pillar_count, current_level.max_pillar_count);

for (var i = 0; i < pillar_count_random; ) {
    var px = irandom_range(-arena_half + 50, arena_half - 50);
    var py = irandom_range(-arena_half + 50, arena_half - 50);

    var ok = true;
    var n  = array_length(pillars);
    var min_sep = pillar_size * 1.5;

    for (var j = 0; j < n; j++) {
        var p = pillars[j];
        if (abs(px - p.x) < min_sep && abs(py - p.y) < min_sep) {
            ok = false;
            break;
        }
    }

    if (ok) {
        array_push(pillars, { x: px, y: py });
        i++;
    }
}

// Можно сюда добавить свои вручную: array_push(pillars, { x: 0, y: 0 });

// Данные арены для других объектов
global.arena_half    = arena_half;
global.pillar_height = pillar_height;
global.pillar_size   = pillar_size;
global.arena_pillars = pillars;

// ==== СПРАЙТЫ / ТЕКСТУРЫ ====
spr_floor_tex  = current_level.terrain;
spr_wall_tex   = current_level.wall_sprite;
spr_top_tex    = current_level.ground_sprite;
spr_shadow_tex = shadow_s;

tex_floor  = sprite_get_texture(spr_floor_tex,  current_level.terrain_index);
tex_wall   = sprite_get_texture(spr_wall_tex,   current_level.wall_index);
tex_top    = sprite_get_texture(spr_top_tex,    current_level.ground_index);
tex_shadow = sprite_get_texture(spr_shadow_tex, 0);

// ==== VERTEX FORMAT (pos3D + uv + color) ====
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_texcoord();
vertex_format_add_colour();
vfmt_3d = vertex_format_end();

var col = c_white;

// ==== ПОЛ ====
vb_floor = vertex_create_buffer();
vertex_begin(vb_floor, vfmt_3d);

var h = arena_half;
var z = 0;

var uv = sprite_get_uvs(spr_floor_tex, current_level.terrain_index);
var floor_u1 = uv[0], floor_v1 = uv[1];
var floor_u2 = uv[2], floor_v2 = uv[3];

vertex_position_3d(vb_floor, -h, -h, z);
vertex_texcoord   (vb_floor, floor_u1, floor_v1);
vertex_colour     (vb_floor, col, 1);

vertex_position_3d(vb_floor,  h, -h, z);
vertex_texcoord   (vb_floor, floor_u2, floor_v1);
vertex_colour     (vb_floor, col, 1);

vertex_position_3d(vb_floor,  h,  h, z);
vertex_texcoord   (vb_floor, floor_u2, floor_v2);
vertex_colour     (vb_floor, col, 1);

vertex_position_3d(vb_floor, -h, -h, z);
vertex_texcoord   (vb_floor, floor_u1, floor_v1);
vertex_colour     (vb_floor, col, 1);

vertex_position_3d(vb_floor,  h,  h, z);
vertex_texcoord   (vb_floor, floor_u2, floor_v2);
vertex_colour     (vb_floor, col, 1);

vertex_position_3d(vb_floor, -h,  h, z);
vertex_texcoord   (vb_floor, floor_u1, floor_v2);
vertex_colour     (vb_floor, col, 1);

vertex_end(vb_floor);

// ==== СТЕНЫ СТОЛБА (единичный куб высотой 1, потом скейлим) ====
vb_pillar_walls = vertex_create_buffer();
vertex_begin(vb_pillar_walls, vfmt_3d);

var x1 = -0.5;
var x2 =  0.5;
var y1 = -0.5;
var y2 =  0.5;
var z0 = 0.0;
var z1 = 1.0;

uv = sprite_get_uvs(spr_wall_tex, current_level.wall_index);
var wu1 = uv[0], wv1 = uv[1];
var wu2 = uv[2], wv2 = uv[3];

vertex_position_3d(vb_pillar_walls, x2, y1, z0);
vertex_texcoord   (vb_pillar_walls, wu1, wv1);
vertex_colour     (vb_pillar_walls, col, 1);

vertex_position_3d(vb_pillar_walls, x2, y2, z0);
vertex_texcoord   (vb_pillar_walls, wu2, wv1);
vertex_colour     (vb_pillar_walls, col, 1);

vertex_position_3d(vb_pillar_walls, x2, y2, z1);
vertex_texcoord   (vb_pillar_walls, wu2, wv2);
vertex_colour     (vb_pillar_walls, col, 1);

vertex_position_3d(vb_pillar_walls, x2, y1, z0);
vertex_texcoord   (vb_pillar_walls, wu1, wv1);
vertex_colour     (vb_pillar_walls, col, 1);

vertex_position_3d(vb_pillar_walls, x2, y2, z1);
vertex_texcoord   (vb_pillar_walls, wu2, wv2);
vertex_colour     (vb_pillar_walls, col, 1);

vertex_position_3d(vb_pillar_walls, x2, y1, z1);
vertex_texcoord   (vb_pillar_walls, wu1, wv2);
vertex_colour     (vb_pillar_walls, col, 1);

vertex_position_3d(vb_pillar_walls, x1, y1, z0);
vertex_texcoord   (vb_pillar_walls, wu2, wv1);
vertex_colour     (vb_pillar_walls, col, 1);

vertex_position_3d(vb_pillar_walls, x1, y2, z0);
vertex_texcoord   (vb_pillar_walls, wu1, wv1);
vertex_colour     (vb_pillar_walls, col, 1);

vertex_position_3d(vb_pillar_walls, x1, y2, z1);
vertex_texcoord   (vb_pillar_walls, wu1, wv2);
vertex_colour     (vb_pillar_walls, col, 1);

vertex_position_3d(vb_pillar_walls, x1, y1, z0);
vertex_texcoord   (vb_pillar_walls, wu2, wv1);
vertex_colour     (vb_pillar_walls, col, 1);

vertex_position_3d(vb_pillar_walls, x1, y2, z1);
vertex_texcoord   (vb_pillar_walls, wu1, wv2);
vertex_colour     (vb_pillar_walls, col, 1);

vertex_position_3d(vb_pillar_walls, x1, y1, z1);
vertex_texcoord   (vb_pillar_walls, wu2, wv2);
vertex_colour     (vb_pillar_walls, col, 1);

vertex_position_3d(vb_pillar_walls, x1, y2, z0);
vertex_texcoord   (vb_pillar_walls, wu1, wv1);
vertex_colour     (vb_pillar_walls, col, 1);

vertex_position_3d(vb_pillar_walls, x2, y2, z0);
vertex_texcoord   (vb_pillar_walls, wu2, wv1);
vertex_colour     (vb_pillar_walls, col, 1);

vertex_position_3d(vb_pillar_walls, x2, y2, z1);
vertex_texcoord   (vb_pillar_walls, wu2, wv2);
vertex_colour     (vb_pillar_walls, col, 1);

vertex_position_3d(vb_pillar_walls, x1, y2, z0);
vertex_texcoord   (vb_pillar_walls, wu1, wv1);
vertex_colour     (vb_pillar_walls, col, 1);

vertex_position_3d(vb_pillar_walls, x2, y2, z1);
vertex_texcoord   (vb_pillar_walls, wu2, wv2);
vertex_colour     (vb_pillar_walls, col, 1);

vertex_position_3d(vb_pillar_walls, x1, y2, z1);
vertex_texcoord   (vb_pillar_walls, wu1, wv2);
vertex_colour     (vb_pillar_walls, col, 1);

vertex_position_3d(vb_pillar_walls, x1, y1, z0);
vertex_texcoord   (vb_pillar_walls, wu2, wv1);
vertex_colour     (vb_pillar_walls, col, 1);

vertex_position_3d(vb_pillar_walls, x2, y1, z0);
vertex_texcoord   (vb_pillar_walls, wu1, wv1);
vertex_colour     (vb_pillar_walls, col, 1);

vertex_position_3d(vb_pillar_walls, x2, y1, z1);
vertex_texcoord   (vb_pillar_walls, wu1, wv2);
vertex_colour     (vb_pillar_walls, col, 1);

vertex_position_3d(vb_pillar_walls, x1, y1, z0);
vertex_texcoord   (vb_pillar_walls, wu2, wv1);
vertex_colour     (vb_pillar_walls, col, 1);

vertex_position_3d(vb_pillar_walls, x2, y1, z1);
vertex_texcoord   (vb_pillar_walls, wu1, wv2);
vertex_colour     (vb_pillar_walls, col, 1);

vertex_position_3d(vb_pillar_walls, x1, y1, z1);
vertex_texcoord   (vb_pillar_walls, wu2, wv2);
vertex_colour     (vb_pillar_walls, col, 1);

vertex_end(vb_pillar_walls);

// ==== ВЕРШИНА СТОЛБА (unit quad на z=1) ====
vb_pillar_top = vertex_create_buffer();
vertex_begin(vb_pillar_top, vfmt_3d);

uv = sprite_get_uvs(spr_top_tex, current_level.ground_index);
var tu1 = uv[0], tv1 = uv[1];
var tu2 = uv[2], tv2 = uv[3];

vertex_position_3d(vb_pillar_top, x1, y1, z1);
vertex_texcoord   (vb_pillar_top, tu1, tv1);
vertex_colour     (vb_pillar_top, col, 1);

vertex_position_3d(vb_pillar_top, x2, y1, z1);
vertex_texcoord   (vb_pillar_top, tu2, tv1);
vertex_colour     (vb_pillar_top, col, 1);

vertex_position_3d(vb_pillar_top, x2, y2, z1);
vertex_texcoord   (vb_pillar_top, tu2, tv2);
vertex_colour     (vb_pillar_top, col, 1);

vertex_position_3d(vb_pillar_top, x1, y1, z1);
vertex_texcoord   (vb_pillar_top, tu1, tv1);
vertex_colour     (vb_pillar_top, col, 1);

vertex_position_3d(vb_pillar_top, x2, y2, z1);
vertex_texcoord   (vb_pillar_top, tu2, tv2);
vertex_colour     (vb_pillar_top, col, 1);

vertex_position_3d(vb_pillar_top, x1, y2, z1);
vertex_texcoord   (vb_pillar_top, tu1, tv2);
vertex_colour     (vb_pillar_top, col, 1);

vertex_end(vb_pillar_top);

// ==== БИЛЛБОРД ДЛЯ АКТЁРА (вертикальный quad, 1x1, ноги в (0,0,0)) ====
vb_actor = vertex_create_buffer();

// ==== ТЕНЬ (горизонтальный quad 1x1 в XY-плоскости) ====
vb_shadow = vertex_create_buffer();


// ==== ЛАЗЕР ====
spr_laser_tex = laser_s; // сделай любой спрайт-луч (полоска с градиентом)
tex_laser     = sprite_get_texture(laser_s, 0);
vb_laser      = vertex_create_buffer();

// Массив рисуемых лазеров
laser_rays[0, 0] = 0; 
// laser_rays[1, 0] - координата X 1
// laser_rays[1, 1] - координата Y 1
// laser_rays[1, 2] - координата Z 1
// laser_rays[1, 3] - координата X 2
// laser_rays[1, 4] - координата Y 2
// laser_rays[1, 5] - координата Z 2
// laser_rays[1, 6] - толщина луча
// laser_rays[1, 7] - время жизни луча
// laser_rays[0, 0]++

var buildings = irandom_range(current_level.min_building, current_level.max_buildings);
for (; buildings > 0; buildings--)
{
	var building = instance_create(x, y, ground_building);
	building.building_type = current_level.buildings_type
	var coords = gm3d_random_point_floor(32, 128);
	if (is_array(coords)) { building.x = coords[0]; building.y = coords[1]; building.z = coords[2]; building.floor_z = coords[2]; }
	else instance_destroy(building);
}


if (battle_type == 3) // поиск изумруда
{
	var emerald = instance_create(0, 0, chaos_emerald);
	var coords = gm3d_random_point_floor(16, 128);
	if (is_array(coords)) { emerald.x = coords[0]; emerald.y = coords[1]; emerald.z = 0; emerald.floor_z = 0; }
	else
	{
		coords = gm3d_random_point_any_surface(16, 128);
		emerald.x = coords[0]; emerald.y = coords[1]; emerald.z = coords[2]; emerald.floor_z = emerald.z;
	}
	emerald.emerald_color = choose(c_white, c_aqua, c_red, c_lime, c_gray, c_purple, c_blue, c_yellow);
	
	var transport = instance_create(arena_half, arena_half, landed_transport);
	coords = gm3d_random_point_floor(32, 200);
	if (is_array(coords)) { transport.x = coords[0]; transport.y = coords[1]; transport.z = 0; transport.floor_z = 0; }
	
}

if (battle_type == 4) // захват базы
{
	var robotic_elevators_count = 0;
	if (global.current_diff_mn == global.light_diff_mn) robotic_elevators_count = global.robotic_elevators_per_difficult_level * 1;
	else 
	if (global.current_diff_mn == global.normal_diff_mn) robotic_elevators_count = global.robotic_elevators_per_difficult_level * 2;
	else
	if (global.current_diff_mn == global.heavy_diff_mn) robotic_elevators_count = global.robotic_elevators_per_difficult_level * 3;
	robotic_elevators_count += irandom_range(-global.robotic_elevators_per_difficult_deviation, global.robotic_elevators_per_difficult_deviation);

	var robotic_turrets_count = 0;
	if (global.current_diff_mn == global.light_diff_mn) robotic_turrets_count = global.robotic_turrets_per_difficult_level * 1;
	else 
	if (global.current_diff_mn == global.normal_diff_mn) robotic_turrets_count = global.robotic_turrets_per_difficult_level * 2;
	else
	if (global.current_diff_mn == global.heavy_diff_mn) robotic_turrets_count = global.robotic_turrets_per_difficult_level * 3;
	robotic_turrets_count += irandom_range(-global.robotic_turrets_per_difficult_deviation, global.robotic_turrets_per_difficult_deviation);

	for (var i = 0; i < robotic_elevators_count; i++)
	{
		var eggman_base_constructor = instance_create(0, 0, robotic_elevator);
		var coords = gm3d_random_point_floor(16, 128);
		if (is_array(coords)) { eggman_base_constructor.x = coords[0]; eggman_base_constructor.y = coords[1]; eggman_base_constructor.z = 0; eggman_base_constructor.floor_z = 0; }
		else
		{
			coords = gm3d_random_point_any_surface(16, 128);
			eggman_base_constructor.x = coords[0]; eggman_base_constructor.y = coords[1]; eggman_base_constructor.z = coords[2]; eggman_base_constructor.floor_z = eggman_base_constructor.z;
		}
	}
	
	for (var i = 0; i < robotic_turrets_count; i++)
	{
		var eggman_base_turret = instance_create(0, 0, Turret_3D);
		eggman_base_turret.team_is_enemy = true;
		var coords = gm3d_random_point_floor(16, 128);
		if (is_array(coords)) { eggman_base_turret.x = coords[0]; eggman_base_turret.y = coords[1]; eggman_base_turret.z = 0; eggman_base_turret.floor_z = 0; }
		else
		{
			coords = gm3d_random_point_any_surface(16, 128);
			eggman_base_turret.x = coords[0]; eggman_base_turret.y = coords[1]; eggman_base_turret.z = coords[2]; eggman_base_turret.floor_z = eggman_base_turret.z;
		}
	}

}


if (battle_type == 5) // оборона базы
{
	var turrets_count = 0;
	for (var i = 0; i < global.atstockpile[0, 0]; i++)
	{
		if (global.atstockpile[i, 0] == 34)
		{
			turrets_count += global.atstockpile[i, 1];
		}
	}
	
	for (var i = 0; i < turrets_count; i++)
	{
		var turret = instance_create(0, 0, Turret_3D);
		turret.team_is_enemy = false;
		var coords = gm3d_random_point_floor(16, 128);
		if (is_array(coords)) { turret.x = coords[0]; turret.y = coords[1]; turret.z = 0; turret.floor_z = 0; }
		else
		{
			coords = gm3d_random_point_any_surface(16, 128);
			turret.x = coords[0]; turret.y = coords[1]; turret.z = coords[2]; turret.floor_z = turret.z;
		}
	}
}


snow_enabled = false;
var ran = irandom_range(0, 100);
snow_enabled = ran < current_level.snow_probality;

spr_snow = spr_snowflake; // маленький белый спрайт (лучше с альфой)
tex_snow = sprite_get_texture(spr_snow, 0);

snow_count = irandom_range(10, 500);          // плотность (увеличивай/уменьшай)
snow_area  = arena_half + 50;  // радиус области вокруг игрока
snow_top   = irandom_range(400, 600);          // высота "облака" снега над floor
snow_min_z = -40;          // ниже этого — ресет

snow_fall_speed = irandom_range(1, 10);     // скорость падения
snow_wind_angle = irandom_range(0, 300);     // направление ветра (в градусах мира)
snow_wind_speed = irandom_range(0, 10);     // скорость ветра
snow_wobble_amp = irandom_range(0.2, 0.8);     // “дрожание” (турбулентность)
snow_wobble_spd = irandom_range(0.06, 0.1);

snow = array_create(snow_count);

for (var i = 0; i < snow_count; i++)
{
    var rx = random_range(-snow_area, snow_area);
    var ry = random_range(-snow_area, snow_area);

    snow[i] = {
        x: rx,
        y: ry,
        z: random_range(0, snow_top),
        s: random_range(6, 12),       // размер
        v: random_range(0.7, 1.3),    // множитель скорости падения
        w: random_range(0.7, 1.3),    // множитель ветра
        ph: random(1000)              // фаза для wobble
    };
}

vb_snow = vertex_create_buffer();

for (var i = 1; i <= global.team[0, 0]; i++)
{
	if (global.team[i, 0] != global.XMAS_squad_onfight || (global.XMAS_squad_onfight == 0 && battle_type != 5)) continue;
	var soldier = { index: i, hp: global.team[i, 4], max_hp: global.team[i, 5], xp: global.team[i, 6], side: 1 };
	array_push(saved_forces, soldier);
}
for (var i = 1; i <= global.santateam[0, 0]; i++)
{
	if (global.santateam[i, 0] != global.SANTA_squad_onfight || global.SANTA_squad_onfight == 0) continue;
	var soldier = { index: i, count: global.santateam[i, 1], side: 2  };
	array_push(saved_forces, soldier);
}
for (var i = 1; i <= global.eggteam[0, 0]; i++)
{
	if (global.eggteam[i, 0] != global.EGG_squad_onfight || global.EGG_squad_onfight == 0) continue;
	var soldier = { index: i, count: global.eggteam[i, 1], side: 3 };
	array_push(saved_forces, soldier);
}



function is_our_squad(trooper_index)
{
	if (global.XMAS_squad_onfight == 0)
	{
		if (global.team[trooper_index, 0] == global.XMAS_squad_onfight) return true;
		for (var i = 1; i <= global.planes[0,0]; i++)
		{
			if (global.team[trooper_index, 0] != i) continue;
			if (global.planes[i, 14] == 0) return true;
			else return false;
		}
	}
	else
	if (global.team[trooper_index, 0] == global.XMAS_squad_onfight) return true;
	
	
	return false;
}