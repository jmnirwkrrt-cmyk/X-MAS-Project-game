randx = irandom_range(-10, 10);
randy = irandom_range(-10, 10);
instance_create(x + randx, y + randy, Puff_1);


r = irandom_range(0, 1);
if (r = 0) { sound_play(bullet_hit_1); sound_volume(bullet_hit_1, global.voicevolume); }
if (r = 0) { sound_play(bullet_hit_2); sound_volume(bullet_hit_2, global.voicevolume); }

