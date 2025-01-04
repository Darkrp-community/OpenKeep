// Important. These guys are only suitable for events and film-making. Unless you have an ocean-based map, don't make them spawnable naturally.

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
			say(pick(GLOB.ashigaru_aggro))
			linepoint(target)

/mob/living/carbon/human/species/abyssariad/raider/ambush/should_target(mob/living/L)
	. = ..() // They kill fallen enemies. Very honorable.

/mob/living/carbon/human/species/abyssariad/raider/Initialize()
	. = ..()
	var/list/racetypes = list("Changeling" = 1, "Denmorian" = 1, "Ogrun" = 1)
	var/type = pickweight(racetypes)
	switch(type)
		if("Changeling")
			set_species(/datum/species/abyssariad/changeling)
		if("Denmorian")
			set_species(/datum/species/abyssariad/denmorian)
		if("Ogrun")
			set_species(/datum/species/abyssariad/ogrun)
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)

/datum/outfit/job/roguetown/antag/raider/ashigaru/pre_equip(mob/living/carbon/human/H)
	..()
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/ruankai
	mask = /obj/item/clothing/mask/rogue/kaizoku/menpo/half
	pants = /obj/item/clothing/under/roguetown/trou/tobi/random
	cloak = /obj/item/clothing/cloak/jinbaori/raider
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

/mob/living/carbon/human/species/abyssariad/raider/ambush/ashigaru/after_creation()
	..()
	job = "Ambusher Ashigaru"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

	equipOutfit(new /datum/outfit/job/roguetown/antag/raider/ashigaru/ambusher)

/mob/living/carbon/human/species/abyssariad/raider/ambush/ashigaru/after_creation()
	..()
	job = "Ambusher Ashigaru"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

	equipOutfit(new /datum/outfit/job/roguetown/antag/raider/ashigaru/skirmisher)

/mob/living/carbon/human/species/abyssariad/raider/ambush/ashigaru/after_creation()
	..()
	job = "Ambusher Ashigaru"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

	equipOutfit(new /datum/outfit/job/roguetown/antag/raider/ashigaru/fleshripper)

/mob/living/carbon/human/species/abyssariad/raider/ambush/ashigaru/after_creation()
	..()
	job = "Ambusher Ashigaru"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

	equipOutfit(new /datum/outfit/job/roguetown/antag/raider/ashigaru/yarimazing)

/datum/outfit/job/roguetown/antag/raider/ashigaru/ambusher/pre_equip(mob/living/carbon/human/H)
	..()
	r_hand = /obj/item/rogueweapon/sword/scimitar/messer/dao
	l_hand = /obj/item/rogueweapon/shield/rattan
	armor = /obj/item/clothing/suit/roguetown/armor/cuirass/sanmaido
	head = /obj/item/clothing/head/roguetown/helmet/jingasa

/datum/outfit/job/roguetown/antag/raider/ashigaru/skirmisher/pre_equip(mob/living/carbon/human/H)
	..()
	r_hand = /obj/item/rogueweapon/mace/steel/ararebo
	l_hand = /obj/item/rogueweapon/shield/rattan
	head = /obj/item/clothing/head/roguetown/helmet/skullcap/hachigane
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail/tatami

/datum/outfit/job/roguetown/antag/raider/ashigaru/fleshripper/pre_equip(mob/living/carbon/human/H)
	..()
	r_hand = /obj/item/rogueweapon/polearm/spear/yari
	l_hand = /obj/item/rogueweapon/shield/rattan
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail/tatami
	head = /obj/item/clothing/head/roguetown/helmet/jingasa

/datum/outfit/job/roguetown/antag/raider/ashigaru/yarimazing/pre_equip(mob/living/carbon/human/H)
	..()
	r_hand = /obj/item/rogueweapon/polearm/spear/yari/katakama
	armor = /obj/item/clothing/suit/roguetown/armor/cuirass/nanbando
	head = /obj/item/clothing/head/roguetown/helmet/jingasa

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
		emote(pick("laugh", "yawn", "mumble", "blink_r"))

/datum/outfit/job/roguetown/antag/raider/zamurai/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/visored/zunari
	pants = /obj/item/clothing/under/roguetown/chainlegs/sendan
	mask = /obj/item/clothing/mask/rogue/kaizoku/menpo
	cloak = /obj/item/clothing/cloak/haramaki/odoshi/raider
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/suneate
	belt = /obj/item/storage/belt/rogue/kaizoku/leather/daisho/random
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/deelcoat
	armor = /obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi/oyoroigusoku
	wrists = /obj/item/clothing/wrists/roguetown/bracers/kote
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

/mob/living/carbon/human/species/abyssariad/raider/zamurai/shieldwall/after_creation()
	..()
	job = "Shieldwall Lowclass Zamurai"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/roguetown/antag/raider/zamurai/swordshield)

/mob/living/carbon/human/species/abyssariad/raider/zamurai/flanker/after_creation()
	..()
	job = "Flanker Lowclass Zamurai"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/roguetown/antag/raider/zamurai/flanker)

/mob/living/carbon/human/species/abyssariad/raider/zamurai/spearmaster/after_creation()
	..()
	job = "Lungthruster Lowclass Zamurai"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/roguetown/antag/raider/zamurai/spearmaster)

/mob/living/carbon/human/species/abyssariad/raider/zamurai/shocktrooper/after_creation()
	..()
	job = "Skullcracker Lowclass Zamurai"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/roguetown/antag/raider/zamurai/shocktrooper)

/datum/outfit/job/roguetown/antag/raider/zamurai/pre_equip(mob/living/carbon/human/H)
	..()
	pants = /obj/item/clothing/under/roguetown/chainlegs/iron/haidate_tatami
	mask = /obj/item/clothing/mask/rogue/kaizoku/menpo
	cloak = /obj/item/clothing/cloak/haramaki/odoshi/raider
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/light/kusaritabi
	belt = /obj/item/storage/belt/rogue/kaizoku/leather/daisho/random
	wrists = /obj/item/clothing/wrists/roguetown/bracers/kote
	neck = /obj/item/clothing/neck/roguetown/chaincoif/karuta_zukin/military

/datum/outfit/job/roguetown/antag/raider/zamurai/swordshield/pre_equip(mob/living/carbon/human/H)
	..()
	r_hand = /obj/item/rogueweapon/sword/uchigatana
	l_hand = /obj/item/rogueweapon/shield/abyssaltower
	armor = /obj/item/clothing/suit/roguetown/armor/plate/mirror
	head = /obj/item/clothing/head/roguetown/helmet/sallet/tosei_kabuto/cursed
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/light/hitatare/random

/datum/outfit/job/roguetown/antag/raider/zamurai/flanker/pre_equip(mob/living/carbon/human/H)
	..()
	r_hand = /obj/item/rogueweapon/mace/steel/ararebo
	l_hand = /obj/item/rogueweapon/shield/abyssaltower
	head = /obj/item/clothing/head/roguetown/helmet/visored/sallet/tosei_kabuto/cursed
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/kusari
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/ruankai

/datum/outfit/job/roguetown/antag/raider/zamurai/spearmaster/pre_equip(mob/living/carbon/human/H)
	..()
	r_hand = /obj/item/rogueweapon/polearm/halberd/naginata/dustcurse
	armor = /obj/item/clothing/suit/roguetown/armor/medium/surcoat/heartfelt/abyssariad
	head = /obj/item/clothing/head/roguetown/helmet/visored/sallet/tosei_kabuto/cursed
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/tatami

/datum/outfit/job/roguetown/antag/raider/zamurai/shocktrooper/pre_equip(mob/living/carbon/human/H)
	..()
	r_hand = /obj/item/rogueweapon/mace/goden/kanabo/dustcurse
	armor = /obj/item/clothing/suit/roguetown/armor/plate/nanbando
	head = /obj/item/clothing/head/roguetown/helmet/visored/sallet/tosei_kabuto/cursed
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/tatami

//highclass zamurais

/mob/living/carbon/human/species/abyssariad/raider/ambush/hzamurai/slasher/after_creation()
	..()
	job = "Slasher High Zamurai"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)

	equipOutfit(new /datum/outfit/job/roguetown/antag/raider/highzamurai/bisento)

/mob/living/carbon/human/species/abyssariad/raider/ambush/hzamurai/smasher/after_creation()
	..()
	job = "Smasher High Zamurai"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)

	equipOutfit(new /datum/outfit/job/roguetown/antag/raider/highzamurai/tetsubo)

/mob/living/carbon/human/species/abyssariad/raider/ambush/hzamurai/skirmisher/after_creation()
	..()
	job = "Skirmisher High Zamurai"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)

	equipOutfit(new /datum/outfit/job/roguetown/antag/raider/highzamurai/ararebo)

/mob/living/carbon/human/species/abyssariad/raider/ambush/hzamurai/swordsman/after_creation()
	..()
	job = "Swordsman High Zamurai"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)

	equipOutfit(new /datum/outfit/job/roguetown/antag/raider/highzamurai/tachi)

/datum/outfit/job/roguetown/antag/raider/highzamurai
	name = "Exiled Highclass Zamurai"

/datum/outfit/job/roguetown/antag/raider/highzamurai/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/visored/zunari
	pants = /obj/item/clothing/under/roguetown/chainlegs/sendan
	mask = /obj/item/clothing/mask/rogue/kaizoku/menpo
	cloak = /obj/item/clothing/cloak/haramaki/odoshi/raider
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/suneate
	belt = /obj/item/storage/belt/rogue/kaizoku/leather/daisho/random
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/deelcoat
	armor = /obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi/oyoroigusoku
	wrists = /obj/item/clothing/wrists/roguetown/bracers/kote
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

/datum/outfit/job/roguetown/antag/raider/highzamurai/tetsubo/pre_equip(mob/living/carbon/human/H)
	..()
	r_hand = /obj/item/rogueweapon/mace/goden/steel/tetsubo/dustcurse
	armor = /obj/item/clothing/suit/roguetown/armor/plate/full/nanbando/cursed
	head = /obj/item/clothing/head/roguetown/helmet/visored/zunari/cursed
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/kusari

/datum/outfit/job/roguetown/antag/raider/highzamurai/bisento/pre_equip(mob/living/carbon/human/H)
	..()
	r_hand = /obj/item/rogueweapon/polearm/halberd/bisento/dustcurse
	armor = /obj/item/clothing/suit/roguetown/armor/plate/full/nanbando/cursed
	head = /obj/item/clothing/head/roguetown/helmet/visored/sallet/tosei_kabuto/cursed
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/kusari

/datum/outfit/job/roguetown/antag/raider/highzamurai/ararebo/pre_equip(mob/living/carbon/human/H)
	..()
	r_hand = /obj/item/rogueweapon/mace/steel/ararebo/dustcurse
	l_hand = /obj/item/rogueweapon/shield/abyssaltower/dustcurse
	head = /obj/item/clothing/head/roguetown/helmet/visored/zunari/cursed
	armor = /obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/ruankai

/datum/outfit/job/roguetown/antag/raider/highzamurai/tachi/pre_equip(mob/living/carbon/human/H)
	..()
	r_hand = /obj/item/rogueweapon/sword/long/tachi/dustcurse
	l_hand = /obj/item/rogueweapon/shield/tower/abyssal/dustcurse
	armor = /obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi/oyoroigusoku/cursed
	head = /obj/item/clothing/head/roguetown/helmet/visored/sallet/tosei_kabuto/cursed
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/ruankai

