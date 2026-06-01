if (other.armor < penetration) { penetration = other.armor; other.hit = 1; }
if (damage + penetration > other.armor) { other.hp -= (damage - (other.armor - penetration)); }
else { instance_create(x,y, Blue_Ring); }
instance_destroy(self);


