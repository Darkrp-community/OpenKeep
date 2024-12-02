/obj/effect/proc_holder/spell/invoked/blindness
	name = "Blindness"
	overlay_state = "blindness"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 7
	warnie = "sydwarning"
	movement_interrupt = FALSE
	sound = 'sound/magic/churn.ogg'
	req_items = list(/obj/item/clothing/neck/roguetown/psycross/noc)
	invocation = "Noc blinds thee of thy sins!"
	invocation_type = "shout" //can be none, whisper, emote and shout
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 2 MINUTES
	devotion_cost = 30

/obj/effect/proc_holder/spell/invoked/blindness/cast(list/targets, mob/user = usr)
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(target.anti_magic_check(TRUE, TRUE))
			return FALSE
		target.visible_message("<span class='warning'>[user] points at [target]'s eyes!</span>","<span class='warning'>My eyes are covered in darkness!</span>")
		target.blind_eyes(3)
		return ..()
	return FALSE

/obj/effect/proc_holder/spell/invoked/invisibility
	name = "Invisibility"
	overlay_state = "invisibility"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	charge_max = 60 SECONDS
	range = 3
	warnie = "sydwarning"
	movement_interrupt = FALSE
	req_items = list(/obj/item/clothing/neck/roguetown/psycross/noc)
	invocation_type = "none"
	sound = 'sound/misc/area.ogg'
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	miracle = TRUE
	devotion_cost = 60

/obj/effect/proc_holder/spell/invoked/invisibility/cast(list/targets, mob/living/user)
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(target.anti_magic_check(TRUE, TRUE))
			return FALSE
		target.visible_message("<span class='warning'>[target] starts to fade into thin air!</span>", "<span class='notice'>You start to become invisible!</span>")
		animate(target, alpha = 0, time = 1 SECONDS, easing = EASE_IN)
		target.mob_timers[MT_INVISIBILITY] = world.time + 30 SECONDS
		addtimer(CALLBACK(target, TYPE_PROC_REF(/mob/living, update_sneak_invis), TRUE), 30 SECONDS)
		addtimer(CALLBACK(target, TYPE_PROC_REF(/atom/movable, visible_message), span_warning("[target] fades back into view."), span_warning("You become visible again!")), 15 SECONDS)
		return ..()
	return FALSE

/obj/effect/proc_holder/spell/invoked/darkvision
	name = "Darkvision"
	desc = "Be granted truesight, the better to behold the truth of the world with."
	clothes_req = list(/obj/item/clothing/neck/roguetown/psycross/noc)
	invocation = "Noc, bestow upon me your vision."
	invocation_type = "Whisper" //can be none, whisper, emote and shout
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 15 MINUTES
	devotion_cost = 40

/obj/effect/proc_holder/spell/self/darkvision/cast(list/targets, mob/living/user)
	playsound(get_turf(user), 'sound/magic/charged.ogg', 100, TRUE)
	if (do_after(user,4 SECONDS))
		to_chat(user, span_notice("Your prayer is answered, the darkness lowers its veil."))
		playsound(get_turf(user), 'sound/magic/magic_nulled.ogg', 60, TRUE, -1)
		user.apply_status_effect(/datum/status_effect/buff/darkvision)
		return ..()
	return FALSE
