time--;
if (time < 1) { image_alpha -= 0.05; }
if (image_alpha = 0) { instance_destroy(self); }

if (hspeed > 0) { sprite_index = wave_right; }
if (hspeed < 0) { sprite_index = wave_left; }
if (vspeed < 0) { sprite_index = wave_up; }
if (vspeed > 0) { sprite_index = wave_down; }

