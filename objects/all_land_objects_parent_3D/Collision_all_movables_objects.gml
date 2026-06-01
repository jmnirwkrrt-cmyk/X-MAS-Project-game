if (other.jump == 3 and z <= other.z) other.jump = -1;
if (other.jump == -1) other.z = z;
if (other.z = z) { depth = other.depth + 1; }

//other.jump = 0;

var __b__;
__b__ = action_if_variable(other.z, z, 1);
if __b__
{
with (other) {
action_bounce(1, 1);
}
}
