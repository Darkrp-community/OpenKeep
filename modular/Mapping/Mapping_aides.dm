/*	..................   Loot spawners   ................... */
/obj/effect/spawner/roguemap/loot
	icon_state = "loot"
	probby = 50

/obj/effect/spawner/roguemap/loot/common
	spawned = list(
		/obj/item/roguecoin/copper = 5,
		/obj/item/roguecoin/copper/pile = 15,
		/obj/item/natural/cloth = 10,
		/obj/item/storage/belt/rogue/pouch = 5,
		/obj/item/storage/belt/rogue/pouch/coins/poor = 5,
		/obj/item/storage/belt/rogue/leather/rope = 10,
		/obj/item/natural/bundle/stick = 10,
		/obj/item/grown/log/tree/small = 15,
		/obj/item/natural/hide = 4,
		/obj/item/clothing/shoes/roguetown/gladiator = 5,
		/obj/item/kitchen/spoon = 1,
		/obj/item/reagent_containers/glass/bowl = 1,

		)

/obj/effect/spawner/roguemap/loot/weapon
	spawned = list(
		/obj/item/roguecoin/copper/pile = 15,
		/obj/item/rogueweapon/knife/hunting = 10,
		/obj/item/rogueweapon/knife/dagger = 8,
		/obj/item/rogueweapon/knife/dagger/steel = 4,
		/obj/item/rogueweapon/knife/dagger/silver = 2,
		/obj/item/rogueweapon/sword/iron = 3,
		/obj/item/rogueweapon/axe/iron = 10,
		/obj/item/rogueweapon/mace = 5,
		/obj/item/quiver/arrows = 5,
		/obj/item/rogueweapon/sword/short = 5,
		/obj/item/clothing/suit/roguetown/armor/leather = 10,
		/obj/item/clothing/suit/roguetown/armor/gambeson = 15,
		/obj/item/clothing/gloves/roguetown/chain/iron = 3,
		/obj/item/clothing/neck/roguetown/coif = 3,
		/obj/item/clothing/shoes/roguetown/gladiator = 5
		)


/obj/effect/spawner/roguemap/loot/jewelry
	icon = 'modular/Neu_Food/icons/cooking.dmi'
	icon_state = "golden"
	color = "#06b606"
	spawned = list(
		/obj/item/roguestatue/iron = 8,
		/obj/item/roguestatue/steel = 8,
		/obj/item/ingot/gold = 7,
		/obj/item/roguestatue/silver = 8,
		/obj/item/clothing/ring/silver = 7,
		/obj/item/reagent_containers/glass/cup/silver = 7,
		/obj/item/storage/belt/rogue/leather/plaquesilver = 7,
		/obj/item/clothing/ring/gold = 5,
		/obj/item/ingot/gold = 5,
		/obj/item/reagent_containers/glass/cup/golden = 4,
		/obj/item/storage/belt/rogue/leather/plaquegold = 4,
		/obj/item/clothing/mask/rogue/spectacles/golden = 3,
		/obj/item/clothing/head/roguetown/crown/circlet = 3,
		/obj/item/roguestatue/gold/loot=2,
		/obj/item/clothing/head/roguetown/helmet/heavy/decorated/golden = 1,
		/obj/item/clothing/head/roguetown/crown/nyle = 1,
		/obj/item/roguestatue/gold = 1,
		)


/*	..................   Random Seeds   ................... */
/obj/effect/spawner/roguemap/seeds	// all random
	icon = 'modular/Neu_Farming/icons/produce.dmi'
	icon_state = "seeds"
	color = "#06b606"
	probby = 100
	spawned = list(
		/obj/item/neuFarm/seed/wheat = 20,
		/obj/item/neuFarm/seed/cabbage = 10,
		/obj/item/neuFarm/seed/oat = 10,
		/obj/item/neuFarm/seed/potato = 10,
		/obj/item/neuFarm/seed/turnip = 10,
		/obj/item/neuFarm/seed/apple = 10,
		/obj/item/neuFarm/seed/onion = 10,
		/obj/item/neuFarm/seed/berryrogue = 15,
		/obj/item/neuFarm/seed/westleach = 10,
		/obj/item/neuFarm/seed/sunflower = 10,
		/obj/item/neuFarm/seed/swampleaf = 5,
		/obj/item/neuFarm/seed/pear = 5,
		/obj/item/neuFarm/seed/poppy = 5,
		/obj/item/neuFarm/seed/poison_berries = 5,
		/obj/item/neuFarm/seed/fyritius = 5 )

/obj/effect/spawner/roguemap/seeds/common
	spawned = list(
		/obj/item/neuFarm/seed/wheat = 25,
		/obj/item/neuFarm/seed/cabbage = 15,
		/obj/item/neuFarm/seed/oat = 10,
		/obj/item/neuFarm/seed/potato = 10,
		/obj/item/neuFarm/seed/turnip = 10,
		/obj/item/neuFarm/seed/apple = 10,
		/obj/item/neuFarm/seed/onion = 10 )

/obj/effect/spawner/roguemap/seeds/uncommon
	spawned = list(
		/obj/item/neuFarm/seed/berryrogue = 40,
		/obj/item/neuFarm/seed/westleach = 25,
		/obj/item/neuFarm/seed/swampleaf = 15,
		/obj/item/neuFarm/seed/pear = 15,
		/obj/item/neuFarm/seed/poison_berries = 5 )

/obj/effect/spawner/roguemap/seeds/flowers
	spawned = list(
		/obj/item/neuFarm/seed/sunflower = 70,
		/obj/item/neuFarm/seed/fyritius = 10,
		/obj/item/neuFarm/seed/poppy = 20 )

/*	..................   Random Alcohol   ................... */
/obj/effect/spawner/roguemap/alcohol	// random beer
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clear_bottle1"
	color = "#06b606"
	probby = 100
	spawned = list(
		/obj/item/reagent_containers/glass/bottle/rogue/beer = 50,
		/obj/item/reagent_containers/glass/bottle/rogue/beer/spottedhen = 15,
		/obj/item/reagent_containers/glass/bottle/rogue/beer/blackgoat = 10,
		/obj/item/reagent_containers/glass/bottle/rogue/beer/ratkept = 5,
		/obj/item/reagent_containers/glass/bottle/rogue/beer/hagwoodbitter = 10,
		/obj/item/reagent_containers/glass/bottle/rogue/beer/aurorian = 5,
		/obj/item/reagent_containers/glass/bottle/rogue/beer/fireleaf = 5,
		/obj/item/reagent_containers/glass/bottle/rogue/beer/butterhairs = 5,
		/obj/item/reagent_containers/glass/bottle/rogue/beer/stonebeardreserve = 5,
		/obj/item/reagent_containers/glass/bottle/rogue/beer/voddena = 5 )

/obj/effect/spawner/roguemap/alcohol/wine
	spawned = list(
		/obj/item/reagent_containers/glass/bottle/rogue/wine = 50,
		/obj/item/reagent_containers/glass/bottle/rogue/wine/sourwine =10,
		/obj/item/reagent_containers/glass/bottle/rogue/redwine = 20,
		/obj/item/reagent_containers/glass/bottle/rogue/whitewine = 20,
		/obj/item/reagent_containers/glass/bottle/rogue/elfred = 5,
		/obj/item/reagent_containers/glass/bottle/rogue/elfblue = 5 )


/*	..................   Random Gem spawner   ................... */
/obj/effect/spawner/roguemap/loot/random_gem
	spawned = list(
	/obj/item/roguegem = 25,
	/obj/item/roguegem/green = 12,
	/obj/item/roguegem/blue = 6,
	/obj/item/roguegem/yellow = 3,
	/obj/item/roguegem/violet = 2,
	/obj/item/roguegem/diamond = 1)

// ===================================================================================
/*	..................   Sewer Danger   ................... */
/obj/effect/spawner/roguemap/sewerencounter
	icon_state = "srat"
	icon = 'icons/roguetown/mob/monster/rat.dmi'
	probby = 50
	color = "#ff0000"
	spawned = list(
		/obj/item/reagent_containers/food/snacks/smallrat = 30,
		/obj/item/reagent_containers/food/snacks/smallrat/dead = 10,
		/obj/item/organ/guts = 5,
		/obj/item/roguecoin/copper = 5,
		/obj/effect/gibspawner/generic = 5,
		/obj/effect/decal/remains/bigrat = 5,
		/obj/structure/idle_enemy/bigrat = 2,
		)

/*	..................   Cheap Room Danger   ................... */
/obj/effect/spawner/roguemap/cheapinnroomencounter
	icon_state = "paperwizard"
	icon = 'icons/mob/simple_human.dmi'
	probby = 50
	color = "#ff0000"
	spawned = list(
		/obj/item/reagent_containers/food/snacks/smallrat = 15,
		/obj/item/reagent_containers/food/snacks/smallrat/dead = 10,
		/obj/item/roguecoin/copper = 50,
		/mob/living/carbon/human/species/human/northern/bum/ambush  = 25,
		)

/*	..................   Ancient Tomb Danger   ................... */
/obj/effect/spawner/roguemap/ancientskellyguardmaybe
	icon = 'icons/roguetown/mob/skeleton_male.dmi'
	icon_state = "z"
	probby = 50
	color = "#ff0000"
	spawned = list(
		/obj/structure/idle_enemy/ancient_skeleton_guard = 100
		)

/*	..................   Beggar Danger   ................... */
/obj/effect/spawner/roguemap/hostile_beggar_danger
	icon_state = "faceless"
	icon = 'icons/mob/simple_human.dmi'
	probby = 100 // temp to find out if decal vomit spawns
	color = "#ff0000"
	spawned = list(
		/obj/effect/decal/cleanable/vomit = 100,
		/obj/item/clothing/mask/cigarette/rollie = 10,
		/obj/item/rogueweapon/knife/stone = 10,
		/obj/structure/idle_enemy/hostile_bum = 100	)

/*	..................   Mines Danger   ................... */
/obj/effect/spawner/roguemap/mine_mole_maybe
	icon = 'icons/roguetown/mob/monster/mole.dmi'
	icon_state = "mole"
	probby = 50
	color = "#ff0000"
	spawned = list(
		/obj/effect/decal/remains/mole = 20,
		/obj/item/natural/rock = 10,
		/obj/item/natural/stone = 10,
		/obj/item/roguegem/yellow = 10,
		/obj/structure/idle_enemy/mole = 50	)

/*	..................   Crypt Danger   ................... */
/obj/effect/spawner/roguemap/crypt_randomdanger
	icon = 'icons/roguetown/mob/skeleton_male.dmi'
	icon_state = "z"
	probby = 50
	color = "#ff0000"
	spawned = list(
		/obj/item/roguecoin/silver = 5,
		/obj/item/reagent_containers/food/snacks/grub/silk = 5,
		/obj/item/natural/worms = 20,
		/obj/item/reagent_containers/food/snacks/smallrat/dead = 10,
		/obj/structure/idle_enemy/bigrat = 10,
		/obj/structure/idle_enemy/weak_skelly = 50	)

/*	..................   Rat Danger   ................... */
/obj/effect/spawner/roguemap/rat_danger
	icon = 'icons/roguetown/mob/monster/bigrat.dmi'
	icon_state = "rat"
	probby = 50
	color = "#ff0000"
	spawned = list(
		/obj/effect/decal/remains/bigrat = 20,
		/obj/item/reagent_containers/food/snacks/smallrat = 20,
		/obj/item/natural/worms = 10,
		/obj/item/reagent_containers/food/snacks/smallrat/dead = 10,
		/obj/structure/idle_enemy/bigrat = 40)

/*	..................   Maneater Danger   ................... */
/obj/effect/spawner/roguemap/maneater_danger
	icon = 'icons/roguetown/mob/monster/lamia.dmi'
	icon_state = "headless"
	probby = 50
	color = "#ff0000"
	spawned = list(
		/obj/structure/idle_enemy/lamia = 50,
		/obj/structure/idle_enemy/headless = 50)



// ===================================================================================
/*	..................   Idle Enemy Spawner   ................... */
/obj/structure/idle_enemy
	name = ""
	icon = 'icons/roguetown/mob/skeleton_male.dmi'
	icon_state = ""
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	anchored = TRUE
	layer = BELOW_OBJ_LAYER
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/structure/idle_enemy/ancient_skeleton_guard
/obj/structure/idle_enemy/ancient_skeleton_guard/Initialize()
	. = ..()
	AddComponent(/datum/component/spawner/ancient_skeleton_guard)
/datum/component/spawner/ancient_skeleton_guard
	mob_types = list(/mob/living/carbon/human/species/skeleton/npc/ancient)
	spawn_time = 0
	spawn_delay = 0
	max_mobs = 1
	range = 11
	spawn_text = ""

/*	..................   Big Rat Spawner   ................... */
/obj/structure/idle_enemy/bigrat
/obj/structure/idle_enemy/bigrat/Initialize()
	. = ..()
	AddComponent(/datum/component/spawner/bigrat)
/datum/component/spawner/bigrat
	mob_types = list(/mob/living/simple_animal/hostile/retaliate/rogue/bigrat)
	spawn_time = 0
	spawn_delay = 0
	max_mobs = 1
	range = 11
	spawn_text = ""

/*	..................   Hostile Bum Spawner   ................... */
/obj/structure/idle_enemy/hostile_bum
/obj/structure/idle_enemy/hostile_bum/Initialize()
	. = ..()
	AddComponent(/datum/component/spawner/hostile_bum)
/datum/component/spawner/hostile_bum
	mob_types = list(/mob/living/carbon/human/species/human/northern/bum/ambush)
	spawn_time = 0
	spawn_delay = 0
	max_mobs = 1
	range = 11
	spawn_text = ""

/*	..................   Lesser Mole Spawner   ................... */
/obj/structure/idle_enemy/mole
/obj/structure/idle_enemy/mole/Initialize()
	. = ..()
	AddComponent(/datum/component/spawner/mole)
/datum/component/spawner/mole
	mob_types = list(/mob/living/simple_animal/hostile/retaliate/rogue/mole)
	spawn_time = 0
	spawn_delay = 0
	max_mobs = 1
	range = 11
	spawn_text = ""

/*	..................   Weak Skelly Spawner   ................... */
/obj/structure/idle_enemy/weak_skelly
/obj/structure/idle_enemy/weak_skelly/Initialize()
	. = ..()
	AddComponent(/datum/component/spawner/weak_skelly)
/datum/component/spawner/weak_skelly
	mob_types = list(/mob/living/carbon/human/species/skeleton/npc/catacomb)
	spawn_time = 0
	spawn_delay = 0
	max_mobs = 1
	range = 11
	spawn_text = ""

/*	..................   Lamia Spawner   ................... */
/obj/structure/idle_enemy/lamia
/obj/structure/idle_enemy/lamia/Initialize()
	. = ..()
	AddComponent(/datum/component/spawner/lamia)
/datum/component/spawner/lamia
	mob_types = list(/mob/living/simple_animal/hostile/retaliate/rogue/lamia)
	spawn_time = 0
	spawn_delay = 0
	max_mobs = 1
	range = 10
	spawn_text = ""

/*	..................   Headless Spawner   ................... */
/obj/structure/idle_enemy/headless
/obj/structure/idle_enemy/headless/Initialize()
	. = ..()
	AddComponent(/datum/component/spawner/headless)
/datum/component/spawner/headless
	mob_types = list(/mob/living/simple_animal/hostile/retaliate/rogue/headless)
	spawn_time = 0
	spawn_delay = 0
	max_mobs = 1
	range = 10
	spawn_text = ""




// ===================================================================================

/area/rogue/under/town/caverogue/saltmine
	name = "salt mine"
	first_time_text = "Salt Mine"

/area/rogue/under/catacombs
	name = "catacombs"
	icon_state = "cavewet"
	first_time_text = "The Catacombs"
	ambientsounds = AMB_CAVEWATER
	ambientnight = AMB_CAVEWATER
	spookysounds = SPOOKY_CAVE
	spookynight = SPOOKY_CAVE
	droning_sound = 'sound/music/area/caves.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = list(
				/turf/open/water/swamp)
	ambush_mobs = list(
				/mob/living/carbon/human/species/skeleton/npc/catacomb = 30,
				/mob/living/simple_animal/hostile/retaliate/rogue/bigrat = 10)
	converted_type = /area/rogue/outdoors/caves

/area/rogue/under/catacombs/dwarfoutpost
	name = "catacombs"
	first_time_text = "Underrock Outpost"
	ambush_types = list(
				/turf/open/water/swamp)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/lamia = 30,
				/mob/living/simple_animal/hostile/retaliate/rogue/headless = 20)

/area/rogue/under/cave/abandoned_mine
	name = "abandoned mine"
	first_time_text = "Abandoned Mine"
	ambush_types = list(
				/turf/open/floor/rogue/dirt)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/bigrat = 30,
				/mob/living/carbon/human/species/goblin/npc/ambush/cave = 20)

// ===================================================================================


/*	..................   Catacomb Skelly (weak)   ................... */
/mob/living/carbon/human/species/skeleton/npc/catacomb/after_creation()
	..()
	equipOutfit(new /datum/outfit/job/roguetown/species/skeleton/npc/catacomb)

/datum/outfit/job/roguetown/species/skeleton/npc/catacomb/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = 8
	H.STASPD = 7
	H.STACON = 10
	H.STAEND = 10
	var/loadout = rand(1,3)

	if(prob(15))
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
	if(prob(15))
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant/l
	if(prob(15))
		shirt = /obj/item/clothing/suit/roguetown/shirt/rags

	if(prob(10))
		pants = /obj/item/clothing/under/roguetown/tights/vagrant
	if(prob(10))
		pants = /obj/item/clothing/under/roguetown/tights/vagrant/l
	if(prob(10))
		pants = /obj/item/clothing/under/roguetown/tights/sailor

	switch(loadout)
		if(1)
			r_hand = /obj/item/natural/stone
		if(2)
			r_hand = /obj/item/rogueweapon/knife/stone
		if(3)
			r_hand = /obj/item/rogueweapon/mace/woodclub

/*	..................   Hostile Bum   ................... */
/mob/living/carbon/human/species/human/northern/bum/ambush/Initialize()
	. = ..()
	name = pick("Madman", "Creep", "Lunatic", "Leper")


// ===================================================================================
/obj/structure/mineral_door/wood/red/i
	name = "Room I"
	lockid = "roomi"
	locked = TRUE
/obj/structure/mineral_door/wood/red/ii	// the cheap shitty room that starts unlocked and might have a nasty surprise
	name = "Room II"
	desc = "The lock is a bit loose on this door."
	lockid = "roomii"
/obj/structure/mineral_door/wood/red/iii
	name = "Room III"
	lockid = "roomiii"
	locked = TRUE
/obj/structure/mineral_door/wood/red/iv
	name = "Room IV"
	lockid = "roomiv"
	locked = TRUE
/obj/structure/mineral_door/wood/red/v
	name = "Room V"
	lockid = "roomv"
	locked = TRUE
/obj/structure/mineral_door/wood/red/vi
	name = "Room VI"
	lockid = "roomvi"
	locked = TRUE
/obj/structure/mineral_door/wood/green/merc
	name = "Mercenary Lodgings"
	lockid = "mercenary"
	locked = TRUE
/obj/structure/mineral_door/wood/violet/roomhunt
	name = "Room HUNT"
	lockid = "roomhunt"
	locked = TRUE
/obj/structure/mineral_door/wood/violet/roomroyal
	name = "Room ROYAL"
	lockid = "roomroyal"
	locked = TRUE

/*	..................   Hauntz randomizer   ................... */
/obj/effect/spawner/roguemap/hauntz_random
	icon = 'icons/mob/actions/roguespells.dmi'
	icon_state = "raiseskele"
	alpha = 150
	probby = 50
	spawned = list(	/obj/effect/landmark/events/haunts = 100	)

/*	..................   Dungeon stuff   ................... */
/obj/structure/fluff/statue/xylix
	desc = "Some mad God no doubt."
	icon = 'icons/roguetown/misc/ay.dmi'
	icon_state = "xylix_smile"
	pixel_x = -32
	pixel_y = -16

/obj/structure/fluff/statue/xylix/frown
	icon_state = "xylix_frown"

/turf/open/floor/rogue/sandstone
	icon_state = "sandstone"
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/grassland.wav'

/obj/effect/spawner/roguemap/xylixlabyrinth
	icon = 'icons/mob/actions/roguespells.dmi'
	icon_state = "raiseskele"
	alpha = 150
	probby = 50
	color = "#e44aff"
	spawned = list(
		/mob/living/simple_animal/hostile/retaliate/gaseousform/xylix = 30,
		/mob/living/simple_animal/hostile/rogue/demon/xylix = 10,
		/mob/living/simple_animal/hostile/rogue/haunt/xylix = 5,
		/obj/structure/kneestingers/xylix = 5,
		/obj/item/roguecoin/silver/pile/xylix = 5,
		)

/mob/living/simple_animal/hostile/rogue/demon/xylix
	name = "spectral daemon"
	color = "#c189cb"
	alpha = 200

/mob/living/simple_animal/hostile/rogue/demon/xylix/Initialize()
	switch(pick(1,2,3))
		if (1)
			maxHealth = 30
			health = 30
			melee_damage_lower = 3
			melee_damage_upper = 12
		if (2)
			maxHealth = 45
			health = 45
			melee_damage_lower = 6
			melee_damage_upper = 18
		if (3)
			maxHealth = 18
			health = 18
			melee_damage_lower = 9
			melee_damage_upper = 25
	return ..()

/mob/living/simple_animal/hostile/rogue/haunt/xylix
	name = "spectral daemon"
	color = "#c189cb"
	alpha = 200

/mob/living/simple_animal/hostile/rogue/haunt/xylix/Initialize()
	switch(pick(1,2,3))
		if (1)
			maxHealth = 40
			health = 40
			melee_damage_lower = 3
			melee_damage_upper = 9
		if (2)
			maxHealth = 35
			health = 35
			melee_damage_lower = 5
			melee_damage_upper = 14
		if (3)
			maxHealth = 28
			health = 28
			melee_damage_lower = 8
			melee_damage_upper = 19
	return ..()

/mob/living/simple_animal/hostile/retaliate/gaseousform/xylix
	name = "spectral daemon"
	faction = list("undead")
	color = "#c189cb"
	alpha = 200

/mob/living/simple_animal/hostile/retaliate/gaseousform/xylix/Initialize()
	switch(pick(1,2,3))
		if (1)
			maxHealth = 70
			health = 70
			melee_damage_lower = 2
			melee_damage_upper = 10
		if (2)
			maxHealth = 60
			health = 60
			melee_damage_lower = 3
			melee_damage_upper = 13
		if (3)
			maxHealth = 50
			health = 50
			melee_damage_lower = 4
			melee_damage_upper = 16
	return ..()


/obj/structure/kneestingers/xylix
	name = ""
	desc = ""
	icon = 'icons/roguetown/items/valuable.dmi'
	icon_state = "s5"

/obj/item/roguecoin/silver/pile/xylix/Initialize()
	. = ..()
	set_quantity(rand(6,9))

/obj/structure/trap/xylix
	name = ""
	desc = ""
	icon_state = ""

/obj/structure/trap/xylix/trap_effect(mob/living/L)
	to_chat(L, "<span class='danger'><B>With a crack, the hostile constructs come out of hiding, stunning you!</B></span>")
	L.electrocute_act(10, src, flags = SHOCK_NOGLOVES) // electrocute act does a message.
	L.Paralyze(20)
	new /mob/living/simple_animal/hostile/retaliate/gaseousform/xylix(loc)
	QDEL_IN(src, 30)


/obj/structure/trap/xylix_healing
	name = ""
	desc = ""
	icon_state = ""

/obj/structure/trap/xylix_healing/trap_effect(mob/living/L)
	to_chat(L, "<span class='danger'><B>Flowers sprouts beneath your feet!</B></span>")
	L.Paralyze(100)
	L.adjustBruteLoss(-10)
	switch(pick(1,2))
		if (1)
			new /obj/structure/flora/ausbushes/lavendergrass (drop_location())
		if (2)
			new /obj/structure/flora/ausbushes/brflowers (drop_location())

	QDEL_IN(src, 200)

/obj/structure/bars/passage/shutter/xy_a
	redstone_id = "xhutterA"
/obj/structure/bars/passage/shutter/open/xy_a
	redstone_id = "xhutterA"

/obj/structure/bars/passage/shutter/xy_b
	redstone_id = "xhutterB"
/obj/structure/bars/passage/shutter/open/xy_b
	redstone_id = "xhutterB"

/obj/structure/bars/passage/shutter/xylix_ab
	redstone_id = "xhutterAB"
/obj/structure/bars/passage/shutter/open/xy_ab
	redstone_id = "xhutterAB"

/obj/structure/lever/wall/xyla
	redstone_id = "xhutterA"
/obj/structure/lever/wall/xylb
	redstone_id = "xhutterB"
/obj/structure/lever/wall/xylab
	redstone_id = "xhutterAB"

/obj/structure/lever/wall/xylrand/Initialize()
	switch(pick(1,2))
		if (1)
			redstone_id = "xhutterA"
		if (2)
			redstone_id = "xhutterB"
	return ..()

/obj/effect/spawner/roguemap/xylixlabyrinth_frowny
	icon = 'icons/mob/actions/roguespells.dmi'
	icon_state = "tragedy"
	alpha = 150
	probby = 30
	spawned = list(	/obj/structure/trap/xylix_healing = 10, /obj/structure/trap/xylix = 10)

/obj/effect/spawner/roguemap/xylixlabyrinth_smiley
	icon = 'icons/mob/actions/roguespells.dmi'
	icon_state = "comedy"
	alpha = 150
	probby = 30
	spawned = list(	/obj/structure/trap/xylix_healing = 10, /obj/structure/trap/xylix = 10)

/obj/structure/fluff/walldeco/xylfrown
	icon_state = "wall_sad"
	pixel_y = 32

/obj/structure/fluff/walldeco/xylsmile
	icon_state = "wall_funny"
	pixel_y = 32

/obj/structure/kneestingers/xylix
	name = "fancy chest"
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "chestfancy_neu"

/obj/structure/closet/crate/chest/wicker/xyl/PopulateContents()
	switch(pick(1,2))
		if (1)
			new /obj/item/clothing/ring/gold/protection(src)
		if (2)
			new /obj/item/clothing/head/roguetown/jester(src)




/*	..................   Spider stuff   ................... */
/obj/structure/spider/stickyweb/solo
	icon_state = "stickyweb3"

/obj/structure/spider/stickyweb/Initialize()
	if(icon_state == "stickyweb1")
		if(prob(50))
			icon_state = "stickyweb2"
	dir = pick(GLOB.cardinals)
	alpha = rand(80,109)
	switch(pick(1,2))
		if (1)
			static_debris = FALSE
		if (2)
			static_debris = list(/obj/item/natural/silk = 1)
	. = ..()

/obj/structure/spider/cocoon/Initialize()
	switch(pick(1,2,3,4,5))
		if (1)
			static_debris = list(/obj/item/natural/silk = 3)
			icon_state = pick("cocoon1","cocoon2")
		if (2)
			static_debris = list(/obj/item/natural/silk = 2, /obj/effect/decal/remains/bigrat = 1)
			icon_state = pick("cocoon2","cocoon3")
		if (3)
			static_debris = list(/obj/item/natural/silk = 2, /obj/effect/decal/remains/human = 1)
			icon_state = pick("cocoon_large1","cocoon_large2","cocoon_large3")
		if (4)
			static_debris = list(/obj/item/natural/silk = 2, /obj/effect/decal/cleanable/blood/gibs = 1)
			icon_state = pick("cocoon1","cocoon2","cocoon3")
		if (5)
			static_debris = list(/obj/item/natural/silk = 2, /obj/item/natural/stone = 1)
			icon_state = pick("cocoon1","cocoon2")
	. = ..()



/*	..................   Various mapping aides   ................... */

/obj/structure/roguethrone/statues
	icon = 'modular/Mapping/icons/96x96.dmi'

/obj/machinery/light/rogue/wallfire/big_fireplace
	icon_state = "fireplace1"
	base_state = "fireplace"
	icon = 'icons/roguetown/misc/fireplace64.dmi'

/obj/machinery/light/rogue/hearth/big_fireplace
	name = "fireplace"
	icon_state = "fireplace1"
	base_state = "fireplace"
	icon = 'icons/roguetown/misc/fireplace64.dmi'
	fueluse = -1
	pixel_x = -16
	climb_offset = 4

/*	..................   Colony Spider Net   ................... */
/obj/structure/innocent_net
	name = ""
	desc = ""
	icon = 'icons/roguetown/misc/tallstructure.dmi'
	icon_state = "innocentweb1"
	layer = ABOVE_ALL_MOB_LAYER
	density = FALSE
	max_integrity = 35
	climbable = FALSE
	dir = SOUTH
	debris = list(/obj/item/natural/silk = 1)
	var/lucky_escape

/obj/structure/innocent_net/Initialize()
	. = ..()
	icon_state = "innocentweb[rand(1,2)]"
	return ..()

/obj/structure/innocent_net/attack_hand()
	playsound(src, pick('sound/misc/jumpscare (1).ogg','sound/misc/jumpscare (2).ogg','sound/misc/jumpscare (3).ogg','sound/misc/jumpscare (4).ogg'), 100)
	new /mob/living/simple_animal/hostile/retaliate/rogue/spider/colony (get_turf(src))
	qdel(src)

/obj/structure/innocent_net/attackby(obj/item, /mob/user, params)
	playsound(src, pick('sound/misc/jumpscare (1).ogg','sound/misc/jumpscare (2).ogg','sound/misc/jumpscare (3).ogg','sound/misc/jumpscare (4).ogg'), 100)
	new /mob/living/simple_animal/hostile/retaliate/rogue/spider/colony (get_turf(src))
	qdel(src)

/obj/structure/innocent_net/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	playsound(src, pick('sound/misc/jumpscare (1).ogg','sound/misc/jumpscare (2).ogg','sound/misc/jumpscare (3).ogg','sound/misc/jumpscare (4).ogg'), 100)
	new /mob/living/simple_animal/hostile/retaliate/rogue/spider/colony (get_turf(src))
	qdel(src)

/obj/structure/innocent_net/Crossed(atom/movable/AM)
	..()
	if(isliving(AM))
		var/mob/living/carbon/human/L = AM
		lucky_escape = ( L.STALUC * 4 )
		L.Immobilize(5)
		if(L.m_intent == MOVE_INTENT_WALK)
			L.Immobilize(10)
			if(prob(lucky_escape))
				to_chat(L, "<span class='warning'>The flimsy web breaks.</span>")
				qdel(src)
			else
				playsound(src, pick('sound/misc/jumpscare (1).ogg','sound/misc/jumpscare (2).ogg','sound/misc/jumpscare (3).ogg','sound/misc/jumpscare (4).ogg'), 120)
				new /mob/living/simple_animal/hostile/retaliate/rogue/spider/colony (get_turf(src))
				qdel(src)
		if(L.m_intent == MOVE_INTENT_RUN)
			to_chat(L, "<span class='warning'>I'm stuck in the web!</span>")
			L.Immobilize(20)
			if(prob(lucky_escape))
				to_chat(L, "<span class='warning'>The flimsy web breaks.</span>")
				qdel(src)
			else
				playsound(src, pick('sound/misc/jumpscare (1).ogg','sound/misc/jumpscare (2).ogg','sound/misc/jumpscare (3).ogg','sound/misc/jumpscare (4).ogg'), 120)
				new /mob/living/simple_animal/hostile/retaliate/rogue/spider/colony (get_turf(src))
				qdel(src)
		else
			to_chat(L, "<span class='warning'>I'm stuck in the web!</span>")
			L.Immobilize(5)
			if(prob(lucky_escape))
				to_chat(L, "<span class='warning'>The flimsy web breaks.</span>")
				qdel(src)
			else
				playsound(src, pick('sound/misc/jumpscare (1).ogg','sound/misc/jumpscare (2).ogg','sound/misc/jumpscare (3).ogg','sound/misc/jumpscare (4).ogg'), 120)
				new /mob/living/simple_animal/hostile/retaliate/rogue/spider/colony (get_turf(src))
				qdel(src)


/*	..................   Wizard Shenanigans   ................... */

/obj/structure/circle_protection
	name = "circle of protection"
	icon = 'modular/Mapping/icons/96x96.dmi'
	icon_state = "circle"
	alpha = 180
	pixel_y = -32
	pixel_x = -32
	var/wall_type = /obj/effect/forcefield/wizard
	var/depleted
/obj/structure/circle_protection/attack_hand(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	if(depleted)
		to_chat(user, "<span class='notice'>The salt circle has been damaged...</span>")
		return
	if(H.virginity)
		playsound(get_turf(user), 'sound/magic/timestop.ogg', 100, TRUE, -1)
		new wall_type(get_step(src, EAST),user)
		new wall_type(get_step(src, WEST),user)
		new wall_type(get_step(src, NORTH),user)
		new wall_type(get_step(src, SOUTH),user)

		new wall_type(get_step(src, NORTHEAST),user)
		new wall_type(get_step(src, NORTHWEST),user)
		new wall_type(get_step(src, SOUTHEAST),user)
		new wall_type(get_step(src, SOUTHWEST),user)

		depleted = TRUE
		alpha = 90
	else
		to_chat(user, "<span class='notice'>The magick forces are beyond your control.</span>")
/obj/structure/circle_protection/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/reagent_containers/powder/salt))
		to_chat(user, "<span class='notice'>Restoring the salt lines...</span>")
		if(do_after(user,10 SECONDS, target = src))
			depleted = FALSE
			alpha = 180
			qdel(I)
	else
		return ..()


/*	..................   NOC Device (Fixed scrying ball)   ................... */
/obj/structure/nocdevice
	name = "NOC Device"
	desc = "A intricate lunar observation machine, that allows its user to study the face of Noc in the sky, reflecting he true whereabouts of hidden beings.."
	icon = 'modular/Mapping/icons/96x96.dmi'
	icon_state = "nocdevice"
	plane = -1
	layer = 4.2
	var/mob/current_owner
	var/last_scry
/obj/structure/nocdevice/attack_hand(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	if(H.virginity)
		if(world.time < last_scry + 30 SECONDS)
			to_chat(user, "<span class='warning'>I peer into the sky but cannot focus the lens on the face of Noc. Maybe I should wait.</span>")
			return
		var/input = stripped_input(user, "Who are you looking for?", "Scrying Orb")
		if(!input)
			return
		if(!user.key)
			return
		if(world.time < last_scry + 30 SECONDS)
			to_chat(user, "<span class='warning'>I peer into the sky but cannot focus the lens on the face of Noc. Maybe I should wait.</span>")
			return
		if(!user.mind || !user.mind.do_i_know(name=input))
			to_chat(user, "<span class='warning'>I don't know anyone by that name.</span>")
			return
		for(var/mob/living/carbon/human/HL in GLOB.human_list)
			if(HL.real_name == input)
				var/turf/T = get_turf(HL)
				if(!T)
					continue
				var/mob/dead/observer/screye/S = user.scry_ghost()
				if(!S)
					return
				S.ManualFollow(HL)
				last_scry = world.time
				user.visible_message("<span class='danger'>[user] stares into [src], [p_their()] squinting and concentrating...</span>")
				addtimer(CALLBACK(S, TYPE_PROC_REF(/mob/dead/observer, reenter_corpse)), 8 SECONDS)
				if(!HL.stat)
					if(HL.STAPER >= 15)
						if(HL.mind)
							if(HL.mind.do_i_know(name=user.real_name))
								to_chat(HL, "<span class='warning'>I can clearly see the face of [user.real_name] staring at me!.</span>")
								return
						to_chat(HL, "<span class='warning'>I can clearly see the face of an unknown [user.gender == FEMALE ? "woman" : "man"] staring at me!</span>")
						return
					if(HL.STAPER >= 11)
						to_chat(HL, "<span class='warning'>I feel a pair of unknown eyes on me.</span>")
				return
		to_chat(user, "<span class='warning'>I peer into the viewpiece, but Noc does not reveal where [input] is.</span>")
		return
	else
		to_chat(user, "<span class='notice'>Noc looks angry with me...</span>")


/*	..................   Floor decoration   ................... */
/obj/structure/giantfur
	name = "giant fur"
	desc = "Pelt of some gigantic animal, made into a mat."
	icon = 'modular/Mapping/icons/96x96.dmi'
	icon_state = "fur"
	density = FALSE
	anchored = TRUE

/obj/structure/giantfur/small // the irony
	name = "fur pelt"
	desc = "Pelt of a young animal, made into a mat."
	icon_state = "fur_alt"

/turf/open/water/bath/pool
	desc = "Clear water, pleasant temperature. Soothing."
	icon_state = "bathtile_pool"
/turf/open/water/bath/pool/Initialize()
	.  = ..()
	icon_state = "bathtile_pool"

/turf/open/water/bath/pool/mid
	icon_state = "bathtile_pool_mid"
/turf/open/water/bath/pool/mid/Initialize()
	.  = ..()
	icon_state = "bathtile_pool_mid"


/obj/effect/decal/shadow_floor
	name = ""
	desc = ""
	icon = 'icons/roguetown/misc/decoration.dmi'
	icon_state = "shadow_floor"
	mouse_opacity = 0

/obj/effect/decal/shadow_floor/corner
	icon_state = "shad_floorcorn"



/obj/structure/fluff/shipssprote
	name = ""
	desc = ""
	icon = 'icons/obj/atmospherics/pipes/disposal.dmi'
	icon_state = "pipe"
	mouse_opacity = 0
	color = "#5a4621"
	pixel_y = -16

/*	..................   Innocent Bush   ................... */
/obj/structure/innocent_bush
	name = "bush"
	desc = "These large bushes are known to be well-liked by silkworms who make their nests in their dark depths."
	icon = 'icons/roguetown/mob/monster/Trolls.dmi'
	icon_state = "Trolls"
	pixel_x = -16
	layer = ABOVE_ALL_MOB_LAYER
	max_integrity = 500
	density = TRUE

/obj/structure/innocent_bush/attack_hand(mob/living/carbon/human/user)
//	playsound(src.loc, "plantcross", 80, FALSE, -1)
//	user.visible_message(span_noticesmall("[user] searches through [src]."))
//	shake_camera(user, 2, 2)
	playsound(src, pick('sound/misc/jumpscare (1).ogg','sound/misc/jumpscare (2).ogg','sound/misc/jumpscare (3).ogg','sound/misc/jumpscare (4).ogg'), 100)
	new /mob/living/simple_animal/hostile/retaliate/rogue/trollbog (get_turf(src))
	qdel(src)

/obj/structure/innocent_bush/attackby(obj/item, /mob/living/user, params)
//	playsound(src.loc, "plantcross", 80, FALSE, -1)
	playsound(src, pick('sound/misc/jumpscare (1).ogg','sound/misc/jumpscare (2).ogg','sound/misc/jumpscare (3).ogg','sound/misc/jumpscare (4).ogg'), 100)
//	shake_camera(user, 2, 2)
	new /mob/living/simple_animal/hostile/retaliate/rogue/trollbog (get_turf(src))
	qdel(src)

/obj/structure/innocent_bush/Bumped(atom/movable/AM)
	playsound(src.loc, "plantcross", 80, FALSE, -1)
	playsound(src, pick('sound/misc/jumpscare (1).ogg','sound/misc/jumpscare (2).ogg','sound/misc/jumpscare (3).ogg','sound/misc/jumpscare (4).ogg'), 100)
	new /mob/living/simple_animal/hostile/retaliate/rogue/trollbog (get_turf(src))
	qdel(src)

/obj/structure/innocent_bush/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	playsound(src.loc, "plantcross", 80, FALSE, -1)
	sleep(4)
	playsound(src, pick('sound/misc/jumpscare (1).ogg','sound/misc/jumpscare (2).ogg','sound/misc/jumpscare (3).ogg','sound/misc/jumpscare (4).ogg'), 100)
	new /mob/living/simple_animal/hostile/retaliate/rogue/trollbog (get_turf(src))
	qdel(src)



/obj/machinery/light/rogue/wallfire/candle/lamp // cant get them to start unlit but they work as is
	name = "candle lamp"
	icon_state = "candle"
	base_state = "candle"
	layer = WALL_OBJ_LAYER+0.1
	light_power = 0.9
	light_outer_range =  6


/*	..................   Misc   ................... */
/obj/item/roguebin/alt
	icon_state = "washbin2"

/obj/structure/mirror/alt
	icon_state = "mirror_alt"

/obj/item/roguestatue/silver/gnome
	name = "petrified gnome"
	desc = "A literal gnome, turned to stone mid-step and put on a matching stone platform. Rather unsettling."
	smeltresult = null
	color = "#617163"


/*	..................   Areas to play with the music a bit   ................... */
/area/rogue/indoors/town/bath/redhouse // lets try something different
	droning_sound = 'modular/Mapping/sound/Fulminate.ogg'
	converted_type = /area/rogue/outdoors/exposed/bath/redhouse

/area/rogue/outdoors/exposed/bath/redhouse
	droning_sound = 'modular/Mapping/sound/Fulminate.ogg'

/area/rogue/indoors/town/tavern/saiga
	droning_sound = 'modular/Mapping/sound/Folia1490.ogg'
	droning_sound_night = 'modular/Mapping/sound/LeTourdion.ogg'
	converted_type = /area/rogue/outdoors/exposed/tavern/saiga

/area/rogue/outdoors/exposed/tavern/saiga
	droning_sound = 'modular/Mapping/sound/Folia1490.ogg'
	droning_sound_night = 'modular/Mapping/sound/LeTourdion.ogg'


/*	..................   Traveltiles   ................... */ // these are the ones on centcom, where the actual lair is, to reduce varedits onmap
/obj/structure/fluff/traveltile/exit_bandit		// mus NOT be a traveltile/bandit child, because that one has a check for banditcamp trait. People should always be able to leave the camp.
	aportalid = "banditin"
	aportalgoesto = "banditexit"

/obj/structure/fluff/traveltile/exit_vampire	// mus NOT be a traveltile/vampire child, because that one has a check for banditcamp trait. People should always be able to leave the camp.
	aportalid = "vampin"
	aportalgoesto = "vampexit"

/obj/structure/fluff/traveltile/exit_inhumen
	aportalid = "inhumenin"
	aportalgoesto = "inhumenexit"


/obj/structure/fluff/traveltile/to_inhumen_tribe
	name = "to the Deep Bog"
	aportalid = "inhumenexit"
	aportalgoesto = "inhumenin"



/obj/effect/decal/remains/human/old
	name = "remains"
	color = "#d6b3a5"




/*	..................   Toll randomizer (poor mans coin generator, cheaper workload is all)  ................... */
/obj/effect/spawner/roguemap/tollrandom
	icon = 'icons/roguetown/underworld/enigma_husks.dmi'
	icon_state = "soultoken_floor"
	probby = 35
	color = "#ff0000"
	spawned = list(
		/obj/item/underworld/coin = 1,
		)


// ====================		NEW WEAPONS		==========================
/obj/item/rogueweapon/sword/scimitar/falx
	name = "falx"
	desc = "Ancient curved blade for chopping and little else."
	icon = 'icons/roguetown/weapons/custom.dmi'
	icon_state = "falx"
	max_blade_int = 200
	max_integrity = INTEGRITY_STANDARD


/obj/item/rogueweapon/sword/scimitar/messer/neu
	icon = 'icons/roguetown/weapons/custom.dmi'
/obj/item/rogueweapon/sword/scimitar/messer/neu/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.5,"sx" = -10,"sy" = -8,"nx" = 11,"ny" = -8,"wx" = -7,"wy" = -6,"ex" = 6,"ey" = -7,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 90,"sturn" = -80,"wturn" = -60,"eturn" = 71,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 3,"sy" = 3,"nx" = -1,"ny" = 4,"wx" = -7,"wy" = 3,"ex" = 7,"ey" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 10,"wturn" = 0,"eturn" = 15,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.5,"sx" = -4,"sy" = -6,"nx" = 5,"ny" = -6,"wx" = 0,"wy" = -6,"ex" = -1,"ey" = -6,"nturn" = 100,"sturn" = 156,"wturn" = 90,"eturn" = 180,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/rogueweapon/pick/paxe/neu
	icon = 'icons/roguetown/weapons/custom.dmi'
/obj/item/rogueweapon/pick/paxe/neu/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.7,"sx" = -9,"sy" = 0,"nx" = 12,"ny" = 1,"wx" = -6,"wy" = 0,"ex" = 5,"ey" = -1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.4,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/rogueweapon/polearm/halberd/bardiche/woodcutter/neu
	icon = 'icons/roguetown/weapons/custom_64.dmi'
	slot_flags = FALSE
/obj/item/rogueweapon/polearm/halberd/bardiche/woodcutter/neu/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -6,"sy" = 0,"nx" = 7,"ny" = 2,"wx" = -2,"wy" = 0,"ex" = 1,"ey" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 30,"eturn" = -30,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -3,"nx" = -4,"ny" = -2,"wx" = -3,"wy" = -2,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/rogueweapon/polearm/woodstaff/aries/neu
	icon = 'icons/roguetown/weapons/custom_64.dmi'
	slot_flags = FALSE
	dropshrink = 0.9
/obj/item/rogueweapon/polearm/woodstaff/aries/neu/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -6,"sy" = -1,"nx" = 8,"ny" = 0,"wx" = -4,"wy" = 0,"ex" = 2,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 32,"eturn" = -23,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 4,"sy" = -3,"nx" = -3,"ny" = -2,"wx" = -3,"wy" = -1,"ex" = 3,"ey" = -3,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/obj/item/rogueweapon/mace/goden/neu
	icon = 'icons/roguetown/weapons/custom_64.dmi'
	slot_flags = FALSE
/obj/item/rogueweapon/mace/goden/neu/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -6,"sy" = 1,"nx" = 7,"ny" = 3,"wx" = -2,"wy" = 1,"ex" = 1,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -28,"sturn" = 27,"wturn" = 30,"eturn" = -20,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -3,"nx" = -5,"ny" = -2,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/obj/item/rogueweapon/polearm/halberd/neu
	icon = 'icons/roguetown/weapons/custom_64.dmi'
	slot_flags = FALSE
/obj/item/rogueweapon/polearm/halberd/neu/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -7,"sy" = 2,"nx" = 7,"ny" = 3,"wx" = -2,"wy" = 1,"ex" = 1,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 30,"eturn" = -30,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -3,"nx" = -5,"ny" = -2,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/rogueweapon/polearm/spear/billhook/neu
	icon = 'icons/roguetown/weapons/custom_64.dmi'
	slot_flags = FALSE
	dropshrink = 0.9
/obj/item/rogueweapon/polearm/spear/billhook/neu/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -7,"sy" = 4,"nx" = 7,"ny" = 5,"wx" = -2,"wy" = 3,"ex" = 1,"ey" = 3,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 30,"eturn" = -30,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -3,"nx" = -5,"ny" = -2,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)

/obj/item/rogueweapon/polearm/woodstaff/neu
	icon = 'icons/roguetown/weapons/custom_64.dmi'
	slot_flags = FALSE
	dropshrink = 0.9



