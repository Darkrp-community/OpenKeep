// ======================================================================

/*	..................   Pigflowers   ................... */
/obj/structure/flora/rogueflower // ausbushes recolored
	name = "flowers"
	icon = 'icons/roguetown/misc/pigflora.dmi'
	icon_state = "reedbush_1"

/obj/structure/flora/rogueflower/reedbush
	icon_state = "reedbush_1"

/obj/structure/flora/rogueflower/reedbush/Initialize()
	icon_state = "reedbush_[rand(1, 4)]"
	. = ..()

/obj/structure/flora/rogueflower/lavendergrass
	icon_state = "lavendergrass_1"

/obj/structure/flora/rogueflower/lavendergrass/Initialize()
	icon_state = "lavendergrass_[rand(1, 4)]"
	. = ..()

/obj/structure/flora/rogueflower/ywflowers
	icon_state = "ywflowers_1"

/obj/structure/flora/rogueflower/ywflowers/Initialize()
	icon_state = "ywflowers_[rand(1, 3)]"
	. = ..()

/obj/structure/flora/rogueflower/brflowers
	icon_state = "brflowers_1"

/obj/structure/flora/rogueflower/brflowers/Initialize()
	icon_state = "brflowers_[rand(1, 3)]"
	. = ..()

/obj/structure/flora/rogueflower/ppflowers
	icon_state = "ppflowers_1"

/obj/structure/flora/rogueflower/ppflowers/Initialize()
	icon_state = "ppflowers_[rand(1, 3)]"
	. = ..()

/obj/structure/flora/roguegrass/stalky
	name = ""
	desc = ""
	icon = 'icons/roguetown/misc/pigflora.dmi'
	icon_state = "stalkygrass"
	opacity = FALSE

/obj/structure/flora/roguegrass/stalky/update_icon()
	dir = pick(GLOB.cardinals)


// ===================================================================================
/*	..................   Dwarf Outpost   ................... */
/obj/effect/landmark/map_load_mark/dwarf_outpost
	name = "Dwarf Outpost"
	templates = list( "Dwarf_Outpost_1","Dwarf_Outpost_2" )

/datum/map_template/dwarf_outpost_i
	name = "Dwarf Outpost Orc"
	id = "Dwarf_Outpost_1"
	mappath = "_maps/map_files/templates/dwarf_outpost/Dwarf_Outpost_1.dmm"

/datum/map_template/dwarf_outpost_ii
	name = "Dwarf Outpost Beastmen"
	id = "Dwarf_Outpost_2"
	mappath = "_maps/map_files/templates/dwarf_outpost/Dwarf_Outpost_1.dmm"


/*	..................   Roadblock   ................... */
/obj/effect/landmark/map_load_mark/hamlet_roadblock
	name = "Roadblock"
	templates = list( "roadblock_1","roadblock_2" )

/datum/map_template/roadblock_i
	name = "Roadblock"
	id = "roadblock_1"
	mappath = "_maps/map_files/templates/stonehamlet/roadblock_1.dmm"

/datum/map_template/roadblock_ii
	name = "No roadblock"
	id = "roadblock_2"
	mappath = "_maps/map_files/templates/stonehamlet/roadblock_2.dmm"

/*	..................   Outlaw camp   ................... */
/obj/effect/landmark/map_load_mark/hamlet_outlaws
	name = "Outlaw camp"
	templates = list( "outlawcamp_1","outlawcamp_2" )

/datum/map_template/outlawcamp_i
	name = "Outlaw camp"
	id = "outlawcamp_1"
	mappath = "_maps/map_files/templates/stonehamlet/outlawcamp_1.dmm"

/datum/map_template/outlawcamp_ii
	name = "Empty outlaw camp"
	id = "outlawcamp_2"
	mappath = "_maps/map_files/templates/stonehamlet/outlawcamp_2.dmm"

// ===================================================================================
/*
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
*/

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



// ==============================================================
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


// ======================================================================
/*	..................   Colony Spider Web   ................... */
/obj/structure/innocent_web
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

/obj/structure/innocent_web/Initialize()
	. = ..()
	icon_state = "innocentweb[rand(1,2)]"
	return ..()

/obj/structure/innocent_web/attack_hand()
	playsound(src, pick('sound/misc/jumpscare (1).ogg','sound/misc/jumpscare (2).ogg','sound/misc/jumpscare (3).ogg','sound/misc/jumpscare (4).ogg'), 100)
	new /mob/living/simple_animal/hostile/retaliate/rogue/spider/colony (get_turf(src))
	qdel(src)

/obj/structure/innocent_web/attackby(obj/item, /mob/user, params)
	playsound(src, pick('sound/misc/jumpscare (1).ogg','sound/misc/jumpscare (2).ogg','sound/misc/jumpscare (3).ogg','sound/misc/jumpscare (4).ogg'), 100)
	new /mob/living/simple_animal/hostile/retaliate/rogue/spider/colony (get_turf(src))
	qdel(src)

/obj/structure/innocent_web/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	playsound(src, pick('sound/misc/jumpscare (1).ogg','sound/misc/jumpscare (2).ogg','sound/misc/jumpscare (3).ogg','sound/misc/jumpscare (4).ogg'), 100)
	new /mob/living/simple_animal/hostile/retaliate/rogue/spider/colony (get_turf(src))
	qdel(src)

/obj/structure/innocent_web/Crossed(atom/movable/AM)
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

/obj/effect/decal/miasma
	name = ""
	desc = ""
	icon = 'icons/roguetown/mob/rotten.dmi'
	icon_state = "deadite"
	mouse_opacity = 0

/obj/effect/decal/remains/human/old
	name = "remains"
	color = "#d6b3a5"

/obj/effect/decal/remains/human/old/small
	icon_state = "remainslarva"


/obj/structure/fluff/shipssprote
	name = ""
	desc = ""
	icon = 'icons/obj/atmospherics/pipes/disposal.dmi'
	icon_state = "pipe"
	mouse_opacity = 0
	color = "#5a4621"
	pixel_y = -16


// ======================================================================
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



/*	..................   Misc   ................... */
/obj/item/roguestatue/silver/gnome
	name = "petrified gnome"
	desc = "A literal gnome, turned to stone mid-step and put on a matching stone platform. Rather unsettling."
	smeltresult = null
	color = "#617163"


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




/mob/living/simple_animal/hostile/retaliate/rogue/spider/colony // colony spider
	name = "hairy spider"
	desc = "The forest canopies hides more than leaves...These creachers make honey from flowers and spin silk from their abdomen, when not consuming prey."
	icon_state = "spider"
	icon_living = "spider"
	icon_dead = "spider-dead"
	botched_butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/spider = 1,
							/obj/item/natural/silk = 1)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/spider = 2,
							/obj/item/reagent_containers/food/snacks/rogue/honey = 1,
							/obj/item/natural/silk = 2)
	perfect_butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/spider = 2,
							/obj/item/reagent_containers/food/snacks/rogue/honey = 2,
							/obj/item/natural/silk = 3)


// ==============================================================
/*	..................   Various mapping aides   ................... */
/obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/broken
	desc = "A long shirt of maille, this one is made for a short man it seems."
/obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/broken/Initialize()
	. = ..()
	obj_break()

/obj/item/clothing/suit/roguetown/armor/chainmail/battered
	desc = "A good quality haubergon, but weakened by many blows."
	max_integrity = INTEGRITY_STANDARD

/obj/structure/roguethrone/statues
	icon = 'modular/Mapping/icons/96x96.dmi'

/*	..................   For premapped blood skipping timers, diseases etc   ................... */
/obj/effect/decal/cleanable/blood_neu
	name = "blood"
	desc = ""
	icon = 'icons/effects/blood.dmi'
	icon_state = "floor1"
	alpha = 200
	nomouseover = TRUE
	nomouseover = TRUE
	var/wash_precent = 0
	COOLDOWN_DECLARE(wash_cooldown)

/obj/effect/decal/cleanable/blood_neu/weather_act_on(weather_trait, severity)
	if(weather_trait != PARTICLEWEATHER_RAIN || !COOLDOWN_FINISHED(src, wash_cooldown))
		return
	wash_precent += min(10, severity / 4)
	alpha = 255 *((100 - wash_precent) * 0.01)
	if(wash_precent >= 100)
		qdel(src)
	COOLDOWN_START(src, wash_cooldown, 15 SECONDS)

/obj/effect/decal/cleanable/blood_neu/Initialize(mapload)
	. = ..()
	if(. == INITIALIZE_HINT_QDEL)
		return .
	pixel_x = rand(-5,5)
	pixel_y = rand(5,5)
	GLOB.weather_act_upon_list += src

/obj/effect/decal/cleanable/blood_neu/Destroy()
	GLOB.weather_act_upon_list -= src
	return ..()

/obj/effect/decal/cleanable/blood_neu/random/Initialize(mapload)
	. = ..()
	icon_state = pick("floor1", "floor2", "floor3", "floor4", "floor5", "floor6", "splatter1", "splatter2", "splatter3", "splatter4", "splatter5", "splatter6", "gibl1", "gibl2", "gibl3", "gibl4", "gibl5")

/obj/effect/decal/cleanable/blood_neu/tracks
	icon_state = "tracks"

