
/obj/item/rogue/instrument
	name = ""
	desc = ""
	icon = 'modular/Barding/icons/music.dmi'
	icon_state = ""
	lefthand_file = 'modular/Barding/icons/instruments_lefthand.dmi'
	righthand_file = 'modular/Barding/icons/instruments_righthand.dmi'
	experimental_inhand = FALSE
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_BACK_R|ITEM_SLOT_BACK_L
	can_parry = TRUE
	force = 23
	throwforce = 7
	throw_range = 4
	dropshrink = 0.8
	var/datum/looping_sound/dmusloop/soundloop
	var/list/song_list = list()
	var/playing = FALSE
	var/dynamic_icon
	var/icon_prefix

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
			for(var/obj/item/reagent_containers/food/snacks/smallrat/I in view(6, user))
				if(I.loc != user)
					step_towards(I, user)
					sleep(2)
					step_towards(I, user)
					sleep(2)
					step_towards(I, user)
		if(playing)
			playing = FALSE
			soundloop.stop()
			if(dynamic_icon)
				lower_from_mouth()
				update_icon()
			return
		if(!(src in user.held_items))
			return
		if(user.get_inactive_held_item())
			playing = FALSE
			soundloop.stop()
			if(dynamic_icon)
				lower_from_mouth()
				update_icon()
			return
		if(curfile)
			curfile = song_list[curfile]
			playing = TRUE
			soundloop.mid_sounds = list(curfile)
			soundloop.cursound = null
			soundloop.start()
			if(dynamic_icon)
				lift_to_mouth()
				update_icon()
				for(var/obj/item/reagent_containers/food/snacks/smallrat/I in view(4, user))
					if(I.loc != user)
						step_towards(I, user)
						sleep(2)
						step_towards(I, user)
						sleep(2)
						step_towards(I, user)
		for(var/mob/living/carbon/L in viewers(7))
			L.add_stress(stressevent)
	else
		playing = FALSE
		soundloop.stop()
		if(dynamic_icon)
			lower_from_mouth()
			update_icon()

/obj/item/rogue/instrument/dropped(mob/user)
	. = ..()
	if(dynamic_icon)
		icon_state = "[icon_prefix]"

/obj/item/rogue/instrument/proc/lift_to_mouth()
	icon_state = "[icon_prefix]_play"

/obj/item/rogue/instrument/proc/lower_from_mouth()
	icon_state = "[icon_prefix]"



/obj/item/rogue/instrument/lute
	force = 15
	name = "lute"
	desc = "The favored instrument of Eora, made of wood and simple string."
	possible_item_intents = list(/datum/intent/mace/strike/wood)
	icon_state = "lute"
	minstr = 0
	wbalance = 0
	wdefense = 1
	song_list = list(
	"Song 1" = 'modular/Barding/sound/instruments/lute (1).ogg',
	"Song 2" = 'modular/Barding/sound/instruments/lute (2).ogg',
	"Song 3" = 'modular/Barding/sound/instruments/lute (3).ogg',
	"Song 4" = 'modular/Barding/sound/instruments/lute (4).ogg',
	"Song 5" = 'modular/Barding/sound/instruments/lute (5).ogg',
	"Song 6" = 'modular/Barding/sound/instruments/lute (6).ogg',
	"Song 7" = 'modular/Barding/sound/instruments/lute (7).ogg')

/obj/item/rogue/instrument/accord
	name = "accordion"
	desc = "A complex piece of dwarven intuition, composed of metal, wood, hide and ivory. Favored by Abyssorian bards."
	icon_state = "accordion"
	song_list = list(
	"Song 1" = 'modular/Barding/sound/instruments/accord (1).ogg',
	"Song 2" = 'modular/Barding/sound/instruments/accord (2).ogg',
	"Song 3" = 'modular/Barding/sound/instruments/accord (3).ogg',
	"Song 4" = 'modular/Barding/sound/instruments/accord (4).ogg',
	"Song 5" = 'modular/Barding/sound/instruments/accord (5).ogg',
	"Song 6" = 'modular/Barding/sound/instruments/accord (6).ogg',
	"Sokoly" = 'modular/Barding/sound/instruments/accord (Sokoly).ogg')

/obj/item/rogue/instrument/guitar
	name = "guitar"
	desc = "A corrupted lute, a heritage instrument of Tiefling pedigree."
	possible_item_intents = list(/datum/intent/mace/strike/wood)
	icon_state = "guitar"
	force = 15
	minstr = 0
	wbalance = 0
	wdefense = 1
	song_list = list(
	"Song 1" = 'modular/Barding/sound/instruments/guitar (1).ogg',
	"Song 2" = 'modular/Barding/sound/instruments/guitar (2).ogg',
	"Song 3" = 'modular/Barding/sound/instruments/guitar (3).ogg',
	"Song 4" = 'modular/Barding/sound/instruments/guitar (4).ogg',
	"Song 5" = 'modular/Barding/sound/instruments/guitar (5).ogg',
	"Song 6" = 'modular/Barding/sound/instruments/guitar (6).ogg',
	"Tiberian Sunset" = 'modular/Barding/sound/instruments/guitar (Tiberian Sunset).ogg',	
	"Romanza" = 'modular/Barding/sound/instruments/guitar (Romanza).ogg',	
	"Malaguena" = 'modular/Barding/sound/instruments/guitar (Malaguena).ogg',
	"Cancion del mariachi" = 'modular/Barding/sound/instruments/guitar (Cancion del mariachi).ogg',	
	"El Masque" = 'modular/Barding/sound/instruments/guitar (El Masque).ogg',
	"Evolvado" = 'modular/Barding/sound/instruments/guitar (Evolvado).ogg',	
	"Asturias" = 'modular/Barding/sound/instruments/guitar (Asturias).ogg',
	"La Follia" = 'modular/Barding/sound/instruments/guitar (La Follia).ogg',	
	)

/obj/item/rogue/instrument/harp
	name = "harp"
	desc = "An elven instrument of a great and proud heritage."
	icon_state = "harp"
	song_list = list(
	"Song 1" = 'modular/Barding/sound/instruments/harb (1).ogg',
	"Song 2" = 'modular/Barding/sound/instruments/harb (2).ogg',
	"Song 3" = 'modular/Barding/sound/instruments/harb (3).ogg',
	"Song of the Magi" = 'modular/Barding/sound/instruments/harp (Magi).ogg')

/obj/item/rogue/instrument/flute // small rats approach a little when begin playing
	name = "flute"
	desc = "A cacophonous wind-instrument, played primarily by humens all around Grimoria."
	icon_state = "flute"
	icon_prefix = "flute" // used for inhands switch
	dynamic_icon = TRUE // used for inhands switch
	song_list = list(
	"Song 1" = 'modular/Barding/sound/instruments/flute (1).ogg',
	"Song 2" = 'modular/Barding/sound/instruments/flute (2).ogg',
	"Song 3" = 'modular/Barding/sound/instruments/flute (3).ogg',
	"Song 4" = 'modular/Barding/sound/instruments/flute (4).ogg',
	"Song 5" = 'modular/Barding/sound/instruments/flute (5).ogg',
	"Song 6" = 'modular/Barding/sound/instruments/flute (6).ogg',
	"Kalyna" = 'modular/Barding/sound/instruments/flute (Kalyna).ogg')

/obj/item/rogue/instrument/drum
	name = "drum"
	desc = "The adopted instrument of Aasimar, used for signaling and rhythmic marches alike."
	icon_state = "drum"
	song_list = list(
	"Song 1" = 'modular/Barding/sound/instruments/drum (1).ogg',
	"Song 2" = 'modular/Barding/sound/instruments/drum (2).ogg',
	"Song 3" = 'modular/Barding/sound/instruments/drum (3).ogg',
	"Snare drum" = 'modular/Barding/sound/instruments/drum (Snare).ogg')