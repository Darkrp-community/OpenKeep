/datum/voicepack/male/elf/get_sound(soundin, modifiers)
	var/used
	switch(modifiers)
		if("old")
			used = getmold(soundin)
		if("silenced")
			used = getmsilenced(soundin)
	if(!used)
		switch(soundin)
			if("agony")
				used = 'sound/vo/male/elf/agony.ogg'
			if("chuckle")
				used = list('sound/vo/male/elf/chuckle (1).ogg','sound/vo/male/elf/chuckle (2).ogg','sound/vo/male/elf/chuckle (3).ogg','sound/vo/male/elf/chuckle (4).ogg','sound/vo/male/elf/chuckle (5).ogg','sound/vo/male/elf/chuckle (6).ogg','sound/vo/male/elf/chuckle (7).ogg','sound/vo/male/elf/chuckle (8).ogg')
			if("cry")
				used = list('sound/vo/male/elf/cry (1).ogg','sound/vo/male/elf/cry (2).ogg','sound/vo/male/elf/cry (3).ogg')
			if("embed")
				used = list('sound/vo/male/elf/embed (1).ogg','sound/vo/male/elf/embed (2).ogg')
			if("firescream")
				used = list('sound/vo/male/elf/firescream (1).ogg','sound/vo/male/elf/firescream (2).ogg','sound/vo/male/elf/firescream (3).ogg')
			if("gasp")
				used = list('sound/vo/male/elf/gasp (1).ogg','sound/vo/male/elf/gasp (2).ogg','sound/vo/male/elf/gasp (3).ogg')
			if("grumble")
				used = 'sound/vo/male/elf/grumble.ogg'
			if("haltyell")
				used = 'sound/vo/male/elf/haltyell.ogg'
			if("huh")
				used = 'sound/vo/male/elf/huh.ogg'
			if("laugh")
				used = list('sound/vo/male/elf/laugh (1).ogg','sound/vo/male/elf/laugh (2).ogg','sound/vo/male/elf/laugh (3).ogg')
			if("pain")
				used = list('sound/vo/male/elf/pain (1).ogg','sound/vo/male/elf/pain (2).ogg','sound/vo/male/elf/pain (3).ogg')
			if("paincrit")
				used = list('sound/vo/male/elf/paincrit (1).ogg','sound/vo/male/elf/paincrit (2).ogg','sound/vo/male/elf/paincrit (3).ogg')
			if("painmoan")
				used = list('sound/vo/male/elf/painmoan (1).ogg','sound/vo/male/elf/painmoan (2).ogg','sound/vo/male/elf/painmoan (3).ogg')
			if("painscream")
				used = list('sound/vo/male/elf/painscream (1).ogg','sound/vo/male/elf/painscream (2).ogg')
			if("rage")
				used = list('sound/vo/male/elf/rage (1).ogg','sound/vo/male/elf/rage (2).ogg')
			if("scream")
				used = list('sound/vo/male/elf/scream (1).ogg','sound/vo/male/elf/scream (2).ogg')

	if(!used)
		used = ..(soundin)
	return used
