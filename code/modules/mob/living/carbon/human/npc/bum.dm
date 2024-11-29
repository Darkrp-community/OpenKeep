GLOBAL_LIST_INIT(bum_quotes, world.file2list("strings/rt/bumlines.txt"))
GLOBAL_LIST_INIT(bum_aggro, world.file2list("strings/rt/bumaggrolines.txt"))

/mob/living/carbon/human/species/human/northern/bum
	aggressive=0
	mode = AI_IDLE
	faction = list("bums", "station")
	ambushable = FALSE
	dodgetime = 30
	flee_in_pain = TRUE
	possible_rmb_intents = list()

	wander = FALSE

/mob/living/carbon/human/species/human/northern/bum/ambush
	aggressive=1

	wander = TRUE

/*	..................   Hostile Bum   ................... */
/mob/living/carbon/human/species/human/northern/bum/ambush/Initialize()
	. = ..()
	name = pick("Madman", "Creep", "Lunatic", "Leper")

/mob/living/carbon/human/species/human/northern/bum/retaliate(mob/living/L)
	var/newtarg = target
	.=..()
	if(target)
		aggressive=1
		wander = TRUE
		if(target != newtarg)
			say(pick(GLOB.bum_aggro))
			linepoint(target)

/mob/living/carbon/human/species/human/northern/bum/should_target(mob/living/L)
	if(L.stat != CONSCIOUS)
		return FALSE
	. = ..()

/mob/living/carbon/human/species/human/northern/bum/Initialize()
	. = ..()
	set_species(/datum/species/human/northern)
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)

/mob/living/carbon/human/species/human/northern/bum/after_creation()
	..()
	job = "Beggar"
	QDEL_NULL(sexcon)
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/roguetown/vagrant)

/mob/living/carbon/human/species/human/northern/bum/npc_idle()
	if(m_intent == MOVE_INTENT_SNEAK)
		return
	if(world.time < next_idle)
		return
	next_idle = world.time + rand(30, 70)
	if((mobility_flags & MOBILITY_MOVE) && isturf(loc) && wander)
		if(prob(20))
			var/turf/T = get_step(loc,pick(GLOB.cardinals))
			if(!istype(T, /turf/open/transparent/openspace))
				Move(T)
		else
			face_atom(get_step(src,pick(GLOB.cardinals)))
	if(!wander && prob(10))
		face_atom(get_step(src,pick(GLOB.cardinals)))
	if(prob(3))
		say(pick(GLOB.bum_quotes))
	if(prob(3))
		emote(pick("laugh","burp","yawn","grumble","mumble","blink_r","clap"))


/mob/living/carbon/human/species/human/northern/bum/outlaw/after_creation()
	aggressive= TRUE
	wander = TRUE
	equipOutfit(new /datum/outfit/job/roguetown/outlaw)

/datum/outfit/job/roguetown/outlaw
	name = "Beggar"

/datum/outfit/job/roguetown/outlaw/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = 9
	H.STASPD = 8
	H.STACON = 9
	H.STAEND = 9

	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
	if(prob(30))
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant/l
	if(prob(30))
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
	pants = /obj/item/clothing/under/roguetown/tights/random
	if(prob(30))
		pants = /obj/item/clothing/under/roguetown/tights/vagrant
	if(prob(30))
		pants = /obj/item/clothing/under/roguetown/tights/vagrant/l
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	if(prob(30))
		shoes = /obj/item/clothing/shoes/roguetown/boots
	if(prob(30))
		belt = /obj/item/storage/belt/rogue/leather/rope
		beltl = /obj/item/rogueweapon/knife/villager
	if(prob(10))
		belt = /obj/item/storage/belt/rogue/leather
		beltr = /obj/item/reagent_containers/powder/moondust
	if(prob(10))
		cloak = /obj/item/clothing/cloak/raincloak/brown
	if(prob(10))
		gloves = /obj/item/clothing/gloves/roguetown/fingerless
	if(prob(10))
		wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	if(prob(10))
		neck = /obj/item/storage/belt/rogue/pouch/coins/poor

	var/head = rand(1,6)
	switch(head)
		if(1)
			head = /obj/item/clothing/head/roguetown/knitcap
			mask = /obj/item/clothing/mask/rogue/shepherd
		if(2)
			head = /obj/item/clothing/head/roguetown/strawhat
			mask = /obj/item/clothing/mask/rogue/shepherd/rag
		if(3)
			head = /obj/item/clothing/head/roguetown/menacing
		if(4)
			head = /obj/item/clothing/head/roguetown/armingcap
		if(5)
			head = /obj/item/clothing/head/roguetown/helmet/leather
		if(6)
			head = /obj/item/clothing/head/roguetown/roguehood/uncolored

	var/armor = rand(1,5)
	switch(armor)
		if(1)
			armor = /obj/item/clothing/suit/roguetown/armor/gambeson/light
			pants = /obj/item/clothing/under/roguetown/trou/leather
		if(2)
			armor = /obj/item/clothing/suit/roguetown/shirt/rags
			pants = /obj/item/clothing/under/roguetown/trou/leather
		if(3)
			armor = /obj/item/clothing/suit/roguetown/armor/gambeson
		if(4)
			armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
			neck = /obj/item/clothing/neck/roguetown/coif
		if(5)
			armor = /obj/item/clothing/suit/roguetown/armor/leather/jacket

	var/weapon = rand(1,6)
	switch(weapon)
		if(1)
			r_hand = /obj/item/rogueweapon/axe/iron
		if(2)
			r_hand = /obj/item/rogueweapon/polearm/halberd/bardiche/woodcutter
		if(3)
			r_hand = /obj/item/rogueweapon/mace/cudgel/bludgeon
		if(4)
			r_hand =/obj/item/rogueweapon/pitchfork
		if(5)
			r_hand = /obj/item/rogueweapon/thresher
		if(6)
			r_hand = /obj/item/rogueweapon/sword/short/iron

