if (hp >= 1)
{
	global.team[massive_index, 4] = max(1, hp - healed_hp);
}
else
{
	global.team[massive_index, 4] = 0;
	global.loss_total++;
}

instance_destroy(obj_sight_or_pointer);