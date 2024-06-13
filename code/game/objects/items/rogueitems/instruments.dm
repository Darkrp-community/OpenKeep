
/obj/item/rogue/instrument
	name = ""
	desc = ""
	icon = 'icons/roguetown/items/music.dmi'
	icon_state = ""
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_BACK_R|ITEM_SLOT_BACK_L
	can_parry = TRUE
	force = 23
	throwforce = 7
	throw_range = 4
	dropshrink = 0.8
	var/datum/looping_sound/dmusloop/soundloop
	var/list/song_list = list()
	var/playing = FALSE

/obj/item/rogue/instrument/equipped(mob/living/user, slot)
	. = ..()
	if(playing && user.get_active_held_item() != src)
		playing = FALSE
		soundloop.stop()

/obj/item/rogue/instrument/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.4,"sx" = 0,"sy" = 2,"sx" = 0,"sy" = 2,"wx" = -1,"wy" = 2,"ex" = 5,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 8,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/rogue/instrument/Initialize()
	soundloop = new(list(src), FALSE)
//	soundloop.start()
	. = ..()

/obj/item/rogue/instrument/dropped()
	..()
	if(soundloop)
		soundloop.stop()

/obj/item/rogue/instrument/attack_self(mob/living/user)
	var/stressevent = /datum/stressevent/music
	. = ..()
	if(.)
		return
	user.changeNext_move(CLICK_CD_MELEE)
	if(!playing)
		var/curfile = input(user, "Which song?", "Roguetown", name) as null|anything in song_list
		if(!user)
			return
		if(user.mind)
			soundloop.stress2give = null
			switch(user.mind.get_skill_level(/datum/skill/misc/music))
				if(1)
					stressevent = /datum/stressevent/music
				if(2)
					stressevent = /datum/stressevent/music/two
				if(3)
					stressevent = /datum/stressevent/music/three
				if(4)
					stressevent = /datum/stressevent/music/four
				if(5)
					stressevent = /datum/stressevent/music/five
				if(6)
					stressevent = /datum/stressevent/music/six
		if(playing)
			playing = FALSE
			soundloop.stop()
			return
		if(!(src in user.held_items))
			return
		if(user.get_inactive_held_item())
			playing = FALSE
			soundloop.stop()
			return
		if(curfile)
			curfile = song_list[curfile]
			playing = TRUE
			soundloop.mid_sounds = list(curfile)
			soundloop.cursound = null
			soundloop.start()
		for(var/mob/living/carbon/L in viewers(7))
			L.add_stress(stressevent)
	else
		playing = FALSE
		soundloop.stop()

/obj/item/rogue/instrument/lute
	force = 15
	name = "lute"
	desc = "The favored instrument of Eora, made of wood and simple string."
	possible_item_intents = list(/datum/intent/mace/strike/wood)
	icon_state = "lute"
	minstr = 0
	wbalance = 0
	wdefense = 1
	song_list = list("Song 1" = 'sound/music/instruments/lute (1).ogg',
	"Song 2" = 'sound/music/instruments/lute (2).ogg',
	"Song 3" = 'sound/music/instruments/lute (3).ogg',
	"Song 4" = 'sound/music/instruments/lute (4).ogg',
	"Song 5" = 'sound/music/instruments/lute (5).ogg',
	"Song 6" = 'sound/music/instruments/lute (6).ogg',
	"Song 7" = 'sound/music/instruments/lute (7).ogg')

/obj/item/rogue/instrument/accord
	name = "accordion"
	desc = "A complex piece of dwarven intuition, composed of metal, wood, hide and ivory. Favored by Abyssorian bards."
	icon_state = "accordion"
	song_list = list("Song 1" = 'sound/music/instruments/accord (1).ogg',
	"Song 2" = 'sound/music/instruments/accord (2).ogg',
	"Song 3" = 'sound/music/instruments/accord (3).ogg',
	"Song 4" = 'sound/music/instruments/accord (4).ogg',
	"Song 5" = 'sound/music/instruments/accord (5).ogg',
	"Song 6" = 'sound/music/instruments/accord (6).ogg')

/obj/item/rogue/instrument/guitar
	name = "guitar"
	desc = "A corrupted lute, a heritage instrument of Tiefling pedigree."
	possible_item_intents = list(/datum/intent/mace/strike/wood)
	icon_state = "guitar"
	force = 15
	minstr = 0
	wbalance = 0
	wdefense = 1
	song_list = list("Song 1" = 'sound/music/instruments/guitar (1).ogg',
	"Song 2" = 'sound/music/instruments/guitar (2).ogg',
	"Song 3" = 'sound/music/instruments/guitar (3).ogg',
	"Song 4" = 'sound/music/instruments/guitar (4).ogg',
	"Song 5" = 'sound/music/instruments/guitar (5).ogg',
	"Song 6" = 'sound/music/instruments/guitar (6).ogg',
	"Tiberian Sunset" = 'sound/music/instruments/guitar (Tiberian Sunset).ogg',	
	"Romanza" = 'sound/music/instruments/guitar (Romanza).ogg',	
	"Malaguena" = 'sound/music/instruments/guitar (Malaguena).ogg',
	"Cancion del mariachi" = 'sound/music/instruments/guitar (Cancion del mariachi).ogg',	
	"El Masque" = 'sound/music/instruments/guitar (El Masque).ogg',
	"Evolvado" = 'sound/music/instruments/guitar (Evolvado).ogg',	
	"Asturias" = 'sound/music/instruments/guitar (Asturias).ogg',
	"La Follia" = 'sound/music/instruments/guitar (La Follia).ogg',	
	)

/obj/item/rogue/instrument/harp
	name = "harp"
	desc = "An elven instrument of a great and proud heritage."
	icon_state = "harp"
	song_list = list("Song 1" = 'sound/music/instruments/harb (1).ogg',
	"Song 2" = 'sound/music/instruments/harb (2).ogg',
	"Song 3" = 'sound/music/instruments/harb (3).ogg')

/obj/item/rogue/instrument/flute
	name = "flute"
	desc = "A cacophonous wind-instrument, played primarily by humens all around Grimoria."
	icon_state = "flute"
	song_list = list("Song 1" = 'sound/music/instruments/flute (1).ogg',
	"Song 2" = 'sound/music/instruments/flute (2).ogg',
	"Song 3" = 'sound/music/instruments/flute (3).ogg',
	"Song 4" = 'sound/music/instruments/flute (4).ogg',
	"Song 5" = 'sound/music/instruments/flute (5).ogg',
	"Song 6" = 'sound/music/instruments/flute (6).ogg')

/obj/item/rogue/instrument/drum
	name = "drum"
	desc = "The adopted instrument of Aasimar, used for signaling and rhythmic marches alike."
	icon_state = "drum"
	song_list = list("Song 1" = 'sound/music/instruments/drum (1).ogg',
	"Song 2" = 'sound/music/instruments/drum (2).ogg',
	"Song 3" = 'sound/music/instruments/drum (3).ogg')
