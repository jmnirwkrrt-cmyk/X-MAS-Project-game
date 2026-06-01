/// Main Menu: Step

but[0].txt = global.txt324;
but[1].txt = global.txt325;
but[2].txt = global.txt326;
but[3].txt = global.txt327;
but[4].txt = global.txt328;
but[5].txt = global.txt329;
but[6].txt = global.txt330;
but[7].txt = global.txt331;
but[8].txt = global.txt329;
but[9].txt = global.txt334;
but[10].txt = global.txt337;
but[11].txt = global.txt338;
but[12].txt = "";
but[13].txt = "";
but[14].txt = "";
but[15].txt = global.txt340;
but[16].txt = global.txt339;

function ui_hit_sprite(_spr, _x, _y, _xs, _ys, _menu_type)
{
    var w = sprite_get_width(_spr);
    var h = sprite_get_height(_spr);
    var ox = sprite_get_xoffset(_spr);
    var oy = sprite_get_yoffset(_spr);

    var l = _x - ox * _xs;
    var t = _y - oy * _ys;
    var r = l + w * _xs;
    var b = t + h * _ys;

    var l2 = min(l, r);
    var r2 = max(l, r);
    var t2 = min(t, b);
    var b2 = max(t, b);

    return (_menu_type == menu_type && mx >= l2 && mx <= r2 && my >= t2 && my <= b2);
}