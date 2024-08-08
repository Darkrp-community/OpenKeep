/mob/living/carbon/human/species/aasimar
	race = /datum/species/aasimar

/datum/species/aasimar
	name = "Aasimar"
	id = "aasimar"
	desc = "<b>Aasimar</b><br>\
	Immortal offspring created through unknown means by command of the goddess Astrata, \
	used as soldiers to fight in the Apotheosis God-War. \
	They quickly earned scorn and fear from the mortal races they fought alongside \
	for their indifference to the suffering of their allies and unquestioning brutality. \
	The aasimar who survived the war have been abandoned by Astrata, \
	left to face an uncertain fate alongside the other races of Grimoria. \
	It has been long since the Apotheosis and memories of their violent legacy have faded, \
	but many still view these aasimar survivors as emotionally dull, stubborn, and simple-minded brutes... \
	though this is not always the case. \
	Aasimar are known for their incredible strength and resilience, and are a prized addition to any shield wall. \
	However, they possess less capacity for independent thought due to their wartime construction."

	skin_tone_wording = "Crafted With"

	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS,OLDGREY)
	inherent_traits = list(TRAIT_NOMOBSWAP)
	default_features = list("mcolor" = "FFF", "wings" = "None")
	use_skintones = 1
	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = NONE
	liked_food = NONE
	possible_ages = list(AGE_IMMORTAL)
	max_age = "Unknown"
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	limbs_icon_m = 'icons/roguetown/mob/bodies/m/mt_muscular.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/ft_muscular.dmi'
	dam_icon = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	use_m = TRUE
	hairyness = "t1"
	soundpack_m = /datum/voicepack/male/elf
	soundpack_f = /datum/voicepack/female/elf
	offset_features = list(OFFSET_ID = list(0,1), OFFSET_GLOVES = list(0,1), OFFSET_WRISTS = list(0,1),\
	OFFSET_CLOAK = list(0,1), OFFSET_FACEMASK = list(0,1), OFFSET_HEAD = list(0,1), \
	OFFSET_FACE = list(0,1), OFFSET_BELT = list(0,1), OFFSET_BACK = list(0,1), \
	OFFSET_NECK = list(0,1), OFFSET_MOUTH = list(0,1), OFFSET_PANTS = list(0,1), \
	OFFSET_SHIRT = list(0,1), OFFSET_ARMOR = list(0,1), OFFSET_HANDS = list(0,1), OFFSET_UNDIES = list(0,1), \
	OFFSET_ID_F = list(0,1), OFFSET_GLOVES_F = list(0,1), OFFSET_WRISTS_F = list(0,1), OFFSET_HANDS_F = list(0,1), \
	OFFSET_CLOAK_F = list(0,1), OFFSET_FACEMASK_F = list(0,1), OFFSET_HEAD_F = list(0,1), \
	OFFSET_FACE_F = list(0,1), OFFSET_BELT_F = list(0,1), OFFSET_BACK_F = list(0,1), \
	OFFSET_NECK_F = list(0,1), OFFSET_MOUTH_F = list(0,1), OFFSET_PANTS_F = list(0,1), \
	OFFSET_SHIRT_F = list(0,1), OFFSET_ARMOR_F = list(0,1), OFFSET_UNDIES_F = list(0,1))
	specstats = list("strength" = 1, "perception" = 0, "intelligence" = -2, "constitution" = 2, "endurance" = 1, "speed" = 0, "fortune" = -1)
	specstats_f = list("strength" = 1, "perception" = 0, "intelligence" = -1, "constitution" = 1, "endurance" = 0, "speed" = 1, "fortune" = -1)
	enflamed_icon = "widefire"
	patreon_req = 0

/datum/species/aasimar/check_roundstart_eligible()
	return TRUE

/datum/species/aasimar/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	C.grant_language(/datum/language/common)

/datum/species/aasimar/after_creation(mob/living/carbon/C)
	..()
	C.grant_language(/datum/language/celestial)
	to_chat(C, "<span class='info'>I can speak Celestial with ,c before my speech.</span>")

/datum/species/aasimar/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)
	C.remove_language(/datum/language/celestial)

/datum/species/aasimar/handle_speech(datum/source, mob/speech_args)
	. = ..()
	var/message = speech_args[SPEECH_MESSAGE]
	if(message)
		if(message[1])
			if(message[1] != "*")
				message = " [message]"
				var/list/accent_words = strings("accent_universal.json", "universal")

				for(var/key in accent_words)
					var/value = accent_words[key]
					if(islist(value))
						value = pick(value)

					message = replacetextEx(message, " [uppertext(key)]", " [uppertext(value)]")
					message = replacetextEx(message, " [capitalize(key)]", " [capitalize(value)]")
					message = replacetextEx(message, " [key]", " [value]")

	speech_args[SPEECH_MESSAGE] = trim(message)

/datum/species/aasimar/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/aasimar/get_skin_list()
	return sortList(list(
		"Planetar" = SKIN_COLOR_PLANETAR,
		"Deva"	   = SKIN_COLOR_DEVA,
		"Solar" = SKIN_COLOR_SOLAR,
		"Empyrea" = SKIN_COLOR_EMPYREA,
		"Gaeia" = SKIN_COLOR_GAEIA,
		"Celestial" = SKIN_COLOR_CELESTIAL,
		"Olympia" = SKIN_COLOR_OLYMPIA,
		"Necral" = SKIN_COLOR_NECRAL,
		"Abyssal" = SKIN_COLOR_ABYSSAL,
	))

/datum/species/aasimar/get_hairc_list()
	return sortList(list(
	"black - oil" = "181a1d",
	"black - cave" = "201616",
	"black - rogue" = "2b201b",
	"black - midnight" = "1d1b2b",	
	
	"white - silver" = "d3d9e3",
	"white - alabaster" = "fffffc",
	"white - skies" = "a1b4d4",
	
	"yellow - sunlight" = "f3f797",
	"blond - strawberry" = "c69b71",
	"blond - pale" = "9d8d6e",

	"red - flame" = "ab4637",
	"red - sunset" = "bf6821",
	"red - blood" = "822b2b",
	"red - maroon" = "612929"
	))

/datum/species/aasimar/random_name(gender,unique,lastname)

	var/randname
	if(unique)
		if(gender == MALE)
			for(var/i in 1 to 10)
				randname = pick( world.file2list("strings/rt/names/other/aasm.txt") )
				if(!findname(randname))
					break
		if(gender == FEMALE)
			for(var/i in 1 to 10)
				randname = pick( world.file2list("strings/rt/names/other/aasf.txt") )
				if(!findname(randname))
					break
	else
		if(gender == MALE)
			randname = pick( world.file2list("strings/rt/names/other/aasm.txt") )
		if(gender == FEMALE)
			randname = pick( world.file2list("strings/rt/names/other/aasf.txt") )
	return randname

/datum/species/aasimar/random_surname()
	return

/datum/species/aasimar/get_accent_list()
	return strings("proper_replacement.json", "proper")
