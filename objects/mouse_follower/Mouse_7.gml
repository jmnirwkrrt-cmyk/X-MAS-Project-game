if (type = 0)
{
instance_create(x, y, throw_grenade);
}
else
{
if (!instance_exists(hero_obj))
{
hero = instance_create(x, y, hero_obj);
hero.massive_index = type;
global.team[type, 4] = -1;
}
else
{
hero = instance_create(x, y, ally_obj);
hero.massive_index = type;
global.team[type, 4] = -1;
}

if (global.team[type, 2] = "tails") hero.hero_numb = 1;
if (global.team[type, 2] = "amy") hero.hero_numb = 2;
if (global.team[type, 2] = "sonic") hero.hero_numb = 3;
if (global.team[type, 2] = "knuckles") hero.hero_numb = 4;
if (global.team[type, 2] = "rouge") hero.hero_numb = 5;
if (global.team[type, 2] = "shadow") hero.hero_numb = 6;
if (global.team[type, 2] = "silver") hero.hero_numb = 7;
if (global.team[type, 2] = "snowman") hero.hero_numb = 8;
if (global.team[type, 2] = "snowman" and global.team[type, 3] = "ak") hero.hero_numb = 9;
if (global.team[type, 2] = "snowman" and global.team[type, 3] = "rifle") hero.hero_numb = 10;
if (global.team[type, 2] = "snowman" and global.team[type, 3] = "laser") hero.hero_numb = 11;
}



__view_set( e__VW.Object, 0, hero_obj );
__view_set( e__VW.HBorder, 0, __view_get( e__VW.WPort, 0 ) / 2 );
__view_set( e__VW.VBorder, 0, __view_get( e__VW.HPort, 0 ) / 2 );
instance_destroy(tabletop);
instance_destroy(self);

