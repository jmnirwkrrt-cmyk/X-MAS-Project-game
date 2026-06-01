/// pActor3D: Create
// Экранные координаты, их будет считать арена
screen_x = x;
screen_y = y;

shadow_x = x;
shadow_y = y;
shadow_scale = 1;



// oPlayer3D: Create

// Position in world: x/y from room, z is height
z = 0;

// Movement parameters
move_speed = 6;

// Vertical motion
vz       = 0;
jump_spd = 22;

floor_z   = 0;
on_ground = true;
prev_z    = 0;

// Visual animation
image_speed = 1.0;