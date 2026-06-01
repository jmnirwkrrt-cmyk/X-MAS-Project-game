if (task == "destroyed" && side == 1) 
{
global.planes[indx, 2] = 0;
plane_commander.messages[0,0]++;
plane_commander.messages[plane_commander.messages[0,0],0] = global.messages_life_time;
plane_commander.messages[plane_commander.messages[0,0],1] = global.txt207;
}
if (task == "destroyed" && side == 3) 
{
global.santaplanes[indx, 2] = 0;
plane_commander.messages[0,0]++;
plane_commander.messages[plane_commander.messages[0,0],0] = global.messages_life_time;
plane_commander.messages[plane_commander.messages[0,0],1] = global.txt212;
}
if (task == "returned" && side == 1) 
{
plane_commander.messages[0,0]++;
plane_commander.messages[plane_commander.messages[0,0],0] = global.messages_life_time;
plane_commander.messages[plane_commander.messages[0,0],1] = global.txt211;
}
if (task == "returned" && side == 3) 
{
plane_commander.messages[0,0]++;
plane_commander.messages[plane_commander.messages[0,0],0] = global.messages_life_time;
plane_commander.messages[plane_commander.messages[0,0],1] = global.txt213;
}

