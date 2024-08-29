/mob/living/carbon/human/species/envy //Demons are rather round-ending enemies, so they will never be naturally triggered on Rockhill(only admin intervention), only on Kaizoku when the map is finished.
	race = /datum/species/envy
	footstep_type = FOOTSTEP_MOB_HEAVY
	var/datum/language_holder/stored_language
	var/list/stored_skills
	var/list/stored_experience

/datum/species/envy
	name = "Envy"
	id = "envy"
	desc = ""
	skin_tone_wording = "Corrupting essence"
	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS,STUBBLE,OLDGREY)
	inherent_traits = list(TRAIT_NOMOBSWAP)
	default_features = list("mcolor" = "FFF", "wings" = "None")
	use_skintones = 1
	inherent_biotypes = MOB_SPIRIT|MOB_HUMANOID //mob "spirit" so they can be purified by Abyssor acolytes.
	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = NONE
	liked_food = NONE
	possible_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	limbs_icon_m = 'icons/roguetown/kaizoku/mobs/envy.dmi'
	limbs_icon_f = 'icons/roguetown/kaizoku/mobs/envy.dmi'
	dam_icon = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_female.dmi'
	hairyness = ""
	mutant_bodyparts = list("")
	soundpack_m = /datum/voicepack/male/elf
	soundpack_f = /datum/voicepack/female/elf
	offset_features = list(OFFSET_ID = list(0,1), OFFSET_GLOVES = list(0,1), OFFSET_WRISTS = list(0,1),\
	OFFSET_CLOAK = list(0,1), OFFSET_FACEMASK = list(0,1), OFFSET_HEAD = list(0,1), \
	OFFSET_FACE = list(0,1), OFFSET_BELT = list(0,1), OFFSET_BACK = list(0,1), \
	OFFSET_NECK = list(0,1), OFFSET_MOUTH = list(0,1), OFFSET_PANTS = list(0,1), \
	OFFSET_SHIRT = list(0,1), OFFSET_ARMOR = list(0,1), OFFSET_HANDS = list(0,1), OFFSET_UNDIES = list(0,1), \
	OFFSET_ID_F = list(0,-1), OFFSET_GLOVES_F = list(0,0), OFFSET_WRISTS_F = list(0,0), OFFSET_HANDS_F = list(0,0), \
	OFFSET_CLOAK_F = list(0,0), OFFSET_FACEMASK_F = list(0,-1), OFFSET_HEAD_F = list(0,-1), \
	OFFSET_FACE_F = list(0,-1), OFFSET_BELT_F = list(0,-1), OFFSET_BACK_F = list(0,-1), \
	OFFSET_NECK_F = list(0,-1), OFFSET_MOUTH_F = list(0,-1), OFFSET_PANTS_F = list(0,0), \
	OFFSET_SHIRT_F = list(0,0), OFFSET_ARMOR_F = list(0,0), OFFSET_UNDIES_F = list(0,0))
	enflamed_icon = "widefire"
	patreon_req = 0
	species_traits = list(NO_UNDERWEAR,NOEYESPRITES)
	inherent_traits = list(TRAIT_NOROGSTAM,TRAIT_RESISTHEAT,TRAIT_RESISTCOLD,TRAIT_RESISTHIGHPRESSURE,TRAIT_RESISTLOWPRESSURE,TRAIT_CHUNKYFINGERS,TRAIT_RADIMMUNE,TRAIT_NODISMEMBER)
	armor = 20
	no_equip = list(SLOT_SHIRT, SLOT_HEAD, SLOT_WEAR_MASK, SLOT_GLOVES, SLOT_SHOES, SLOT_PANTS, SLOT_CLOAK, SLOT_BELT, SLOT_BACK_R, SLOT_BACK_L, SLOT_S_STORE)
	nojumpsuit = 1
	sexes = 0
	specstats = list("strength" = 0, "perception" = 0, "intelligence" = 0, "constitution" = 0, "endurance" = 0, "speed" = 0, "fortune" = 0)
	specstats_f = list("strength" = 0, "perception" = 0, "intelligence" = 0, "constitution" = 0, "endurance" = 0, "speed" = 0, "fortune" = 0)
	enflamed_icon = "widefire"
	mutanteyes = /obj/item/organ/eyes/night_vision/werewolf

/datum/species/envy/check_roundstart_eligible()
	return FALSE

/datum/species/envy/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	C.grant_language(/datum/language/common)
	C.grant_language(/datum/language/hellspeak)
	C.mind.adjust_skillrank(/datum/skill/combat/polearms, -5, TRUE)
	C.mind.adjust_skillrank(/datum/skill/combat/axesmaces, -5, TRUE)
	C.mind.adjust_skillrank(/datum/skill/combat/wrestling, 5, TRUE)
	C.mind.adjust_skillrank(/datum/skill/combat/unarmed, 5, TRUE)
	C.mind.adjust_skillrank(/datum/skill/combat/swords, -5, TRUE)
	C.mind.adjust_skillrank(/datum/skill/combat/knives, -5, TRUE)
	C.mind.adjust_skillrank(/datum/skill/craft/crafting, -5, TRUE)
	C.mind.adjust_skillrank(/datum/skill/craft/tanning, -5, TRUE)
	C.mind.adjust_skillrank(/datum/skill/misc/swimming, -5, TRUE)
	C.mind.adjust_skillrank(/datum/skill/misc/climbing, -5, TRUE)
	C.mind.adjust_skillrank(/datum/skill/misc/riding, -5, TRUE)
	C.mind.adjust_skillrank(/datum/skill/misc/sewing, -5, TRUE)
	C.mind.adjust_skillrank(/datum/skill/craft/cooking, -5, TRUE)
	C.mind.adjust_skillrank(/datum/skill/misc/athletics, -5, TRUE)
	C.change_stat("strength", 4)
	C.change_stat("endurance", 3)
	C.change_stat("constitution", 6)
	C.change_stat("intelligence", -6)
	C.change_stat("speed", -4)
	armor = /obj/item/clothing/suit/roguetown/armor/skin_armor/demonskin

/datum/species/envy/after_creation(mob/living/carbon/C)
	..()
//	if(!C.has_language(/datum/language/sandspeak))
	C.grant_language(/datum/language/hellspeak)
	to_chat(C, "<span class='info'>I can speak Infernal with ,h before my speech.</span>")

/datum/species/envy/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)
	C.remove_language(/datum/language/hellspeak)

/datum/species/envy/handle_speech(datum/source, mob/speech_args)
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

/datum/species/envy/qualifies_for_rank(rank, list/features)
	return FALSE

/datum/species/envy/get_skin_list()
	return sortList(list(
		"demonic" = SKIN_COLOUR_NOTHING
	))

/datum/species/envy/get_hairc_list()
	return sortList(list(
	"nothing - nothing" = "ffffff"
	))

/datum/species/envy/random_name(gender,unique,lastname)
	return

/datum/species/envy/random_surname()
	return " [pick(world.file2list("strings/rt/names/other/tieflast.txt"))]"

/datum/species/envy/random_name(gender,unique,lastname)
	return "Demon of Envy"

/obj/item/clothing/suit/roguetown/armor/skin_armor/demonskin
	slot_flags = null
	name = "demon's skin"
	desc = ""
	icon_state = null
	body_parts_covered = FULL_BODY
	armor = list("melee" = 40, "bullet" = 40, "laser" = 50,"energy" = 50, "bomb" = 50, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	sewrepair = FALSE
	max_integrity = 150
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF


/obj/item/clothing/suit/roguetown/armor/skin_armor/demonskin/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)

/obj/item/clothing/suit/roguetown/armor/skin_armor/demonskin/dropped(mob/living/carbon/human/user)
	. = ..()
	if(QDELETED(src))
		return
	qdel(src)
