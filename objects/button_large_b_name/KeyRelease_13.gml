if (write and !instance_exists(ask_planeweapon) and !instance_exists(ask_question_p))
{
txt = newname;
global.planes[ask_plane.indx, 15] = txt;
write = false;
image_blend = c_white;
}
