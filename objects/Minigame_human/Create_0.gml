image_speed = 0;
image_index = 3;
max_speed = 4;
speed = 0;

/// @function scr_bounce_speed_direction(_obj, _bounce, _friction)
/// @description Отскок от объекта при движении через speed/direction.
/// @param _obj       Объект препятствия, например oWall
/// @param _bounce    Сила отскока: 1 = полный отскок, 0.7 = слабее
/// @param _friction  Потеря скорости вдоль стены: 1 = нет потери, 0.9 = чуть гасит
function scr_bounce_speed_direction(_obj, _bounce, _friction)
{
    if (speed <= 0) return;

    var _vx = lengthdir_x(speed, direction);
    var _vy = lengthdir_y(speed, direction);

    // --- Проверка по X ---
    x += _vx;

    if (place_meeting(x, y, _obj))
    {
        var _sx = sign(_vx);
        if (_sx == 0) _sx = 1;

        var _limit = ceil(abs(_vx)) + 8;

        repeat (_limit)
        {
            if (!place_meeting(x, y, _obj)) break;
            x -= _sx;
        }

        _vx = -_vx * _bounce;
        _vy *= _friction;
    }

    // --- Проверка по Y ---
    y += _vy;

    if (place_meeting(x, y, _obj))
    {
        var _sy = sign(_vy);
        if (_sy == 0) _sy = 1;

        var _limit = ceil(abs(_vy)) + 8;

        repeat (_limit)
        {
            if (!place_meeting(x, y, _obj)) break;
            y -= _sy;
        }

        _vy = -_vy * _bounce;
        _vx *= _friction;
    }

    // Переводим вектор обратно в speed/direction
    speed = point_distance(0, 0, _vx, _vy);

    if (speed > 0.01)
    {
        direction = point_direction(0, 0, _vx, _vy);
    }
    else
    {
        speed = 0;
    }
}