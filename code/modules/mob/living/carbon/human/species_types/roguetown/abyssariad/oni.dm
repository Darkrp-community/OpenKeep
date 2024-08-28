/mob/living/carbon/human/species/abyssariad/oni //Remember to code in abyssal powers that forces Orcs to become Onis if it is used enough.
	race = /datum/species/abyssariad/oni

/datum/species/abyssariad/oni
	name = "Oni"
	id = "abyssariad"
	desc = "<b>Island Branched Champions</b><br>\
	Created from Abyssor's purifying artifacts under the guide of other Abyssariads, \
	the Oni are a stoic race, with stout and sturdy bodies equal to wide trunked trees. \
	Just like the islands that sprinkled the ocean's surface, the Onis are individuals \
	bearing the constant waves and storms of life. It is set in history that Onis were \
	recovered orcs from the Bloody Apotheosis under the effects of Abyssor's Grey Dreams, \
	and under mercy instead of carnage, were purified by Abyssal artifacts into the \
	complete removal of their graggarious demonic corruption, unrooting the evil for the \
	forevermore. They are rekindled souls that, when not belonging to military or clerical jobs, \
	usually partakes in the society's industrial division, usually as blacksmiths, artisans and architects."

	skin_tone_wording = "Championage Branch"

	default_color = "FFFFFF"
	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS,STUBBLE)
	inherent_traits = list(TRAIT_NOMOBSWAP)
	default_features = list("mcolor" = "FFF", "ears" = "oni", "horns" = "onihorn")
	mutant_bodyparts = list("ears","horns")
	use_skintones = 1
	possible_ages = list(AGE_IMMORTAL) //Abyssariads are Immortal. However, Onis are the newest ones on the fold, and they become Orcs mentally if they stray away from Abyssor.
	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = NONE
	liked_food = MEAT
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	limbs_icon_m = 'icons/roguetown/mob/bodies/m/mt_muscular.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/ft_muscular_m.dmi'
	dam_icon = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	hairyness = "t2"
	use_m = TRUE
	soundpack_m = /datum/voicepack/male/abyssariad
	soundpack_f = /datum/voicepack/female/abyssariad
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
	specstats = list("strength" = 2, "perception" = -1, "intelligence" = -2, "constitution" = 1, "endurance" = 1, "speed" = -1, "fortune" = -1)
	specstats_f = list("strength" = 2, "perception" = -1, "intelligence" = -2, "constitution" = 1, "endurance" = 1, "speed" = -1, "fortune" = -1)
	enflamed_icon = "widefire"
	patreon_req = 0

/datum/species/abyssariad/oni/check_roundstart_eligible()
	return TRUE

/datum/species/abyssariad/oni/get_skin_list()
	return sortList(list(
	"skin1" = "A84C4F",
	"skin2" = "09371A",
	"skin3" = "439399",
	"skin4" = "50715C",
	"skin5" = "292413",
	"skin6" = "1F1A23"
	))


/datum/species/abyssariad/oni/get_hairc_list()
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

	"white - snow" = "dee9ed",
	"white - ice" = "f4f4f4",

	"blond - pale" = "9d8d6e",
	"blond - dirty" = "88754f",
	"blond - drywheat" = "8f8766",
	"blond - strawberry" = "977033",

	"white - platinum" = "f8f3f3",
	"white - silver" = "ddddc8",
	"white - oceanid" = "141f1f"


	))

/datum/species/abyssariad/oni/get_span_language(datum/language/message_language)
	if(!message_language)
		return
	if(message_language.type == /datum/language/abyssal)
		return list(SPAN_ABYSSAL)
	return message_language.spans

/datum/species/abyssariad/oni/random_name(gender,unique,lastname)
	var/randname
	if(unique)
		if(gender == MALE)
			for(var/i in 1 to 10)
				randname = pick( world.file2list("strings/rt/names/abyssariad/onim.txt") )
				if(!findname(randname))
					break
		if(gender == FEMALE)
			for(var/i in 1 to 10)
				randname = pick( world.file2list("strings/rt/names/abyssariad/onif.txt") )
				if(!findname(randname))
					break
	else
		if(gender == MALE)
			randname = pick( world.file2list("strings/rt/names/abyssariad/onim.txt") )
		if(gender == FEMALE)
			randname = pick( world.file2list("strings/rt/names/abyssariad/onif.txt") )
	return randname

/datum/species/abyssariad/oni/random_surname()
	return " [pick(world.file2list("strings/rt/names/abyssariad/abyssnorm.txt.txt"))]"

/datum/species/abyssariad/oni/get_accent_list()
	return strings("japanese_replacement.json", "japanese")