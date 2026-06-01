
txt = string_insert("", time_m.year_current, 0);
txt = string_insert(txt, ".", 0);
txt = string_insert(txt, time_m.month_current, 0);
txt = string_insert(txt, ".", 0);
if (time_m.day_current < 10) { txt = string_insert(txt, "0", 0); }
txt = string_insert(txt, time_m.day_current, 0);

