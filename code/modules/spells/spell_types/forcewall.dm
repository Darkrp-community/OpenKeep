/obj/effect/proc_holder/spell/targeted/forcewall
	name = "Forcewall"
	desc = ""
	base_icon_state = "" // for spells thats direct activated
	action_icon_state = "forcewall"
	overlay_state = "forcewall"
	school = "transmutation"
	charge_max = 100
	releasedrain = 30
	chargedrain = 1
	clothes_req = FALSE
	invocation = "SHIELDA MAGIKA"
	invocation_type = "shout"
	action_icon_state = "shield"
	range = -1
	include_user = TRUE
	cooldown_min = 900 //12 deciseconds reduction per rank
	associated_skill = /datum/skill/magic/arcane
	var/wall_type = /obj/effect/forcefield/wizard

/obj/effect/proc_holder/spell/targeted/forcewall/cast(list/targets,mob/user = usr)
	playsound(get_turf(user), 'sound/magic/timestop.ogg', 100, TRUE, -1)
	new wall_type(get_turf(user),user)
	if(user.dir == SOUTH || user.dir == NORTH)
		new wall_type(get_step(user, EAST),user)
		new wall_type(get_step(user, WEST),user)
	else
		new wall_type(get_step(user, NORTH),user)
		new wall_type(get_step(user, SOUTH),user)


/obj/effect/forcefield/wizard
	var/mob/wizard

/obj/effect/forcefield/wizard/Initialize(mapload, mob/summoner)
	. = ..()
	wizard = summoner

/obj/effect/forcefield/wizard/CanPass(atom/movable/mover, turf/target)
	if(mover == wizard)
		return TRUE
	if(ismob(mover))
		var/mob/M = mover
		if(M.anti_magic_check(chargecost = 0))
			return TRUE
	return FALSE
