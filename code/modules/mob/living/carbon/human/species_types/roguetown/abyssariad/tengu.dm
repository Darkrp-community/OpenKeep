//The Tengus focuses on high speed and perception, but way less constitution and endurance. It's all due to their role as
//as Abyssor's scout units, which is physically portrayed by their actually hollow bones and low body weight.
//They are proper for Assassins-type of roles. Due to the lack of strength Malus, they are suitable as monks capable of dodging instead of focusing on body slamming, giving a new breath to the role.

/mob/living/carbon/human/species/abyssariad/tengu
	race = /datum/species/abyssariad/tengu

/datum/species/abyssariad/tengu
	name = "Tengu"
	id = "abyssariad"
	desc = "<b>Ocean branched Champions</b><br>\
	Molded from Abyssor's relentless oceans, the Tengus are a inquisitive race with lithe bodies \
	glaceful as the flows of the tides to navigate and glide across the rocky shores and crashing \
	waves of their currently destroyed domain to provide information, supplies and messages in any \
	battlefield. Just like the oceans they branched from, they are vast and enduring - if not \
	mysterious and deep, often appearing aloof and solitary to outsiders. Their society almost crumbled \
	during The Bloody Apotheosis, but their bronze-age traditions lives on together with a deep \
	hatred for all things Graggar. They are refined souls that, when not belonging to military or clerical jobs, \
	usually partakes in the society's mercantile division, usually as merchants, bankers and gem lapidary."

	skin_tone_wording = "Championage Branch"

	default_color = "FFFFFF"
	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS)
	inherent_traits = list(TRAIT_NOMOBSWAP)
	default_features = list("mcolor" = "FFF", "ears" = "TenguS", "tail_human" = "TenguV")
	use_skintones = 1
	possible_ages = list(AGE_IMMORTAL) //Abyssariads are Immortal. However, if they become stray from Abyssor's will - they suffer severe dementia after some decades.
	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = NONE
	liked_food = NONE
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	limbs_icon_m = 'icons/roguetown/kaizoku/abyssariad_bodies/male/mtan.dmi'
	limbs_icon_f = 'icons/roguetown/kaizoku/abyssariad_bodies/female/ftan.dmi'
	dam_icon = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_female.dmi'
	hairyness = ""
	mutant_bodyparts = list("ears","tail_human")
	use_f = TRUE
	soundpack_m = /datum/voicepack/male/abyssariad
	soundpack_f = /datum/voicepack/female/abyssariad
	offset_features = list(OFFSET_ID = list(0,2), OFFSET_GLOVES = list(0,0), OFFSET_WRISTS = list(0,1),\
	OFFSET_CLOAK = list(0,2), OFFSET_FACEMASK = list(0,1), OFFSET_HEAD = list(0,1), \
	OFFSET_FACE = list(0,1), OFFSET_BELT = list(0,1), OFFSET_BACK = list(0,2), \
	OFFSET_NECK = list(0,1), OFFSET_MOUTH = list(0,2), OFFSET_PANTS = list(0,2), \
	OFFSET_SHIRT = list(0,2), OFFSET_ARMOR = list(0,2), OFFSET_HANDS = list(0,2), OFFSET_UNDIES = list(0,0), \
	OFFSET_ID_F = list(0,-1), OFFSET_GLOVES_F = list(0,0), OFFSET_WRISTS_F = list(0,0), OFFSET_HANDS_F = list(0,0), \
	OFFSET_CLOAK_F = list(0,0), OFFSET_FACEMASK_F = list(0,-1), OFFSET_HEAD_F = list(0,-1), \
	OFFSET_FACE_F = list(0,-1), OFFSET_BELT_F = list(0,0), OFFSET_BACK_F = list(0,-1), \
	OFFSET_NECK_F = list(0,-1), OFFSET_MOUTH_F = list(0,-1), OFFSET_PANTS_F = list(0,0), \
	OFFSET_SHIRT_F = list(0,0), OFFSET_ARMOR_F = list(0,0), OFFSET_UNDIES_F = list(0,0))
	specstats = list("strength" = 0, "perception" = 1, "intelligence" = 0, "constitution" = 0, "endurance" = 0, "speed" = 3, "fortune" = 0)
	specstats_f = list("strength" = 0, "perception" = 2, "intelligence" = 0, "constitution" = -1, "endurance" = -1, "speed" = 3, "fortune" = 0)
	enflamed_icon = "widefire"
	mutanteyes = /obj/item/organ/eyes/rogue/tengu

/datum/species/abyssariad/tengu/get_span_language(datum/language/message_language)
	if(!message_language)
		return
	if(message_language.type == /datum/language/abyssal)
		return list(SPAN_ABYSSAL)
	return message_language.spans

/datum/species/abyssariad/tengu/check_roundstart_eligible()
	return TRUE

/datum/species/abyssariad/tengu/get_skin_list()
	return sortList(list(
	"Silver Purifier" = "ffe0d1",
	"Warp Caster" = "fcccb3",
	"Marble" = "edc6b3",
	"Bogwalker" = "e2b9a3",
	"Duskwalker" = "d9a284",
	"Bronze Purifier" = "c9a893",
	"Twilight Veil" = "ba9882",
	"Midnight Veil" = "44342a",
	"Peppersblow Unit" = "771111",
	"Ebony Purifier" = "221A15"
	))


/datum/species/abyssariad/tengu/get_hairc_list()
	return sortList(list(
	"blond - pale" = "9d8d6e",
	"blond - dirty" = "88754f",
	"blond - drywheat" = "d5ba7b",
	"blond - strawberry" = "c69b71",

	"brown - mud" = "362e25",
	"brown - oats" = "584a3b",
	"brown - grain" = "58433b",
	"brown - soil" = "48322a",

	"black - oil" = "181a1d",
	"black - cave" = "201616",
	"black - rogue" = "2b201b",
	"black - midnight" = "1d1b2b",

	"red - berry" = "48322a",
	"red - wine" = "82534c",
	"red - sunset" = "82462b",
	"red - blood" = "822b2b",

	"white - platinum" = "f8f3f3",
	"white - silver" = "ddddc8",
	"white - oceanid" = "141f1f"

	))

/datum/species/abyssariad/tengu/random_name(gender,unique,lastname)
	var/randname
	if(unique)
		if(gender == MALE)
			for(var/i in 1 to 10)
				randname = pick( world.file2list("strings/rt/names/abyssariad/abyssnorm.txt") )
				if(!findname(randname))
					break
		if(gender == FEMALE)
			for(var/i in 1 to 10)
				randname = pick( world.file2list("strings/rt/names/abyssariad/abyssnorf.txt") )
				if(!findname(randname))
					break
	else
		if(gender == MALE)
			randname = pick( world.file2list("strings/rt/names/abyssariad/abyssnorm.txt") )
		if(gender == FEMALE)
			randname = pick( world.file2list("strings/rt/names/abyssariad/abyssnorf.txt") )
	randname += " Clanless"
	return randname

/datum/species/abyssariad/tengu/random_surname()
	return " [pick(world.file2list("strings/rt/names/abyssariad/abyssnorm.txt.txt"))]"

/datum/species/abyssariad/tengu/get_accent_list()
	return strings("japanese_replacement.json", "japanese")

