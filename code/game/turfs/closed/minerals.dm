/**********************Mineral deposits**************************/

/turf/closed/mineral //wall piece
	name = "rock"
	icon = 'icons/turf/mining.dmi'
	icon_state = "rock"
	var/smooth_icon = 'icons/turf/smoothrocks.dmi'
	smooth = SMOOTH_MORE|SMOOTH_BORDER
	canSmoothWith = null
	baseturfs = list(/turf/open/floor/rogue/naturalstone)
	opacity = 1
	density = TRUE
//	layer = EDGED_TURF_LAYER
	temperature = TCMB
	var/environment_type = "asteroid"
	var/turf/open/floor/turf_type = /turf/open/floor
	var/obj/item/mineralType = null
	var/obj/item/natural/rock/rockType = null
	var/mineralAmt = 3
	var/spread = 0 //will the seam spread?
	var/spreadChance = 0 //the percentual chance of an ore spreading to the neighbouring tiles
	var/last_act = 0
	var/scan_state = "" //Holder for the image we display when we're pinged by a mining scanner
	var/defer_change = 0
	blade_dulling = DULLING_PICK
	max_integrity = 1000
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onrock/onrock (1).ogg', 'sound/combat/hits/onrock/onrock (2).ogg', 'sound/combat/hits/onrock/onrock (3).ogg', 'sound/combat/hits/onrock/onrock (4).ogg')
	neighborlay = "dirtedge"

/turf/closed/mineral/Initialize()
	if (!canSmoothWith)
		canSmoothWith = list(/turf/closed/mineral, /turf/closed/indestructible)
//	var/matrix/M = new
//	M.Translate(-4, -4)
//	transform = M
	icon = smooth_icon
	. = ..()

/turf/closed/mineral/LateInitialize()
	. = ..()
	if (mineralType && mineralAmt && spread && spreadChance)
		for(var/dir in GLOB.cardinals)
			if(prob(spreadChance))
				var/turf/T = get_step(src, dir)
				if(istype(T, /turf/closed/mineral/random))
					Spread(T)
	var/turf/open/transparent/openspace/target = get_step_multiz(src, UP)
	if(istype(target))
		target.ChangeTurf(/turf/open/floor/rogue/naturalstone)

/turf/closed/mineral/get_smooth_underlay_icon(mutable_appearance/underlay_appearance, turf/asking_turf, adjacency_dir)
	if(turf_type)
		underlay_appearance.icon = initial(turf_type.icon)
		underlay_appearance.icon_state = initial(turf_type.icon_state)
		return TRUE
	return ..()


/turf/closed/mineral/attackby(obj/item/I, mob/user, params)
	if (!user.IsAdvancedToolUser())
		to_chat(usr, "<span class='warning'>I don't have the dexterity to do this!</span>")
		return
	var/olddam = turf_integrity
	..()
	if(turf_integrity && turf_integrity > 10)
		if(turf_integrity < olddam)
			if(prob(50))
				if(user.Adjacent(src))
					var/obj/item/natural/stone/S = new(src)
					S.forceMove(get_turf(user))

/turf/closed/mineral/turf_destruction(damage_flag)
	gets_drilled(give_exp = FALSE)
	queue_smooth_neighbors(src)
	..()

/turf/closed/mineral/proc/gets_drilled(user, triggered_by_explosion = FALSE, give_exp = TRUE)
	new /obj/item/natural/stone(src)
	if(prob(30))
		new /obj/item/natural/stone(src)
	if (mineralType && (mineralAmt > 0))
		if(prob(33)) //chance to spawn ore directly
			new mineralType(src)
		if(rockType) //always spawn at least 1 rock
			new rockType(src)
			if(prob(23))
				new rockType(src)
		SSblackbox.record_feedback("tally", "ore_mined", mineralAmt, mineralType)
	var/flags = NONE
	if(defer_change) // TODO: make the defer change var a var for any changeturf flag
		flags = CHANGETURF_DEFER_CHANGE
	ScrapeAway(null, flags)
	addtimer(CALLBACK(src, PROC_REF(AfterChange)), 1, TIMER_UNIQUE)

/turf/closed/mineral/attack_animal(mob/living/simple_animal/user)
	if((user.environment_smash & ENVIRONMENT_SMASH_WALLS) || (user.environment_smash & ENVIRONMENT_SMASH_RWALLS))
		gets_drilled(user)
	..()
/turf/closed/mineral/acid_melt()
	ScrapeAway()

/turf/closed/mineral/ex_act(severity, target)
	..()
	switch(severity)
		if(3)
			if (prob(75))
				gets_drilled(null, triggered_by_explosion = TRUE)
		if(2)
			if (prob(90))
				gets_drilled(null, triggered_by_explosion = TRUE)
		if(1)
			gets_drilled(null, triggered_by_explosion = TRUE)
	return

/turf/closed/mineral/Spread(turf/T)
	T.ChangeTurf(type)

/turf/closed/mineral/random
	var/list/mineralSpawnChanceList = list()
		//Currently, Adamantine won't spawn as it has no uses. -Durandan
	var/mineralChance = 13
	var/display_icon_state = "rock"

/turf/closed/mineral/random/Initialize()

	mineralSpawnChanceList = typelist("mineralSpawnChanceList", mineralSpawnChanceList)

	if (display_icon_state)
		icon_state = display_icon_state
	. = ..()
	if (prob(mineralChance))
		var/path = pickweight(mineralSpawnChanceList)
		var/turf/T = ChangeTurf(path,null,CHANGETURF_IGNORE_AIR)

		if(T && ismineralturf(T))
			var/turf/closed/mineral/M = T
			M.mineralAmt = rand(1, 5)
			M.environment_type = src.environment_type
			M.turf_type = src.turf_type
			M.baseturfs = src.baseturfs
			src = M
			M.levelupdate()


/turf/closed/mineral/random/rogue
//	layer = ABOVE_MOB_LAYER
	name = "rock"
	desc = "seems barren"
	icon = 'icons/turf/roguewall.dmi'
	icon_state = "minrandbad"
	smooth = SMOOTH_TRUE | SMOOTH_MORE
	smooth_icon = 'icons/turf/walls/cwall.dmi'
	wallclimb = TRUE
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	canSmoothWith = list(/turf/closed/mineral/random/rogue, /turf/closed/mineral/rogue)
	turf_type = /turf/open/floor/rogue/naturalstone
	above_floor = /turf/open/floor/rogue/naturalstone
	baseturfs = list(/turf/open/floor/rogue/naturalstone)
	mineralSpawnChanceList = list(/turf/closed/mineral/rogue/salt = 20, /turf/closed/mineral/rogue/copper = 15, ,/turf/closed/mineral/rogue/tin = 12, /turf/closed/mineral/rogue/iron = 5, /turf/closed/mineral/rogue/coal = 5)
	mineralChance = 30
	max_integrity = 400

/turf/closed/mineral/random/rogue/med
	icon_state = "minrandmed"
	mineralChance = 50
	mineralSpawnChanceList = list(/turf/closed/mineral/rogue/salt = 20, /turf/closed/mineral/rogue/iron = 25, /turf/closed/mineral/rogue/coal = 20, /turf/closed/mineral/rogue/copper = 10, ,/turf/closed/mineral/rogue/tin = 10, /turf/closed/mineral/rogue/silver = 1)//, /turf/closed/mineral/rogue/gemeralds = 1)

/turf/closed/mineral/random/rogue/high
	icon_state = "minrandhigh"
	mineralChance = 60
	mineralSpawnChanceList = list(/turf/closed/mineral/rogue/gold = 15 , /turf/closed/mineral/rogue/iron = 25, /turf/closed/mineral/rogue/silver = 15)//, /turf/closed/mineral/rogue/gemeralds = 10)


//begin actual mineral turfs
/turf/closed/mineral/rogue
//	layer = ABOVE_MOB_LAYER
	name = "rock"
	desc = "seems barren"
	icon = 'icons/turf/roguewall.dmi'
	icon_state = "rockyash"
	smooth = SMOOTH_TRUE | SMOOTH_MORE
	smooth_icon = 'icons/turf/walls/cwall.dmi'
	wallclimb = TRUE
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	canSmoothWith = list(/turf/closed/mineral/random/rogue, /turf/closed/mineral/rogue)
	turf_type = /turf/open/floor/rogue/naturalstone
	baseturfs = /turf/open/floor/rogue/naturalstone
	mineralAmt = 1
	max_integrity = 500
	above_floor = /turf/open/floor/rogue/naturalstone
	mineralType = null
	rockType = null
	spreadChance = 0
	spread = 0


/turf/closed/mineral/rogue/copper
	desc = "seems rich in copper"
	icon_state = "mingold"
	mineralType = /obj/item/rogueore/copper
	rockType = /obj/item/natural/rock/copper
	spreadChance = 4
	spread = 3

/turf/closed/mineral/rogue/tin
	icon_state = "mingold"
	mineralType = /obj/item/rogueore/tin
	rockType = /obj/item/natural/rock/tin
	spreadChance = 15
	spread = 5

/turf/closed/mineral/rogue/silver
	desc = "seems rich in silver"
	icon_state = "mingold"
	mineralType = /obj/item/rogueore/silver
	rockType = /obj/item/natural/rock/silver
	spreadChance = 2
	spread = 2

/turf/closed/mineral/rogue/gold
	desc = "seems rich in gold"
	icon_state = "mingold"
	mineralType = /obj/item/rogueore/gold
	rockType = /obj/item/natural/rock/gold
	spreadChance = 2
	spread = 2

/turf/closed/mineral/rogue/salt
	desc = "seems rich in salt"
	icon_state = "mingold"
	mineralType = /obj/item/reagent_containers/powder/salt
	rockType = /obj/item/natural/rock/salt
	spreadChance = 12
	spread = 3

/turf/closed/mineral/rogue/iron
	desc = "seems rich in iron"
	icon_state = "mingold"
	mineralType = /obj/item/rogueore/iron
	rockType = /obj/item/natural/rock/iron
	spreadChance = 5
	spread = 3

/turf/closed/mineral/rogue/coal
	desc = "seems rich in coal"
	icon_state = "mingold"
	mineralType = /obj/item/rogueore/coal
	rockType = /obj/item/natural/rock/coal
	spreadChance = 3
	spread = 4

/turf/closed/mineral/rogue/gemeralds
	icon_state = "mingold"
	desc = "there is an strange light on the stone?"
	mineralType = /obj/item/roguegem
	rockType = /obj/item/natural/rock/gemerald
	spreadChance = 3
	spread = 2

/turf/closed/mineral/rogue/bedrock
	name = "rock"
	desc = "seems too hard"
	icon_state = "rockyashbed"
//	smooth_icon = 'icons/turf/walls/hardrock.dmi'
	max_integrity = 900
	above_floor = /turf/closed/mineral/rogue/bedrock

/turf/closed/mineral/rogue/bedrock/attackby(obj/item/I, mob/user, params)
	to_chat(user, span_warning("This is far to sturdy to be destroyed!"))
	return FALSE

/turf/closed/mineral/rogue/bedrock/TerraformTurf(path, new_baseturf, flags, defer_change = FALSE, ignore_air = FALSE)
	return

/turf/closed/mineral/rogue/bedrock/acid_act(acidpwr, acid_volume, acid_id)
	return 0

/turf/closed/mineral/rogue/bedrock/Melt()
	to_be_destroyed = FALSE
	return src
