/// @description ограничения pActor3D

// после того как посчитал x, y с учётом движения/сталкновений
var r = 16; //coll_radius; // или твой реальный радиус, например 16
var clas = gm3d_clamp_to_arena(x, y, r);

x = clas[0];
y = clas[1];
