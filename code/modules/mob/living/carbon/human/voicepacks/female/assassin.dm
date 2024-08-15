/datum/voicepack/female/assassin/get_sound(soundin, modifiers)
	var/used
	switch(soundin)
		if("laugh")
			used = 'sound/vo/assassin/flaugh.ogg'
		if("whistle")
			used = list('sound/vo/assassin/whistle1.ogg', 'sound/vo/assassin/whistle2.ogg')
	if(!used)
		used = ..(soundin, modifiers)
	return used