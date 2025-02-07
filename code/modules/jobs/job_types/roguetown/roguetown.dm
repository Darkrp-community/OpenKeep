/datum/job/roguetown
	display_order = JOB_DISPLAY_ORDER_CAPTAIN

/datum/job/roguetown/New()
	. = ..()
	if(give_bank_account)
		for(var/X in GLOB.noble_positions)
			peopleiknow += X
			peopleknowme += X
		for(var/X in GLOB.church_positions)
			peopleiknow += X
			peopleknowme += X
		for(var/X in GLOB.towner_positions)
			peopleiknow += X
			peopleknowme += X
		for(var/X in GLOB.garrison_positions)
			peopleiknow += X
			peopleknowme += X
		for(var/X in GLOB.peasant_positions)
			peopleiknow += X
			peopleknowme += X
		for(var/X in GLOB.apprentices_positions)
			peopleiknow += X
			peopleknowme += X

/datum/outfit/job/roguetown
	uniform = null
	id = null
	ears = null
	belt = null
	back = null
	shoes = null
	box = null
	backpack = null
	satchel  = null
	duffelbag = null
	/// List of patrons we are allowed to use
	var/list/allowed_patrons
	/// Default patron in case the patron is not allowed
	var/datum/patron/default_patron

/datum/outfit/job/roguetown/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	var/datum/patron/ourpatron = H.patron
	if(!ourpatron || (allowed_patrons && !(ourpatron.type in allowed_patrons)))
		var/list/datum/patron/possiblegods = list()
		var/list/datum/patron/godlist = list()
		for(var/god in GLOB.patronlist)
			if(!(god in allowed_patrons))
				continue
			possiblegods |= god
			var/datum/patron/P = GLOB.patronlist[god]
			if(P.associated_faith == ourpatron.associated_faith) // At least choose a patron within our list of POSSIBLE patrons
				godlist |= god
		if(length(godlist))
			H.set_patron(default_patron || pick(godlist))
		else
			H.set_patron(default_patron || pick(possiblegods))
	if(ourpatron != H.patron) // If the patron we selected first does not match the patron we end up with, display the message.
		to_chat(H, "<span class='warning'>I've followed the word of [ourpatron] all my life, but the path I tread todae has guided mine faith towards [H.patron].")

	if(H.mind)
		if(H.dna)
			H.dna.species.random_underwear(H.gender)
			if(H.dna.species)
				if(H.dna.species.id == "human")
					if(H.skin_tone == SKIN_COLOR_HEARTFELT)
						ADD_TRAIT(H, TRAIT_KAIZOKU, TRAIT_GENERIC)
						H.grant_language(/datum/language/abyssal)
				if(H.dna.species.id == "elf")
					H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
				if(H.dna.species.id == "dwarf")
					H.mind.adjust_skillrank(/datum/skill/labor/mining, 1, TRUE)
				if(H.dna.species.id == "abyssariad")
					H.verbs |= /mob/proc/throatsing
					H.cmode_music = list('sound/music/kaizoku/combat/combat_changeling.ogg','sound/music/kaizoku/combat/combat_stormwarrior.ogg','sound/music/kaizoku/combat/combat_searaider.ogg','sound/music/kaizoku/combat/combat_oldtides.ogg','sound/music/kaizoku/combat/combat_decapitator.ogg','sound/music/kaizoku/combat/combat_emperor.ogg','sound/music/kaizoku/combat/combat_traditional.ogg','sound/music/kaizoku/combat/combat_navalretainers.ogg','sound/music/kaizoku/combat/combat_kyudo.ogg')
					ADD_TRAIT(H, TRAIT_KAIZOKU, TRAIT_GENERIC)
				if(H.dna.species.name == "Changeling")
					ADD_TRAIT(H, TRAIT_STRONGBITE, TRAIT_GENERIC) // When their Skull-bending "wag system" comes about, it will be their debuff to counter this.
				if(H.dna.species.name == "Skylancer")
					H.verbs |= /mob/proc/birdcall
				if(H.dna.species.name == "Undine")
					H.cmode_music = list('sound/music/kaizoku/combat/combat_changeling.ogg','sound/music/kaizoku/combat/combat_stormwarrior.ogg','sound/music/kaizoku/combat/combat_searaider.ogg','sound/music/kaizoku/combat/combat_oldtides.ogg','sound/music/kaizoku/combat/combat_decapitator.ogg','sound/music/kaizoku/combat/combat_emperor.ogg','sound/music/kaizoku/combat/combat_traditional.ogg','sound/music/kaizoku/combat/combat_navalretainers.ogg','sound/music/kaizoku/combat/combat_kyudo.ogg')
					ADD_TRAIT(H, TRAIT_KAIZOKU, TRAIT_GENERIC)
					H.mind.teach_crafting_recipe(/datum/crafting_recipe/reinforcedarmor)
					H.mind.teach_crafting_recipe(/datum/crafting_recipe/reinforcedhelmet)
					H.mind.teach_crafting_recipe(/datum/crafting_recipe/mediumhelmet)
					H.mind.teach_crafting_recipe(/datum/crafting_recipe/mediumarmor)
					H.mind.teach_crafting_recipe(/datum/crafting_recipe/lighthelmet)
					H.mind.teach_crafting_recipe(/datum/crafting_recipe/lightarmor)
					H.mind.teach_crafting_recipe(/datum/crafting_recipe/obsidian_spear)
					H.mind.teach_crafting_recipe(/datum/crafting_recipe/obsidian_club)
					H.verbs |= /mob/proc/croak
//				if(H.dna.species.id == "Abyssariad"||H.dna.species.name == "Undine") // Not finished yet because I can't test it now.
//					if(H.patron == /datum/patron/divine/abyssor)
//						H.set_patron(/datum/patron/goodabyssanctum/abyssor) //so they spawn with their unique powers.

	H.underwear_color = null
	H.update_body()

/datum/outfit/job/roguetown/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(H.mind)
		if(H.familytree_pref != FAMILY_NONE && !visualsOnly && !H.family_datum)
			SSfamilytree.AddLocal(H, H.familytree_pref)
		if(H.ckey)
			if(check_crownlist(H.ckey))
				H.mind.special_items["Champion Circlet"] = /obj/item/clothing/head/roguetown/crown/sparrowcrown
			give_special_items(H)
	for(var/list_key in SStriumphs.post_equip_calls)
		var/datum/triumph_buy/thing = SStriumphs.post_equip_calls[list_key]
		thing.on_activate(H)
	return
