if (task == "destroyed") 
{
global.eggplanes[indx, 1] = 0;
plane_commander.messages[0,0]++;
plane_commander.messages[plane_commander.messages[0,0],0] = global.messages_life_time;
plane_commander.messages[plane_commander.messages[0,0],1] = global.txt208;
}
if (task == "returned") 
{
plane_commander.messages[0,0]++;
plane_commander.messages[plane_commander.messages[0,0],0] = global.messages_life_time;
plane_commander.messages[plane_commander.messages[0,0],1] = global.txt210;
}

