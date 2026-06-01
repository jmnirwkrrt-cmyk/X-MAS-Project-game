/// gm3d_resolve_circle_vs_pillars
/// Возвращает массив с _x и _y. Реализует коллизию со столбами
function gm3d_resolve_circle_vs_pillars(_x, _y, _z, _r)
{
    if (!is_array(global.arena_pillars)) return [_x, _y];

    var half = global.pillar_size * 0.5;
    var n = array_length(global.arena_pillars);

    for (var pass = 0; pass < 3; pass++)
    {
        for (var i = 0; i < n; i++)
        {
            if (_z >= global.pillar_height - 0.01) continue;

            var p = global.arena_pillars[i];
            var dx = _x - p.x;
            var dy = _y - p.y;

            var px = (half + _r) - abs(dx);
            var py = (half + _r) - abs(dy);

            if (px > 0 && py > 0)
            {
                if (px < py)
                {
                    var sx = (dx >= 0) ? 1 : -1;
                    _x += sx * px;
                }
                else
                {
                    var sy = (dy >= 0) ? 1 : -1;
                    _y += sy * py;
                }
            }
        }
    }

    return [_x, _y];
}


/// gm3d_move_actor_xy
/// Определение новой позиции с учетом скорости (перемещение), учитывает функцию gm3d_resolve_circle_vs_pillars
function gm3d_move_actor_xy(_x, _y, _z, _r, _dx, _dy)
{
    var nx = _x + _dx;
    var ny = _y + _dy;

    var rr = gm3d_resolve_circle_vs_pillars(nx, ny, _z, _r);
    nx = rr[0];
    ny = rr[1];

    var h = global.arena_half;
    nx = clamp(nx, -h + _r, h - _r);
    ny = clamp(ny, -h + _r, h - _r);

    return [nx, ny];
}

/// gm3d_direct4_cam_to_point
/// Исправляет ориентацию взгляда на точку относительно камеры и возвращает направление
function gm3d_direct4_cam_to_point(_fromx, _fromy, _tox, _toy, _cam_angle, _fallback)
{
    var ang = point_direction(_fromx, _fromy, _tox, _toy);
    ang = (ang - _cam_angle) mod 360;
    if (ang < 0) ang += 360;

    if (ang >= 315 || ang < 45) return "right";
    if (ang < 135) return "down";
    if (ang < 225) return "left";
    return "up";
}

/// gm3d_direct4_cam_from_vec
/// Исправляет ориентацию взгляда по направлению движения относительно камеры и возвращает направление
function gm3d_direct4_cam_from_vec(_vx, _vy, _cam_angle, _fallback)
{
    var m2 = _vx * _vx + _vy * _vy;
    if (m2 < 0.0001) return _fallback;

    var ang = point_direction(0, 0, _vx, _vy);
    ang = (ang - _cam_angle) mod 360;
    if (ang < 0) ang += 360;

    if (ang >= 315 || ang < 45) return "right";
    if (ang < 135) return "down";
    if (ang < 225) return "left";
    return "up";
}

/// gm3d_world_angle_from_direct
/// Угол по направлению взгляда и камеры. Нужно для отправки объектов по направлению взгляда игрока
function gm3d_world_angle_from_direct(_direct)
{
    var a = 0;
    if (_direct == "right") a = 0;
    else if (_direct == "down") a = 90;
    else if (_direct == "left") a = 180;
    else if (_direct == "up") a = 270;

    var arena = instance_find(oArena3D, 0);
    var cam_ang = instance_exists(arena) ? arena.cam_angle : 0;

    return cam_ang + a;
}


/// gm3d_would_hit_pillar(x, y, r)
/// true если точка (x,y) попадает в "стенку" столба с учетом радиуса r
function gm3d_would_hit_pillar(_x, _y, _r)
{
    if (!is_array(global.arena_pillars)) return false;

    var half = global.pillar_size * 0.5;
    var n = array_length(global.arena_pillars);

    for (var i = 0; i < n; i++)
    {
        var p = global.arena_pillars[i];

        var left   = p.x - half - _r;
        var right  = p.x + half + _r;
        var bottom = p.y - half - _r;
        var top    = p.y + half + _r;

        if (_x > left && _x < right && _y > bottom && _y < top)
            return true;
    }

    return false;
}


function turret_get_cam_angle()
{
    var arena = instance_find(oArena3D, 0);
    if (!instance_exists(arena)) return 0;
    if (!variable_instance_exists(arena, "cam_angle")) return 0;
    return arena.cam_angle;
}

function turret_angle_to_idx(_ang_world, _cam_ang)
{
    var a = _ang_world - _cam_ang;

    a = a mod 360;
    if (a < 0) a += 360;

    // В GML экранная Y-ось перевёрнута, поэтому разворачиваем направление
    a = (360 - a) mod 360;

    // 0-й блок спрайта = турель смотрит налево
    a = (a + 180) mod 360;

    var idx = floor((a + 22.5) / 45);
    idx = idx mod 8;
    if (idx < 0) idx += 8;

    return idx; // строго 0..7
}


function turret_find_target(is_enemy_team, range)
{
    var best = noone;
	
	var enemy;
	if (is_enemy_team) enemy = X_MAS_team_3D;
	else enemy = Terror_Squad_3D;
	

	for (var i = 0; i < instance_number(enemy); i++)
	{
		var object = instance_find(enemy, i);
		with (object)
		{
			if (id == other.id) exit;
			if (variable_instance_exists(id, "hp") && hp <= 0) exit;

			var distance = point_distance_3d(x, y, z, other.x, other.y, other.z);
			if (distance > range) exit;
			
			var tz = (variable_instance_exists(id, "z") ? z : 0);
			var hit = gm3d_raycast_pillars(other.x, other.y, other.z + global.raycast_shoot_height, x, y, tz);
			
			if (!is_array(hit)) {
			    best = id;
				break;
			}
		}
	}
	
    return best;
}












/// ============================================================================
/// SAFE 3D GROUND COMBAT INTEGRATION v2
/// Для текущих oPlayer3D / X_MAS_ally_3D / Terror_Squad_3D
/// ============================================================================
///
/// Эта версия НЕ переписывает движение, ИИ, спрайтовую систему, прыжки, рывки,
/// стрельбу и суперспособности.
///
/// Она делает только четыре вещи:
/// 1) Убирает старую victim-side схему, где жертва сама отслеживает кадры удара врага.
/// 2) Добавляет attacker-side регистрацию ближних ударов: атакующий сам наносит удар.
/// 3) Заменяет старые залипающие реакции hit/fall на таймерно-совместимую логику.
/// 4) Добавляет guard + poise, чтобы:
///    - нельзя было бесконечно держать блок;
///    - лёгкий удар не всегда мгновенно отменял атаку противника;
///    - тяжёлые удары и пробитый poise сбивали с ног.
///
/// ВАЖНО:
/// - GML в твоём проекте использует '=' внутри if как сравнение — я это сохраняю там,
///   где фрагмент вставляется в твой стиль кода.
/// - Новые функции ниже написаны с '==' в сравнении, потому что это обычный читаемый стиль
///   для независимого скрипта; при желании можешь заменить на '=' внутри if.
/// - Никаких e-чисел.
/// ============================================================================


/// ============================================================================
/// SCRIPT: gm3d_combat_core.gml
/// Создай отдельный скрипт и вставь туда всё от этой строки до конца блока SCRIPT.
/// ============================================================================

function gm3d_combat_ensure(_unit)
{
    if (!instance_exists(_unit)) return;
	if (!gm3d_combat_is_full_actor(_unit)) return;
	
	
    // Блок / гард.
    if (!variable_instance_exists(_unit, "guard_max"))        _unit.guard_max = 100;
    if (!variable_instance_exists(_unit, "guard"))            _unit.guard = _unit.guard_max;
    if (!variable_instance_exists(_unit, "guard_regen"))      _unit.guard_regen = 0.20;
    if (!variable_instance_exists(_unit, "guard_hold_drain")) _unit.guard_hold_drain = 0.05;
    if (!variable_instance_exists(_unit, "guard_break_cd"))   _unit.guard_break_cd = 0;

    // Устойчивость к прерыванию.
    if (!variable_instance_exists(_unit, "poise_max"))         _unit.poise_max = 100;
    if (!variable_instance_exists(_unit, "poise"))             _unit.poise = _unit.poise_max;
    if (!variable_instance_exists(_unit, "poise_regen"))       _unit.poise_regen = 0.40;
    if (!variable_instance_exists(_unit, "poise_regen_delay")) _unit.poise_regen_delay = 0;

    // Реакции на попадание.
    if (!variable_instance_exists(_unit, "combat_hit_timer"))  _unit.combat_hit_timer = 0;
    if (!variable_instance_exists(_unit, "combat_fall_timer")) _unit.combat_fall_timer = 0;

    // Чтобы один и тот же кадр удара не наносил урон каждый шаг.
    if (!variable_instance_exists(_unit, "melee_emit_token"))  _unit.melee_emit_token = "";

    // Кадр одиночного тяжёлого удара / пинка.
    // В твоих текущих проверках он обычно около 7–8.
    if (!variable_instance_exists(_unit, "kick_hit_index"))    _unit.kick_hit_index = 8;
}


function gm3d_combat_is_same_ground_level(_a, _b)
{
    if (!instance_exists(_a) || !instance_exists(_b)) return false;

    var floor_a = 0;
    var floor_b = 0;

    if (variable_instance_exists(_a, "floor_z")) floor_a = _a.floor_z;
    if (variable_instance_exists(_b, "floor_z")) floor_b = _b.floor_z;

    return abs(floor_a - floor_b) <= 1;
}


function gm3d_combat_unit_can_be_hit_by_melee(_victim)
{
    if (!instance_exists(_victim) || !gm3d_combat_has_hp(_victim)) return false;
    if (_victim.hp <= 0) return false;

    // Декорации / приманки / простые damageable-объекты:
    // у них нет боевых статусов, но бить их можно.
    if (!gm3d_combat_is_full_actor(_victim))
        return true;

    // Полноценные наземные бойцы
    if (_victim.jump != 0) return false;
    if (_victim.status == "fly") return false;
    if (_victim.fall != 0) return false;
    if (_victim.status == "fall") return false;
	if (_victim.status == "dig") return false;

    return true;
}


function gm3d_combat_block_faces_attacker(_victim, _attacker)
{
    if (!instance_exists(_victim) || !instance_exists(_attacker)) return false;

    var cam_ang = 0;
    var arena = instance_find(oArena3D, 0);
    if (instance_exists(arena)) cam_ang = arena.cam_angle - 90;

    // В проекте эта функция уже есть и уже правильно учитывает камеру.
    var need_direct = gm3d_direct4_cam_to_point(
        _victim.x,
        _victim.y,
        _attacker.x,
        _attacker.y,
        cam_ang,
        _victim.direct
    );

    return need_direct == _victim.direct;
}


function gm3d_combat_can_block(_victim, _attacker)
{
    gm3d_combat_ensure(_victim);

    if (_victim.fight != 5) return false; // активная фаза блока
    if (_victim.guard <= 0) return false;
    if (_victim.guard_break_cd > 0) return false;
    if (_victim.fall != 0) return false;
    if (_victim.jump != 0) return false;
    if (!gm3d_combat_block_faces_attacker(_victim, _attacker)) return false;

    return true;
}


function gm3d_combat_apply_knockback(_victim, _attacker, _power)
{
    if (!instance_exists(_victim) || !instance_exists(_attacker)) return;

    var ang = point_direction(_attacker.x, _attacker.y, _victim.x, _victim.y);
    _victim.vel_x = lengthdir_x(_power, ang);
    _victim.vel_y = lengthdir_y(_power, ang);
}


function gm3d_combat_begin_external_hit(_victim, _frames)
{
    if (!instance_exists(_victim)) return;
    gm3d_combat_ensure(_victim);
	
	if (_victim.object_index == oPlayer3D) instance_destroy(obj_sight_or_pointer);
    _victim.fight = 0;
    _victim.flash = 0;
    _victim.super = 0;
    _victim.jump = 0;
    _victim.hit = 2;
    _victim.combat_hit_timer = max(_victim.combat_hit_timer, _frames);

    // Сохраняем особую старую реакцию Шэдоу.
    if (variable_instance_exists(_victim, "hero_numb") && _victim.hero_numb == 6)
    {
        _victim.status = "fight";
        _victim.back = 1;
        _victim.image_index = 3;
    }
    else
    {
        _victim.status = "block";
        _victim.image_index = 9;
    }

    // Игрок при ударе больше не должен продолжать прицеливание курсором.
    if (_victim.object_index == oPlayer3D)
    {
        if (instance_exists(obj_sight_or_pointer)) instance_destroy(obj_sight_or_pointer);
    }
}


function gm3d_combat_begin_hit(_victim, _attacker, _frames, _knock_power)
{
    if (!instance_exists(_victim)) return;

    gm3d_combat_begin_external_hit(_victim, _frames);
    gm3d_combat_apply_knockback(_victim, _attacker, _knock_power);
}


function gm3d_combat_begin_external_fall(_victim, _frames)
{
    if (!instance_exists(_victim)) return;
    gm3d_combat_ensure(_victim);

    _victim.hit = 0;
    _victim.fall = 2;
    _victim.combat_fall_timer = max(_victim.combat_fall_timer, _frames);
    _victim.fight = 0;
    _victim.flash = 0;
    _victim.super = 0;
    _victim.jump = 0;
    _victim.status = "fall";
    _victim.image_index = 0;
    _victim.back = 0;

    if (_victim.object_index == oPlayer3D)
    {
        if (instance_exists(obj_sight_or_pointer)) instance_destroy(obj_sight_or_pointer);
    }
}


function gm3d_combat_begin_fall(_victim, _attacker, _frames, _knock_power)
{
    if (!instance_exists(_victim)) return;

    gm3d_combat_ensure(_victim);

    _victim.hit = 0;
    _victim.fall = 2;
    _victim.combat_fall_timer = max(_victim.combat_fall_timer, _frames);

    _victim.fight = 0;
    _victim.delay = 0;
    _victim.flash = 0;
    _victim.super = 0;
    _victim.jump = 0;

    _victim.status = "fall";
    _victim.image_index = 0;
    _victim.back = 0;

    _victim.up = 0;
    _victim.down = 0;
    _victim.left = 0;
    _victim.right = 0;

    _victim.combat_fall_vz = 0;

    gm3d_combat_apply_knockback(_victim, _attacker, _knock_power);
}


function gm3d_combat_spawn_hit_fx(_victim, _kind)
{
    if (!instance_exists(_victim)) return;

    var rx = 0;
    var ry = 0;
    var puff = noone;

    if (_kind == 2)
    {
        rx = irandom_range(-20, 20);
        ry = irandom_range(-20, 20);
        puff = instance_create(_victim.x + rx, _victim.y + ry, Puff_2_3D);
    }
    else
    {
        rx = irandom_range(-14, 14);
        ry = irandom_range(-14, 14);
        puff = instance_create(_victim.x + rx, _victim.y + ry, Puff_1_3D);
    }

    if (instance_exists(puff)) puff.z = _victim.z;
}


function gm3d_combat_spawn_block_fx(_victim)
{
    if (!instance_exists(_victim)) return;

    var ring = instance_create(
        _victim.x + irandom_range(-10, 10),
        _victim.y + irandom_range(-10, 10),
        Blue_Ring_3D
    );

    if (instance_exists(ring)) ring.z = _victim.z;
}


function gm3d_combat_get_hit_params(_attacker, _kind)
{
    var result = {
        damage: max(1, _attacker.damage),
        guard_cost: 0,
        poise_cost: 0,
        knock: 0,
        hit_frames: 0,
		fall_frames: 0,
        heavy: false,
        chip: 0
    };

    if (_kind == 1)
    {
        result.damage = max(1, round(_attacker.damage));
        result.guard_cost = 14;
        result.poise_cost = 22;
        result.knock = 1.6;
        result.hit_frames = 10;
        result.heavy = false;
        result.chip = 0;
    }
    else if (_kind == 2)
    {
        result.damage = max(1, round(_attacker.damage));
        result.guard_cost = 20;
        result.poise_cost = 32;
        result.knock = 2.2;
        result.hit_frames = 14;
        result.heavy = false;
        result.chip = 0.05;
    }
    else if (_kind == 3)
	{
	    // Финал обычной серии — Sonic Battle-style Heavy finisher:
	    // гарантированно сбивает с ног и сильно отбрасывает.
	    result.damage = max(1, round(_attacker.damage * 1.20));
	    result.guard_cost = 42;
	    result.poise_cost = 999; // по сути гарантированный срыв устойчивости
	    result.knock = 18;
	    result.hit_frames = 0;
	    result.fall_frames = 38;
	    result.heavy = true;
	    result.chip = 0.16;
	}
	else if (_kind == 4)
	{
	    // Отдельный kick — ещё сильнее, чем финал серии.
	    result.damage = max(1, round(_attacker.damage * 1.30));
	    result.guard_cost = 52;
	    result.poise_cost = 999;
	    result.knock = 23;
	    result.hit_frames = 0;
	    result.fall_frames = 44;
	    result.heavy = true;
	    result.chip = 0.22;
	}

    return result;
}


function gm3d_combat_receive_melee(_victim, _attacker, _kind)
{
	
    if (!instance_exists(_victim) || !instance_exists(_attacker)) return false;

    gm3d_combat_ensure(_victim);
    gm3d_combat_ensure(_attacker);

    if (!gm3d_combat_unit_can_be_hit_by_melee(_victim)) return false;
    if (!gm3d_combat_is_same_ground_level(_victim, _attacker)) return false;

    var p = gm3d_combat_get_hit_params(_attacker, _kind);

    // ------------------------------------------------------------------------
    // БЛОК
    // ------------------------------------------------------------------------
	// Руж: врождённый 50% автоблок любого входящего melee-удара
	if (gm3d_combat_try_rouge_passive_block(_victim))
	{
	    return true;
	}
    if (gm3d_combat_can_block(_victim, _attacker))
    {
        _victim.guard -= p.guard_cost;
        _victim.poise_regen_delay = max(_victim.poise_regen_delay, 45);

        // Сильные удары понемногу продавливают защиту даже до guard break.
		// Простые разрушаемые объекты: bpla_3D и подобные.
		// Они получают урон, но НЕ проходят через hit/fall/block/poise.
		if (!gm3d_combat_is_full_actor(_victim))
		{
		    if (p.chip > 0)
			{
			    _victim.hp -= max(1, round(p.damage * p.chip));
			}
		
		    var puff = instance_create(_victim.x, _victim.y, Puff_1_3D);
		
		    if (instance_exists(puff))
		    {
		        if (variable_instance_exists(_victim, "z"))
		            puff.z = _victim.z;
		        else
		            puff.z = 0;
		    }
		
		    return true;
		}
		
		if (p.chip > 0)
		{
		    _victim.hp -= max(1, round(p.damage * p.chip));
		}
		
		// Тяжёлые удары — это отдельная категория.
		// Они не просто сбивают poise, а сразу переводят в полноценный нокдаун.
		if (p.heavy)
		{
		    _victim.poise = max(_victim.poise, 30);
		    gm3d_combat_begin_fall(_victim, _attacker, p.fall_frames, p.knock);
		}
		else if (_victim.poise <= 0)
		{
		    _victim.poise = max(_victim.poise, 30);
		    gm3d_combat_begin_fall(_victim, _attacker, 34, p.knock);
		}
		else
		{
		    gm3d_combat_begin_hit(_victim, _attacker, p.hit_frames, p.knock);
		}

        gm3d_combat_spawn_block_fx(_victim);
        gm3d_combat_apply_knockback(_victim, _attacker, p.knock * 0.22);

        if (_victim.guard <= 0)
        {
            _victim.guard = 0;
            _victim.guard_break_cd = 90;
            _victim.hp -= max(1, round(p.damage * 0.30));
            _victim.poise = max(0, _victim.poise - 60);
            _victim.poise_regen_delay = 100;
            gm3d_combat_begin_fall(_victim, _attacker, 34, p.knock);
        }

        return true;
    }

    // ------------------------------------------------------------------------
    // ОБЫЧНОЕ ПОПАДАНИЕ
    // ------------------------------------------------------------------------
    _victim.hp -= p.damage;
    _victim.poise = max(0, _victim.poise - p.poise_cost);
    _victim.poise_regen_delay = max(_victim.poise_regen_delay, 90);
    gm3d_combat_spawn_hit_fx(_victim, _kind);

    // Если жертва сама уже бьёт, лёгкий удар не всегда ломает её атаку.
    // Это специально сглаживает эффект «кто первым попал, тот законтролил навсегда».
    var attack_through_light_hit = false;
    if (_kind <= 2)
    {
        if (_victim.fight > 0 && _victim.fight < 4 && _victim.poise > 0)
        {
            attack_through_light_hit = true;
        }
    }

    if (attack_through_light_hit)
    {
        gm3d_combat_apply_knockback(_victim, _attacker, p.knock * 0.35);
        return true;
    }

    // Тяжёлый удар или выбитый poise — падение.
    if (p.heavy || _victim.poise <= 0)
    {
        _victim.poise = max(_victim.poise, 30);
        gm3d_combat_begin_fall(_victim, _attacker, 34, p.knock);
    }
    else
    {
        gm3d_combat_begin_hit(_victim, _attacker, p.hit_frames, p.knock);
    }

    return true;
}


function gm3d_combat_emit_melee(_attacker, _target_parent)
{
    if (!instance_exists(_attacker)) return;
    gm3d_combat_ensure(_attacker);

    if (_attacker.hp <= 0) return;
    if (_attacker.fall != 0) return;
    if (_attacker.hit != 0) return;

    var frame = floor(_attacker.image_index);
    var kind = 0;

    // Комбо из трёх ударов.
    if (_attacker.fight == 1 && frame >= _attacker.hit_1_index) kind = 1;
    else if (_attacker.fight == 2 && frame >= _attacker.hit_2_index) kind = 2;
    else if (_attacker.fight == 3 && frame >= _attacker.hit_3_index) kind = 3;

    // Отдельный тяжёлый удар / пинок.
    else if (_attacker.fight == 7 && frame >= _attacker.kick_hit_index) kind = 4;

    // Нет активного hit-frame — если атака закончилась, очищаем токен.
    if (kind == 0)
    {
        if (_attacker.fight == 0 || _attacker.fight == 4 || _attacker.fight == 5 || _attacker.fight == 6)
        {
            _attacker.melee_emit_token = "";
        }
        return;
    }

    var token = string(_attacker.fight) + "_" + string(kind);
    if (_attacker.melee_emit_token == token) return;
    _attacker.melee_emit_token = token;

    var n = instance_number(_target_parent);
    for (var i = 0; i < n; i++)
    {
        var victim = instance_find(_target_parent, i);
        if (!instance_exists(victim)) continue;
        if (victim == _attacker) continue;
        if (!gm3d_combat_unit_can_be_hit_by_melee(victim)) continue;
        if (!gm3d_combat_is_same_ground_level(victim, _attacker)) continue;

        if (point_distance_3d(_attacker.x, _attacker.y, _attacker.z, victim.x, victim.y, victim.z) <= global.range_to_hit)
        {
            gm3d_combat_receive_melee(victim, _attacker, kind);
        }
    }
}


function gm3d_combat_tick_unit(_unit)
{
    if (!instance_exists(_unit)) return;
    gm3d_combat_ensure(_unit);

    // ------------------------------------------------------------------------
    // Ресурсы блока / устойчивости
    // ------------------------------------------------------------------------
    if (_unit.guard_break_cd > 0) _unit.guard_break_cd -= 1;
    if (_unit.poise_regen_delay > 0) _unit.poise_regen_delay -= 1;

    if (_unit.fight == 5)
    {
        _unit.guard -= _unit.guard_hold_drain;

        if (_unit.guard <= 0)
        {
            _unit.guard = 0;
            _unit.guard_break_cd = max(_unit.guard_break_cd, 60);

            // Пассивно исчерпанный блок не валит на землю, а принудительно отпускает защиту.
            _unit.fight = 6;
            _unit.status = "block";
            _unit.back = 1;

            if (variable_instance_exists(_unit, "hero_numb") && _unit.hero_numb == 1)
                _unit.image_index = 10;
            else
                _unit.image_index = 20;
        }
    }
    else
    {
        if (_unit.guard < _unit.guard_max && _unit.guard_break_cd <= 0)
        {
            _unit.guard = min(_unit.guard_max, _unit.guard + _unit.guard_regen);
        }
    }

    if (_unit.poise_regen_delay <= 0 && _unit.poise < _unit.poise_max)
    {
        _unit.poise = min(_unit.poise_max, _unit.poise + _unit.poise_regen);
    }

    // ------------------------------------------------------------------------
    // Совместимость с уже существующими внешними эффектами:
    // лазеры/телекинез/старые куски кода иногда ставят hit=1 или fall=1 напрямую.
    // Переводим их в новую логику без зависаний.
    // ------------------------------------------------------------------------
    if (_unit.hit == 1)
    {
        gm3d_combat_begin_external_hit(_unit, 14);
    }

    if (_unit.fall == 1)
    {
        gm3d_combat_begin_external_fall(_unit, 34);
    }

    // ------------------------------------------------------------------------
    // Реакция на лёгкое попадание
    // ------------------------------------------------------------------------
    if (_unit.hit == 2)
    {
        if (_unit.combat_hit_timer > 0)
        {
            _unit.combat_hit_timer -= 1;
        }

        if (_unit.status != "run" && _unit.status != "fall")
        {
            if (!(variable_instance_exists(_unit, "hero_numb") && _unit.hero_numb == 6))
            {
                _unit.status = "block";
            }
        }

        // Более аккуратное затухание отбрасывания.
        _unit.vel_x *= 0.82;
        _unit.vel_y *= 0.82;
        if (abs(_unit.vel_x) < 0.05) _unit.vel_x = 0;
        if (abs(_unit.vel_y) < 0.05) _unit.vel_y = 0;

        if (_unit.combat_hit_timer <= 0)
        {
            _unit.hit = 0;
            _unit.combat_hit_timer = 0;

            if (_unit.fall == 0 && _unit.fight == 0 && _unit.flash == 0 && _unit.super == 0 && _unit.jump == 0)
            {
                _unit.status = "idle";
                _unit.image_index = 0;
                _unit.back = 0;
            }
        }
    }

    // ------------------------------------------------------------------------
    // Падение / нокдаун
    // ------------------------------------------------------------------------
    if (_unit.fall == 2)
	{
	    _unit.status = "fall";
		_unit.fight = 0;
		_unit.hit = 0;
		_unit.jump = 0;
		_unit.flash = 0;
		
	    if (_unit.combat_fall_timer > 0)
	    {
	        _unit.combat_fall_timer -= 1;
	    }
	
	    // Если нокдаун получен в воздухе или на сходе со столба —
	    // резко тащим тело вниз, а не оставляем его висеть.
	    if (_unit.z > _unit.floor_z + 0.1)
	    {
	        if (!variable_instance_exists(_unit, "combat_fall_vz"))
	            _unit.combat_fall_vz = 0;
	
	        _unit.combat_fall_vz += 1.6;
	        if (_unit.combat_fall_vz > 18)
	            _unit.combat_fall_vz = 18;
	
	        _unit.z -= _unit.combat_fall_vz;
	
	        if (_unit.z <= _unit.floor_z)
	        {
	            _unit.z = _unit.floor_z;
	            _unit.combat_fall_vz = 0;
	        }
	    }
	    else
	    {
	        _unit.z = _unit.floor_z;
	        _unit.combat_fall_vz = 0;
	    }
	
	    // ВАЖНО:
	    // vel_x/vel_y здесь больше НЕ душим.
	    // Они уже затухают в общей системе движения через *= 0.85.
	    // Иначе сильный отлёт снова превращается в жалкий ползок.
	
	    var anim_done = floor(_unit.image_index) >= _unit.image_number - 1;
	    var grounded  = _unit.z <= _unit.floor_z + 0.1;
	
	    if (anim_done && grounded && _unit.combat_fall_timer <= 0)
	    {
	        _unit.fall = 0;
	        _unit.combat_fall_timer = 0;
	        _unit.combat_fall_vz = 0;
	
	        _unit.status = "idle";
	        _unit.image_index = 0;
	        _unit.back = 0;
			
			_unit.vel_x = 0;
			_unit.vel_y = 0;
	    }
	}
}


function gm3d_combat_try_rouge_passive_block(_victim)
{
    if (!instance_exists(_victim)) return false;

    if (!variable_instance_exists(_victim, "hero_numb")) return false;
    if (_victim.hero_numb != 5) return false;

    // irandom(1) даёт либо 0, либо 1, то есть ровно 50/50
    if (irandom(1) != 0) return false;

    var ring = instance_create(_victim.x, _victim.y, Blue_Ring_3D);

    if (instance_exists(ring))
    {
        if (variable_instance_exists(_victim, "z"))
            ring.z = _victim.z;
        else
            ring.z = 0;
    }

    return true;
}

function gm3d_combat_has_hp(_unit)
{
    return instance_exists(_unit)
        && variable_instance_exists(_unit, "hp");
}

function gm3d_combat_is_full_actor(_unit)
{
    if (!gm3d_combat_has_hp(_unit)) return false;

    return variable_instance_exists(_unit, "status")
        && variable_instance_exists(_unit, "fight")
        && variable_instance_exists(_unit, "fall")
        && variable_instance_exists(_unit, "jump")
        && variable_instance_exists(_unit, "hit")
        && variable_instance_exists(_unit, "vel_x")
        && variable_instance_exists(_unit, "vel_y")
        && variable_instance_exists(_unit, "z")
        && variable_instance_exists(_unit, "floor_z");
}



/// ============================================================================
/// END SCRIPT: gm3d_combat_core.gml
/// ============================================================================



/// ============================================================================
/// 1. ДОБАВЬ В CREATE КАЖДОГО НАЗЕМНОГО ЮНИТА
/// ============================================================================
/// В Create oPlayer3D, X_MAS_ally_3D и Terror_Squad_3D добавить:
///
/// gm3d_combat_ensure(id);
///
/// Для тех, у кого пинок срабатывает не на 8-м кадре, можно переопределить:
/// kick_hit_index = 8;
/// ============================================================================



/// ============================================================================
/// 2. oPlayer3D Step — ЗАМЕНИ СТАРЫЙ БЛОК ПОЛУЧЕНИЯ УДАРОВ
/// ============================================================================
/// В начале oPlayer3D Step у тебя сейчас стоит большой цикл:
/// for (var i = 0; i < instance_number(Terror_Squad_3D); i++) { ... }
///
/// УДАЛИ ЕГО ЦЕЛИКОМ.
/// Оставь только depth, затем сразу идёт твоя озвучка.
/// Должно стать так:

/*
depth = room_height - y;

/// озвучка
*/



/// ============================================================================
/// 3. Ally_obj Step — ТО ЖЕ САМОЕ
/// ============================================================================
/// В начале Ally_obj Step удалить весь старый цикл чтения чужих кадров удара.
/// Оставить:

/*
depth = room_height - y;

/// озвучка
*/



/// ============================================================================
/// 4. oPlayer3D End Step — ЗАМЕНИ ТОЛЬКО hit/fall, НО НЕ ТРОГАЙ ДВИЖЕНИЕ
/// ============================================================================
/// Найди старый участок:
///
/// if (fall=1) { ... }
/// if (fall=2) { ... }
/// if (hit=1)  { ... }
/// if (hit=2)  { ... }
///
/// УДАЛИ ЕГО ЦЕЛИКОМ и поставь вместо него:

/*
gm3d_combat_tick_unit(id);
*/

/// ВАЖНО: fight=7 оставь ниже как был.



/// ============================================================================
/// 5. Ally_obj EndStep — ЗАМЕНИ ТОЛЬКО hit/fall
/// ============================================================================
/// Найди старые секции:
///
/// ///////////////////// Падение
/// if (fall == 1) ...
/// if (fall == 2) ...
///
/// /////////////////// Ударен
/// if (hit == 1) ...
/// if (hit == 2) ...
///
/// УДАЛИ ИХ и поставь один вызов:

/*
gm3d_combat_tick_unit(id);
*/



/// ============================================================================
/// 6. Terror_Squad_3D Step — ЗАМЕНИ ТОЛЬКО hit/fall
/// ============================================================================
/// В актуальном 3D-коде противника есть блоки:
///
/// ///////////////////// Падение
/// if (fall == 1) ...
/// if (fall == 2) ...
///
/// /////////////////// Ударен
/// if (hit == 1) ...
/// if (hit == 2) ...
///
/// УДАЛИ ИХ и поставь:

/*
gm3d_combat_tick_unit(id);
*/

/// Это сохраняет весь ИИ, стрельбу плазмой, прыжки, рывки, коллизии и анимации.



/// ============================================================================
/// 7. РЕГИСТРАЦИЯ УДАРОВ — ДОБАВЬ В КОНЕЦ СОБЫТИЙ ПОСЛЕ АНИМАЦИИ
/// ============================================================================
/// Поскольку твой код сам вручную повышает image_index в самом конце,
/// ближний удар лучше испускать ПОСЛЕ этого блока.
/// image_index может быть дробным; floor(image_index) берётся внутри функции.

/// В самом конце oPlayer3D End Step после:
/// px=x; py=y; pz=z;
/// добавить:

/*
gm3d_combat_emit_melee(id, Terror_Squad_3D);
*/

/// В самом конце Ally_obj EndStep после:
/// px=x; py=y; pz=z;
/// добавить:

/*
gm3d_combat_emit_melee(id, Terror_Squad_3D);
*/

/// В самом конце актуального Terror_Squad_3D Step после анимации и спрайта,
/// но до show_debug_message(...) — добавить:

/*
gm3d_combat_emit_melee(id, X_MAS_team_3D);
*/



/// ============================================================================
/// 8. ТАКЖЕ УДАЛИ ИЗ Ally_obj EndStep СТАРЫЙ БЛОК "ДРАКА"
/// ============================================================================
/// В актуальном Ally_obj EndStep после секции гранаты у тебя идёт:
///
/// /////////////////// Драка
/// if (instance_exists(target)) { ... }
///
/// Это старая victim-side регистрация урона от цели.
/// УДАЛИ ЕЁ ЦЕЛИКОМ.
/// Теперь удары врага будут приходить из gm3d_combat_emit_melee(id, X_MAS_team_3D)
/// в Terror_Squad_3D Step.



/// ============================================================================
/// 9. ДЛЯ Terror_Squad_3D УДАЛИ СТАРУЮ victim-side СХЕМУ, ЕСЛИ ОНА ГДЕ-ТО ЕЩЁ ОСТАЛАСЬ
/// ============================================================================
/// В актуальном 3D противнике из твоего нового файла основной Step уже не содержит
/// старого блока "огребаем от X_MAS_team_3D" в начале. Если в объекте ещё где-то
/// осталась старая версия с чтением enemy.image_index — убрать.



/// ============================================================================
/// 10. ТОЧЕЧНЫЙ БАГФИКС, ЕСЛИ ПОКА НЕ УДАЛИЛ СТАРУЮ СЕКЦИЮ "ДРАКА" У СОЮЗНИКА
/// ============================================================================
/// В старом коде в тяжёлом попадании стоит:
///
/// target.vel_x = lengthdir_x(...)
/// target.vel_y = lengthdir_y(...)
///
/// Это отбрасывает АТАКУЮЩЕГО, а не пострадавшего.
/// Если этот старый блок временно остаётся, должно быть:
///
/// vel_x = lengthdir_x(5, point_direction(target.x, target.y, x, y));
/// vel_y = lengthdir_y(5, point_direction(target.x, target.y, x, y));
///
/// Но после удаления старого victim-side блока этот фикс уже не нужен.
/// ============================================================================




/// gm3d_voice_begin_frame()
/// Сбрасывает счётчик голосов один раз за кадр.
function gm3d_voice_begin_frame()
{
    if (!variable_global_exists("ally_voice_frame_stamp"))
    {
        global.ally_voice_frame_stamp = -1;
        global.ally_voice_count_frame = 0;
        global.ally_voice_cooldown = 0;
    }

    // current_time обычно одинаков внутри одного кадра.
    // Нам нужно понять: начался новый кадр — значит можно сбросить лимит.
    if (global.ally_voice_frame_stamp != current_time)
    {
        global.ally_voice_frame_stamp = current_time;
        global.ally_voice_count_frame = 0;

        if (global.ally_voice_cooldown > 0)
        {
            global.ally_voice_cooldown -= 1;
        }
    }
}


/// gm3d_ally_voice_rank(_id)
/// Возвращает порядковый номер союзника среди X_MAS_ally_3D.
/// Используем это для варианта “говорят только первые 5”.
function gm3d_ally_voice_rank(_id)
{
    var n = instance_number(X_MAS_ally_3D);

    for (var i = 0; i < n; i++)
    {
        if (instance_find(X_MAS_ally_3D, i) == _id)
        {
            return i;
        }
    }

    return 999999;
}


/// gm3d_voice_take_slot(_max_per_frame, _cooldown)
/// Возвращает true, если этому объекту можно сейчас запустить/запланировать голос.
function gm3d_voice_take_slot(_max_per_frame, _cooldown)
{
    gm3d_voice_begin_frame();

    if (global.ally_voice_count_frame >= _max_per_frame)
        return false;

    if (global.ally_voice_cooldown > 0)
        return false;

    global.ally_voice_count_frame += 1;
    global.ally_voice_cooldown = _cooldown;

    return true;
}


/// gm3d_voice_play(_snd, _vol, _max_per_frame, _cooldown)
/// Ограниченный запуск голосовой реплики.
function gm3d_voice_play(_snd, _vol, _max_per_frame, _cooldown)
{
    if (gm3d_voice_take_slot(_max_per_frame, _cooldown))
    {
        sound_play(_snd);
        sound_volume(_snd, _vol);
        return true;
    }

    return false;
}