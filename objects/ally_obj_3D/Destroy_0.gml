if (image_blend == c_white)
{
	if (hp >= 1)
	{
		global.team[massive_index, 4] = max(1, hp - healed_hp);
	}
	else
	{
		global.team[massive_index, 4] = 0;
		global.loss_total++;
	}
}
else
if (image_blend == c_blue)
{
	if (hp >= 1)
	{
		global.santateam[massive_index, 1]++;
	}
}