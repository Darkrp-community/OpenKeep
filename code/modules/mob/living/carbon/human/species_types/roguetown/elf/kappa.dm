/mob/living/carbon/human/species/elf/kappa
	race = /datum/species/elf/kappa

/datum/species/elf/kappa
	name = "Kappa"
	id = "elf"
	desc = "<b>Kappa</b><br>\
	An amalgamation between Goblins and Elves that arrived at the Fog islands centuries \
	ago, long corrupted by demonic essence and alchemical misconducts over generations, \
	they now possess features that blends amphibious traits from Goblin's lineage, \
	including moist, permeable skin and a large shell on their back. They are a small, \
	water-dwelling creatures that inhabit rivers and ponds, often living tribalistic, \
	hedonistic lives, feared by those aware of their mischievous, people-drowning nature. \
	One may say these are misunderstood rituals of trust, others warns the others that it is \
	a sacrifice to the spirits they believe that exists. They have a natural, biological \
	antipathy and abhorrence to humens - and a mutual alliance with Abyssariads."
	default_color = "FFFFFF"
	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS,OLDGREY)
	inherent_traits = list(TRAIT_NOMOBSWAP)
	default_features = list("mcolor" = "FFF", "ears" = "Kappae", "tail_human" = "Kappav")
	use_skintones = 1
	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = NONE
	liked_food = NONE
	mutant_bodyparts = list("ears","tail_human")
	possible_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
/* experimenting - origional
	limbs_icon_m = 'icons/roguetown/mob/bodies/m/ms_kappa.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/fs_kappa.dmi'
	dam_icon = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_female.dmi'
*/
	limbs_icon_m = 'icons/roguetown/kaizoku/abyssariad_bodies/male/mss_test.dmi'
	limbs_icon_f = 'icons/roguetown/kaizoku/abyssariad_bodies/female/fss_test.dmi'
	dam_icon = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_female.dmi'

	hairyness = ""
	use_f = FALSE
	soundpack_m = /datum/voicepack/male/elf
	soundpack_f = /datum/voicepack/female/elf
/* experimenting - original
	offset_features = list(OFFSET_ID = list(0,-1), OFFSET_GLOVES = list(0,-1), OFFSET_WRISTS = list(0,-1),\
	OFFSET_CLOAK = list(0,-1), OFFSET_FACEMASK = list(0,-1), OFFSET_HEAD = list(0,-1), \
	OFFSET_FACE = list(0,-1), OFFSET_BELT = list(0,-1), OFFSET_BACK = list(0,-1), \
	OFFSET_NECK = list(0,-1), OFFSET_MOUTH = list(0,-1), OFFSET_PANTS = list(0,-1), \
	OFFSET_SHIRT = list(0,-1), OFFSET_ARMOR = list(0,-1), OFFSET_HANDS = list(0,-1), OFFSET_UNDIES = list(0,-1), \
	OFFSET_ID_F = list(0,-1), OFFSET_GLOVES_F = list(0,-1), OFFSET_WRISTS_F = list(0,-1), OFFSET_HANDS_F = list(0,-2), \
	OFFSET_CLOAK_F = list(0,-1), OFFSET_FACEMASK_F = list(0,-2), OFFSET_HEAD_F = list(0,-2), \
	OFFSET_FACE_F = list(0,-2), OFFSET_BELT_F = list(0,-1), OFFSET_BACK_F = list(0,-2), \
	OFFSET_NECK_F = list(0,-2), OFFSET_MOUTH_F = list(0,-2), OFFSET_PANTS_F = list(0,-1), \
	OFFSET_SHIRT_F = list(0,-1), OFFSET_ARMOR_F = list(0,-1), OFFSET_UNDIES_F = list(0,-1))
*/
	offset_features = list(OFFSET_ID = list(0,-2), OFFSET_GLOVES = list(0,-1), OFFSET_WRISTS = list(0,-2),\
	OFFSET_CLOAK = list(0,-2), OFFSET_FACEMASK = list(0,-2), OFFSET_HEAD = list(0,-2), \
	OFFSET_FACE = list(0,-2), OFFSET_BELT = list(0,-2), OFFSET_BACK = list(0,-2), \
	OFFSET_NECK = list(0,-2), OFFSET_MOUTH = list(0,-2), OFFSET_PANTS = list(0,-2), \
	OFFSET_SHIRT = list(0,-2), OFFSET_ARMOR = list(0,-2), OFFSET_HANDS = list(0,-2), OFFSET_UNDIES = list(0,-2), \
	OFFSET_ID_F = list(0,-2), OFFSET_GLOVES_F = list(0,-2), OFFSET_WRISTS_F = list(0,-2), OFFSET_HANDS_F = list(0,-3), \
	OFFSET_CLOAK_F = list(0,-2), OFFSET_FACEMASK_F = list(0,-3), OFFSET_HEAD_F = list(0,-3), \
	OFFSET_FACE_F = list(0,-3), OFFSET_BELT_F = list(0,-2), OFFSET_BACK_F = list(0,-3), \
	OFFSET_NECK_F = list(0,-3), OFFSET_MOUTH_F = list(0,-3), OFFSET_PANTS_F = list(0,-2), \
	OFFSET_SHIRT_F = list(0,-2), OFFSET_ARMOR_F = list(0,-2), OFFSET_UNDIES_F = list(0,-2))
	specstats = list("strength" = 0, "perception" = 0, "intelligence" = 0, "constitution" = 2, "endurance" = 2, "speed" = 0, "fortune" = 0)
	specstats_f = list("strength" = -1, "perception" = 0, "intelligence" = 0, "constitution" = 2, "endurance" = 2, "speed" = 1, "fortune" = 0)
	enflamed_icon = "widefire"

/datum/species/elf/kappa/check_roundstart_eligible()
	return TRUE

/datum/species/elf/kappa/get_span_language(datum/language/message_language)
	if(!message_language)
		return
//	if(message_language.type == /datum/language/elvish)
//		return list(SPAN_SELF)
//	if(message_language.type == /datum/language/common)
//		return list(SPAN_SELF)
	return message_language.spans

/datum/species/elf/kappa/get_skin_list()
	return sortList(list(
	"Swampclan" = "728400", 
	"Jungleclan" = "0D6D30",
	"Leafclan" = "5ea889",
	"Bogclan" = "1b7a5e",
	"Forestclan" = "5FB098",
	"Shadowclan" = "60609e",
	"Firebloomclan" = "E26846",
	"Abyssalclan" = "a198b8"
	))

/datum/species/elf/kappa/get_hairc_list()
	return sortList(list(
	"black - oil" = "181a1d",
	"black - cave" = "201616",
	"black - rogue" = "2b201b",
	"black - midnight" = "1d1b2b",

	"brown - mud" = "362e25",
	"brown - oats" = "584a3b",
	"brown - grain" = "58433b",
	"brown - soil" = "48322a",

	"red - berry" = "48322a",
	"red - wine" = "82534c",
	"red - sunset" = "82462b",
	"red - blood" = "822b2b",

	"green - grass" = "2a482c",
	"green - swamp" = "3b482a",
	"green - leaf" = "2f3c2e",
	"green - moss" = "3b3c2a",
	"white - silver" = "e8fdfd",
	"white - oceanid" = "afdddd"


	))

/datum/species/elf/kappa/random_name(gender,unique,lastname)
	var/randname
	if(unique)
		if(gender == MALE)
			for(var/i in 1 to 10)
				randname = pick( world.file2list("strings/rt/names/elf/elfwm.txt") )
				if(!findname(randname))
					break
		if(gender == FEMALE)
			for(var/i in 1 to 10)
				randname = pick( world.file2list("strings/rt/names/elf/elfwf.txt") )
				if(!findname(randname))
					break
	else
		if(gender == MALE)
			randname = pick( world.file2list("strings/rt/names/elf/elfwm.txt") )
		if(gender == FEMALE)
			randname = pick( world.file2list("strings/rt/names/elf/elfwf.txt") )
	return randname

/datum/species/elf/kappa/random_surname()
	return " [pick(world.file2list("strings/rt/names/elf/elfwlast.txt"))]"

/datum/species/elf/kappa/get_accent_list()
	return strings("japanese_replacement.json", "japanese")

/datum/species/elf/kappa/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	RegisterSignal(C, COMSIG_MOB_SAY, .proc/handle_speech)
	C.grant_language(/datum/language/abyssal)
	C.cmode_music = 'sound/music/combatabyssariad.ogg'
	C.verbs |= /mob/proc/croak
	ADD_TRAIT(C, TRAIT_KAIZOKU, TRAIT_GENERIC)  //Cultural Trait. Must not be considered a 'buff' or 'debuff'.

/mob/proc/croak()
	set name = "Croak"
	set category = "Noises"
	emote("croak")