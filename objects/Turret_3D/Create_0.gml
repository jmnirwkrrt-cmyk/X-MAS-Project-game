// Inherit the parent event
event_inherited();

// --- Параметры спрайта турели ---
spr_turret = turret_land_egg; // твой единый спрайт
sprite_index = spr_turret;
image_speed = 0;

last_target_vector = {x: x + 1, y: y + 1};

TUR_DIR_COUNT = 8;
TUR_FRAMES_PER_DIR = 11;   // 0 idle + 10 fire
TUR_DEATH_LEN = 13;
TUR_DEATH_START = TUR_DIR_COUNT * TUR_FRAMES_PER_DIR;

// 0° в спрайте = "налево"
TUR_SPRITE_ZERO_OFFSET = 180; // сдвиг, чтобы world-left дал sprite-angle 0

// --- 3D параметры для твоего рендера ---
z = 0;
floor_z = 0;
high = 2;                 // если у тебя масштаб высоты через high
shadow_scale = 2;        // по вкусу

// --- Боевая логика ---
team_is_enemy = false;      // эта турель — враг
range = 600;
fire_cooldown_max = 90;
fire_cooldown_egg = 90;
fire_cooldown_xmas = 35;
fire_cooldown = irandom_range(fire_cooldown_max, fire_cooldown_max);

fire_active = false;
fire_frame = 0;            // 1..10
fire_shot_frame = 4;       // на каком кадре выстрел "считается"
aim_idx = 0;               // текущий дискретный угол 0..7 (для спрайта)
aim_idx_locked = 0;

hp = 100 * global.current_diff_mn;
max_hp = hp;

energy = 200;
max_energy = energy;

dying = false;
stunned = true;
death_frame = 0;

stun_cooldown = -1;
stun_cooldown_max = 100;

target_id = noone;
