text.x = x + 281 / 2;
text.y = y + 20 / 2;

//if (global.team[ask_escort.indx, 0] = 0) text.txt = global.txt164;
//else text.txt = global.planes[global.team[ask_escort.indx, 0], 15];

var i;
for (i = 0; i < instance_number(onmap_escort); i++)
{
obj = instance_find(onmap_escort, i);
if (obj.indx != indx) continue;
if (obj.status == 0)
{
text.txt = global.txt182; // 
text.txt = string_insert(global.txt178, text.txt, 1);
}
else
if (obj.status == 1)
{
text.txt = global.txt181; // атака цели
text.txt = string_insert(global.txt178, text.txt, 1);
}
else
if (obj.status == 4)
{
text.txt = global.txt180; // место террора
text.txt = string_insert(global.txt178, text.txt, 1);
}
else
if (obj.status == 3)
{
text.txt = global.txt183; // возврат
text.txt = string_insert(global.txt178, text.txt, 1);
}
else
if (obj.status == 2)
{
text.txt = global.txt217; // патруль
text.txt = string_insert(global.txt178, text.txt, 1);
}
else
if (obj.status == 5)
{
text.txt = global.txt218; // преследование
text.txt = string_insert(global.txt178, text.txt, 1);
}
else
if (obj.status == 6)
{
text.txt = global.txt218; // преследование пока не спустится
text.txt = string_insert(global.txt178, text.txt, 1);
}
break;
}