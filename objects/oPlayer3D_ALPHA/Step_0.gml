// oPlayer3D: Step

// Ensure arena globals exist
if (!variable_global_exists("arena_pillars")) exit;

prev_z = z;

// --- Horizontal input (WASD) ---
var mx = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var my = keyboard_check(ord("S")) - keyboard_check(ord("W"));

var len = sqrt(mx * mx + my * my);
if (len > 0)
{
    mx /= len;
    my /= len;
}

// "толщина" игрока
var radius = 16;

var old_x = x;
var old_y = y;

var step_x = mx * move_speed;
var step_y = my * move_speed;

var pillars = global.arena_pillars;
var half    = global.pillar_size * 0.5;
var n       = array_length(pillars);

// --- движение по X с проверкой столбов ---
x = old_x + step_x;
y = old_y;

var coll = false;
for (var i = 0; i < n; i++)
{
    var p = pillars[i];

    // AABB + радиус игрока
    if (abs(x - p.x) < half + radius && abs(y - p.y) < half + radius)
    {
        coll = true;
        break;
    }
}
if (coll) x = old_x;

// --- движение по Y с проверкой столбов ---
y = old_y + step_y;

coll = false;
for (var i = 0; i < n; i++)
{
    var p = pillars[i];

    if (abs(x - p.x) < half + radius && abs(y - p.y) < half + radius)
    {
        coll = true;
        break;
    }
}
if (coll) y = old_y;

// Ограничение арены
var ah = global.arena_half - radius;
x = clamp(x, -ah, ah);
y = clamp(y, -ah, ah);


// --- Jump ---
if (keyboard_check_pressed(vk_space) && on_ground)
{
    vz = jump_spd;
    on_ground = false;
}

// --- Vertical physics ---
vz -= gravity;
z += vz;

// Default floor is ground
floor_z = 0;

// Landing on pillar tops when falling down
if (vz <= 0)
{
    var pillars = global.arena_pillars;
    var half = global.pillar_size * 0.5;
    var top_z = global.pillar_height;
    var n = array_length(pillars);

    for (var i = 0; i < n; i++)
    {
        var p = pillars[i];
        if (x >= p.x - half && x <= p.x + half &&
            y >= p.y - half && y <= p.y + half)
        {
            if (prev_z >= top_z && z <= top_z)
            {
                floor_z = top_z;
                break;
            }
        }
    }
}

// Clamp to floor
if (z <= floor_z)
{
    z = floor_z;
    if (vz < 0) vz = 0;
    on_ground = true;
}
else
{
    on_ground = false;
}