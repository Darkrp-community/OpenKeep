//eorite

/obj/effect/proc_holder/spell/invoked/bud
	name = "Eoran Bloom"
	desc = ""
	clothes_req = FALSE
	range = 7
	overlay_state = "love"
	sound = list('sound/magic/magnet.ogg')
	req_items = list(/obj/item/clothing/neck/roguetown/psicross/eora)
	releasedrain = 40
	chargetime = 60
	warnie = "spellwarning"
	no_early_release = TRUE
	charging_slowdown = 1
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/holy
	charge_max = 60 SECONDS

/obj/effect/proc_holder/spell/invoked/bud/cast(list/targets, mob/living/user)
	var/turf/T = get_turf(targets[1])
	if(!isclosedturf(T))
		new /obj/item/clothing/head/peaceflower(T)
		return TRUE
	to_chat(user, "<span class='warning'>The targeted location is blocked. The flowers of Eora refuse to grow.</span>")
	return FALSE

/obj/effect/proc_holder/spell/invoked/projectile/eoracurse
	name = "Eora's Curse"
	overlay_state = "curse2"
	releasedrain = 50
	chargetime = 30
	range = 7
	projectile_type = /obj/projectile/magic/eora
	warnie = "sydwarning"
	movement_interrupt = FALSE
	chargedloop = null
	req_items = list(/obj/item/clothing/neck/roguetown/psicross/eora)
	sound = 'sound/magic/whiteflame.ogg'
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 10 SECONDS


/obj/projectile/magic/eora
	name = "wine bubble"
	icon_state = "leaper"
	paralyze = 50
	damage = 0
	range = 7
	hitsound = 'sound/blank.ogg'
	nondirectional_sprite = TRUE
	impact_effect_type = /obj/effect/temp_visual/wine_projectile_impact

/obj/projectile/magic/eora/on_hit(atom/target, blocked = FALSE)
	..()
	if(iscarbon(target))
		var/mob/living/carbon/C = target
		C.visible_message("<span class='info'>A purple haze shrouds [target]!</span>", "<span class='notice'>I feel much calmer.</span>")
		C.reagents.add_reagent(/datum/reagent/berrypoison, 1)
		C.reagents.add_reagent(/datum/reagent/moondust, 3)
		C.reagents.add_reagent(/datum/reagent/consumable/ethanol/beer/wine, 3)
		return
	if(isanimal(target))
		var/mob/living/simple_animal/L = target
		L.adjustHealth(25)

/obj/projectile/magic/eora/on_range()
	var/turf/T = get_turf(src)
	..()
	new /obj/structure/wine_bubble(T)

/obj/effect/temp_visual/wine_projectile_impact
	name = "wine bubble"
	icon = 'icons/obj/projectiles.dmi'
	icon_state = "leaper_bubble_pop"
	layer = ABOVE_ALL_MOB_LAYER
	duration = 3

/obj/structure/wine_bubble
	name = "wine bubble"
	desc = ""
	icon = 'icons/obj/projectiles.dmi'
	icon_state = "leaper"
	max_integrity = 10
	density = FALSE

/obj/structure/wine_bubble/Initialize()
	. = ..()
	float(on = TRUE)
	QDEL_IN(src, 100)

/obj/structure/wine_bubble/Destroy()
	new /obj/effect/temp_visual/wine_projectile_impact(get_turf(src))
	playsound(src,'sound/blank.ogg',50, TRUE, -1)
	return ..()

/obj/structure/wine_bubble/Crossed(atom/movable/AM)
	if(isliving(AM))
		var/mob/living/L = AM
		playsound(src,'sound/blank.ogg',50, TRUE, -1)
		L.Paralyze(50)
		if(iscarbon(L))
			var/mob/living/carbon/C = L
			C.reagents.add_reagent(/datum/reagent/berrypoison, 1)
			C.reagents.add_reagent(/datum/reagent/moondust, 3)
			C.reagents.add_reagent(/datum/reagent/consumable/ethanol/beer/wine, 3)
			C.visible_message("<span class='info'>A purple haze shrouds [L]!</span>", "<span class='notice'>I feel much calmer.</span>")
		if(isanimal(L))
			var/mob/living/simple_animal/A = L
			A.adjustHealth(25)
		qdel(src)
	return ..()

