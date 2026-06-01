if (event == 1)
{
	if (instance_exists(instance_find(onmap_escort, indx)))
	{
		obj = instance_find(onmap_escort, indx).status = 3;
		obj.status = 3;
	}
}
instance_destroy(ask_message);
instance_destroy(self);

