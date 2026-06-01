other.hp -= damage;
other.hit = 1;
if (other.hero_numb != 3)
{
instance_destroy(self);
}
else
{
if (rand = 0) { rand = irandom_range(0, 10); }
if (rand < 6)
{
instance_destroy(self);
}
}


