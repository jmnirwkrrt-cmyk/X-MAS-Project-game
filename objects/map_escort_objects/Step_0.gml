if (instance_exists(drw))
{
	if (x > 850) { drw.visible = false; }
	else { drw.visible = true; }
	if (visible == false) drw.visible = false;
}
if (instance_exists(text))
{
	if (x > 850) {  text.visible = false; }
	else { text.visible = true; }
	if (visible == false) text.visible = false;
}