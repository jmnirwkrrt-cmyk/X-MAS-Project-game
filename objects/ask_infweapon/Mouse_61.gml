mcurrent--;
while (mcurrent > 0 and weapon[mcurrent, 1] < 1 and mcurrent > mmin) mcurrent--;
if (mcurrent > mmax) mcurrent = mmin;
if (mcurrent < mmin) mcurrent = mmax;

