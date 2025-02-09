// Important. These guys are only suitable for events and film-making. Unless you have an ocean-based map, don't make them spawnable naturally.
//They are not finished yet and should not be treated as full content. There is abilities I'd like to provide them.

GLOBAL_LIST_INIT(ashigaru_quotes, world.file2list("strings/rt/ashigarulines.txt"))
GLOBAL_LIST_INIT(ashigaru_aggro, world.file2list("strings/rt/ashigaruaggrolines.txt"))

/mob/living/carbon/human/species/abyssariad/raider
	aggressive = 1
	mode = AI_IDLE
	faction = list("zamurai", "station")
	ambushable = FALSE
	dodgetime = 3 SECONDS
	flee_in_pain = FALSE
	possible_rmb_intents = list()

	wander = FALSE

/mob/living/carbon/human/species/abyssariad/raider/ambush
	aggressive = 1
	wander = TRUE
	dodgetime = 1 SECONDS

/mob/living/carbon/human/species/abyssariad/raider/retaliate(mob/living/L)
	var/newtarg = target
	.=..()
	if(target)
		aggressive = 1
		wander = TRUE
		if(target != newtarg)
			if(prob(25))
				emote("rage")

/mob/living/carbon/human/species/abyssariad/raider/ambush/should_target(mob/living/L)
	. = ..() // They kill fallen enemies. Very honorable.

/mob/living/carbon/human/species/abyssariad/raider/Initialize()
	. = ..()
	var/list/racetypes = list("Changeling" = 1, "Skylancer" = 1, "Ogrun" = 1)
	var/type = pickweight(racetypes)
	switch(type)
		if("Changeling")
			set_species(/datum/species/abyssariad/changeling)
		if("Skylancer")
			set_species(/datum/species/abyssariad/skylancer)
		if("Ogrun")
			set_species(/datum/species/abyssariad/ogrun)
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)

/mob/living/carbon/human/species/abyssariad/raider/npc_idle()
	if(m_intent == MOVE_INTENT_SNEAK)
		return
	if(world.time < next_idle)
		return
	next_idle = world.time + rand(30, 70)
	if((mobility_flags & MOBILITY_MOVE) && isturf(loc) && wander)
		if(prob(20))
			var/turf/T = get_step(loc, pick(GLOB.cardinals))
			if(!istype(T, /turf/open/transparent/openspace))
				Move(T)
		else
			face_atom(get_step(src, pick(GLOB.cardinals)))
	else if(!wander && prob(10))
		face_atom(get_step(src, pick(GLOB.cardinals)))
	if(prob(3))
		say(pick(GLOB.ashigaru_quotes))
	if(prob(3))
		emote(pick("laugh", "throatsing"))

//ashigarus

/mob/living/carbon/human/species/abyssariad/raider/ambush/ashigaru/after_creation()
	..()
	job = "Exiled Ashigaru"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

	equipOutfit(new /datum/outfit/job/roguetown/antag/raider/ashigaru)

/datum/outfit/job/roguetown/antag/raider/ashigaru/pre_equip(mob/living/carbon/human/H)
	..()
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/ruankai
	mask = /obj/item/clothing/mask/rogue/kaizoku/menpo/half
	pants = /obj/item/clothing/under/roguetown/trou/tobi/random
	cloak = /obj/item/clothing/cloak/stabard/haramaki/jinbaori/raider
	shoes = /obj/item/clothing/shoes/roguetown/boots/jikatabi/shinobi
	belt = /obj/item/storage/belt/rogue/kaizoku/leather/daisho/random

	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("endurance", 2)
		H.change_stat("constitution", 1)

	var/loadout = rand(1, 4)
	switch(loadout)
		if(1)
			r_hand = /obj/item/rogueweapon/sword/scimitar/messer/dao
			l_hand = /obj/item/rogueweapon/shield/wood/rattan
			armor = /obj/item/clothing/suit/roguetown/armor/cuirass/sanmaido
			head = /obj/item/clothing/head/roguetown/helmet/jingasa
		if(2)
			r_hand = /obj/item/rogueweapon/mace/steel/ararebo
			l_hand = /obj/item/rogueweapon/shield/wood/rattan
			head = /obj/item/clothing/head/roguetown/helmet/skullcap/hachigane
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/tatami
		if(3)
			r_hand = /obj/item/rogueweapon/polearm/spear/yari
			l_hand = /obj/item/rogueweapon/shield/wood/rattan
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/tatami
			head = /obj/item/clothing/head/roguetown/helmet/jingasa
		if(4)
			r_hand = /obj/item/rogueweapon/polearm/spear/yari/katakama
			armor = /obj/item/clothing/suit/roguetown/armor/cuirass/nanbando
			head = /obj/item/clothing/head/roguetown/helmet/jingasa

// lowclass zamurais

/mob/living/carbon/human/species/abyssariad/raider/zamurai/after_creation()
	..()
	job = "Lowclass Zamurai"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/roguetown/antag/raider/zamurai)

/datum/outfit/job/roguetown/antag/raider/zamurai/pre_equip(mob/living/carbon/human/H)
	..()
	pants = /obj/item/clothing/under/roguetown/chainlegs/sendan
	mask = /obj/item/clothing/mask/rogue/kaizoku/menpo
	cloak = /obj/item/clothing/cloak/stabard/haramaki/odoshi/raider
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/suneate/cursed
	belt = /obj/item/storage/belt/rogue/kaizoku/leather/daisho/random
	wrists = /obj/item/clothing/wrists/roguetown/bracers/kote/cursed
	neck = /obj/item/clothing/neck/roguetown/chaincoif/karuta_zukin/military

	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.change_stat("strength", 3)
		H.change_stat("endurance", 2)
		H.change_stat("constitution", 2)
		H.change_stat("intelligence", 2)
		H.change_stat("speed", 2)

	var/loadout = rand(1, 4)
	switch(loadout)
		if(1)
			r_hand = /obj/item/rogueweapon/sword/uchigatana
			l_hand = /obj/item/rogueweapon/shield/tower/abyssaltower
			armor = /obj/item/clothing/suit/roguetown/armor/plate/mirror
			head = /obj/item/clothing/head/roguetown/helmet/sallet/tosei_kabuto/cursed
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/light/hitatare/random
		if(2)
			r_hand = /obj/item/rogueweapon/mace/steel/ararebo
			l_hand = /obj/item/rogueweapon/shield/tower/abyssaltower
			head = /obj/item/clothing/head/roguetown/helmet/visored/sallet/tosei_kabuto/cursed
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/kusari
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/ruankai
		if(3)
			r_hand = /obj/item/rogueweapon/polearm/halberd/bardiche/naginata/dustcurse
			armor = /obj/item/clothing/suit/roguetown/armor/medium/surcoat/heartfelt/abyssariad
			head = /obj/item/clothing/head/roguetown/helmet/visored/sallet/tosei_kabuto/cursed
			shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/tatami
		if(4)
			r_hand = /obj/item/rogueweapon/polearm/halberd/bardiche/naginata/dustcurse
			armor = /obj/item/clothing/suit/roguetown/armor/medium/surcoat/heartfelt/abyssariad
			head = /obj/item/clothing/head/roguetown/helmet/visored/sallet/tosei_kabuto/cursed
			shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/tatami

//highclass zamurais

/mob/living/carbon/human/species/abyssariad/raider/ambush/highzamurai/after_creation()
	..()
	job = "Exiled High Zamurai"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)

	equipOutfit(new /datum/outfit/job/roguetown/antag/raider/highzamurai)

/datum/outfit/job/roguetown/antag/raider/highzamurai
	name = "Exiled Highclass Zamurai"

/datum/outfit/job/roguetown/antag/raider/highzamurai/pre_equip(mob/living/carbon/human/H)
	..()
	H.change_stat("strength", 3)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 2)
	H.change_stat("intelligence", 2)
	H.change_stat("speed", 2)

	pants = /obj/item/clothing/under/roguetown/chainlegs/sendan/cursed
	mask = /obj/item/clothing/mask/rogue/kaizoku/menpo
	cloak = /obj/item/clothing/cloak/stabard/haramaki/odoshi/raider
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/suneate/cursed
	belt = /obj/item/storage/belt/rogue/kaizoku/leather/daisho/random
	wrists = /obj/item/clothing/wrists/roguetown/bracers/kote/cursed
	neck = /obj/item/clothing/neck/roguetown/chaincoif/karuta_zukin/military

	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 5, TRUE)

		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)

	var/loadout = rand(1, 4)
	switch(loadout)
		if(1)
			r_hand = /obj/item/rogueweapon/mace/goden/steel/tetsubo/dustcurse
			armor = /obj/item/clothing/suit/roguetown/armor/plate/full/nanbando/cursed
			head = /obj/item/clothing/head/roguetown/helmet/visored/zunari/cursed
			shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/kusari
		if(2)
			r_hand = /obj/item/rogueweapon/polearm/halberd/bisento/dustcurse
			armor = /obj/item/clothing/suit/roguetown/armor/plate/full/nanbando/cursed
			head = /obj/item/clothing/head/roguetown/helmet/visored/sallet/tosei_kabuto/cursed
			shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/kusari
		if(3)
			r_hand = /obj/item/rogueweapon/mace/steel/ararebo/dustcurse
			l_hand = /obj/item/rogueweapon/shield/tower/abyssaltower/dustcurse
			armor = /obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi
			head = /obj/item/clothing/head/roguetown/helmet/visored/zunari/cursed
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/ruankai
		if(4)
			r_hand = /obj/item/rogueweapon/sword/long/tachi/dustcurse
			l_hand = /obj/item/rogueweapon/shield/tower/metal/abyssal/dustcurse
			armor = /obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi/oyoroigusoku/cursed
			head = /obj/item/clothing/head/roguetown/helmet/visored/sallet/tosei_kabuto/cursed
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/ruankai
