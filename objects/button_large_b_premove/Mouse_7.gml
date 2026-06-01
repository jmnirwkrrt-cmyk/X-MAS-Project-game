if (!instance_exists(ask_message))
{
global.click = true;
button_sound_effect();
image_index = 0;
if (type = 1)
{
var i;
for (i = 0; i < instance_number(onmap_escort); i++)
{
obj = instance_find(onmap_escort, i);
if (obj.indx != indx) continue;
obj.status = 3;
break;
}
instance_destroy(ask_escort);
}
if (type = 2)
{
instance_destroy(ask_escort);
}
}

