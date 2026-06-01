if (hp < 0)
{
	instance_destroy(self);
	exit;	
}
image_blend = make_colour_rgb(255, hp, hp);
if (global.pause == 0 && (instance_exists(X_MAS_team_3D) || instance_exists(oPlayer3D)))
{
	call_in_timer--;
	if (call_in_timer < 1)
	{
		image_speed = 0.5;
		if (image_index == 5)
		{
			var robot = instance_create(x, y, metal_sonic_3D);
			robot.z = z;
			robot.floor_z = z;
		}
		if (image_index == image_number - 1)
		{
			call_in_timer = global.robotic_elevators_timer;
			image_index = 0;
			image_speed = 0;
		}
		
	}
}
