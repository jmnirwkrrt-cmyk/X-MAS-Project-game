//if (time_delay_current <= 0) { instance_destroy(self); }

if (x != 0 || y != 0 || target_x != 0 || target_y != 0)
{
	oArena3D.laser_rays[0, 0]++;
	oArena3D.laser_rays[oArena3D.laser_rays[0, 0], 0] = x; // - координата X 1
    oArena3D.laser_rays[oArena3D.laser_rays[0, 0], 1] = y; // - координата Y 1
    oArena3D.laser_rays[oArena3D.laser_rays[0, 0], 2] = z - global.raycast_shoot_height / 1.3; // - координата Z 1
    oArena3D.laser_rays[oArena3D.laser_rays[0, 0], 3] = target_x; // - координата X 2
    oArena3D.laser_rays[oArena3D.laser_rays[0, 0], 4] = target_y; // - координата Y 2
    oArena3D.laser_rays[oArena3D.laser_rays[0, 0], 5] = target_z; // - координата Z 2
    oArena3D.laser_rays[oArena3D.laser_rays[0, 0], 6] = 2; // - толщина луча
    oArena3D.laser_rays[oArena3D.laser_rays[0, 0], 7] = 10; // - время жизни луча
	var puff = instance_create(target_x, target_y, Puff_2_3D);
	puff = target_z;
	instance_destroy(self);	
}