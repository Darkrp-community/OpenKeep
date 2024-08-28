/mob/living/carbon/human/species/abyssariad
	race = /datum/species/abyssariad

/datum/species/abyssariad
	name = "beastkinb"
	id = "abyssariad"
	max_age = 1250

/datum/species/abyssariad/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	RegisterSignal(C, COMSIG_MOB_SAY, .proc/handle_speech)
	C.grant_language(/datum/language/common)
	C.grant_language(/datum/language/abyssal)
	C.cmode_music = 'sound/music/combatabyssariad.ogg'
//	C.verbs |= /mob/proc/praise
	C.verbs |= /mob/proc/yoo
	C.verbs |= /mob/proc/throatsing
	ADD_TRAIT(C, TRAIT_KAIZOKU, TRAIT_GENERIC)  //Cultural Trait. Must not be considered a 'buff' or 'debuff'.

///mob/proc/banzai()
//	set name = "Banzai"
//	set category = "Noises"
//	emote("banzai")

/mob/proc/yoo()
	set name = "Yoo"
	set category = "Noises"
	emote("yoo")

///mob/proc/seppuku()
//	set name = "Sepukku"
//	set category = "Noises"
//	emote("seppuku")

/mob/proc/throatsing()
	set name = "Throatsing"
	set category = "Noises"
	emote("throatsing")

/mob/proc/eldritch()
	set name = "Eldritch"
	set category = "Noises"
	emote("eldritch")

/datum/species/abyssariad/check_roundstart_eligible()
	return FALSE

/datum/species/abyssariad/after_creation(mob/living/carbon/C)
	..()
//	if(!C.has_language(/datum/language/abyssal))
	C.grant_language(/datum/language/abyssal)
	to_chat(C, "<span class='info'>I can speak Abyssal with ,j before my speech.</span>")

/datum/species/abyssariad/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)
	C.remove_language(/datum/language/abyssal)

/datum/species/abyssariad/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/abyssariad/get_skin_list()
	return sortList(list(
	"skin1" = "ffe0d1",
	"skin2" = "fcccb3"
	))


/datum/species/abyssariad/get_hairc_list()
	return sortList(list(
	"black - nightsky" = "0a0707",
	"brown - treebark" = "362e25",
	"blonde - moonlight" = "dfc999",
	"red - autumn" = "a34332"
	))