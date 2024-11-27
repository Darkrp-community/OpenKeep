#ifdef TESTING
/mob/living/carbon/key_down(_key, client/user)
	switch(_key)
		if("B")
			client.toggle_rightclick_menu(TRUE)
	return ..()
#endif
