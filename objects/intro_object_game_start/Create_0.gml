if (global.skip_intro) { global.skip_intro = false; room_goto_next(); exit; }
video = video_open("X-MAS_intro_3.mp4");
video_enable_loop(false);
video_set_volume(global.soundvolume);