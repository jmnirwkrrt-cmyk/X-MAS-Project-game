direction = point_direction(x,y, point_x, point_y);
if (distance_to_point(point_x, point_y) < 30)
{
point_x = irandom_range(0, room_width);
point_y = irandom_range(0, room_height);
}
speed = 2;


