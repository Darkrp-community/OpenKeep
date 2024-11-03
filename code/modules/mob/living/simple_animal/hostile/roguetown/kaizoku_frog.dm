/obj/item/reagent_containers/food/snacks/fogdart
	name = "fogdart frog"
	desc = "the Abyssariad tree frog capable of living in a variety of habitats on Fog Islands, but is more well know for their sleep-inducing glands. It has enough for five projectiles."
	icon_state = "fogfrog"
	icon = 'icons/roguetown/kaizoku/mobs/fogfrog.dmi'
	list_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/fogblight = 25)
	verb_say = "croaks"
	verb_yell = "croaks"
	eat_effect = /datum/status_effect/debuff/uncookedfood
	fried_type = /obj/item/reagent_containers/food/snacks/fogdart/friedfrog
	sellprice = 15 //these frogs actually have value.
	foodtype = RAW
	obj_flags = CAN_BE_HIT
	var/dead = FALSE
	max_integrity = 10
	rotprocess = null

/obj/item/reagent_containers/food/snacks/fogdart/onbite(mob/living/carbon/human/user)
	if(loc == user)
		if(user.mind && user.mind.has_antag_datum(/datum/antagonist/vampirelord))
			if(dead)
				to_chat(user, "<span class='warning'>It's dead.</span>")
				return
			var/datum/antagonist/vampirelord/VD = user.mind.has_antag_datum(/datum/antagonist/vampirelord)
			if(do_after(user, 30, target = src))
				user.visible_message("<span class='warning'>[user] drinks from [src]!</span>",\
				"<span class='warning'>I drink from [src]!</span>")
				playsound(user.loc, 'sound/misc/drink_blood.ogg', 100, FALSE, -4)
				VD.handle_vitae(50)
				dead = TRUE
				playsound(get_turf(user), 'sound/vo/mobs/rat/rat_death.ogg', 100, FALSE, -1)
				icon_state = "fogfrog_dead"
				rotprocess = 15 MINUTES
				var/mob/living/carbon/V = user
				V.add_stress(/datum/stressevent/drankrat)
			return
	return ..()

/obj/item/reagent_containers/food/snacks/fogdart/friedfrog
	name = "fried fog frog" //FFF
	desc = "are you sure you are going to eat this?"
	icon = 'icons/roguetown/items/food.dmi'
	icon_state = "fogfrog_cooked"
	bitesize = 2
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/fogblight = 10) //heat denaturalized the poison, so it is less harmful. Still bad.
	w_class = WEIGHT_CLASS_TINY
	tastes = list("stupid decisions" = 1)
	eat_effect = null
	rotprocess = 15 MINUTES
	sellprice = 0

/obj/item/reagent_containers/food/snacks/fogdart/burning(input as num)
	if(!dead)
		if(burning >= burntime)
			dead = TRUE
			playsound(src, 'sound/vo/mobs/rat/rat_death.ogg', 100, FALSE, -1)
			icon_state = "srat1"
			rotprocess = 15 MINUTES
	. = ..()

/obj/item/reagent_containers/food/snacks/fogdart/Crossed(mob/living/L)
	. = ..()
	if(L)
		if(!dead)
			if(isturf(loc))
				dir = pick(GLOB.cardinals)
				step(src, dir)
//				playsound(src, pick('sound/vo/mobs/rat/rat_life.ogg','sound/vo/mobs/rat/rat_life2.ogg','sound/vo/mobs/rat/rat_life3.ogg'), 100, TRUE, -1)



/obj/item/reagent_containers/food/snacks/fogdart/dead
	dead = TRUE
	rotprocess = 15 MINUTES

/obj/item/reagent_containers/food/snacks/fogdart/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)
	if(dead)
		icon_state = "fogfrog_dead"
		rotprocess = 15 MINUTES

/obj/item/reagent_containers/food/snacks/fogdart/attack_hand(mob/user)
	if(isliving(user))
		var/mob/living/L = user
		if(!(L.mobility_flags & MOBILITY_PICKUP))
			return
	user.changeNext_move(CLICK_CD_MELEE)
	if(dead)
		..()
	else
		if(!isturf(loc))
			if(isliving(user))
				var/mob/living/L = user
				if(prob(L.STASPD * 1.5))
					..()
				else
					dir = pick(GLOB.cardinals)
					step(src, dir)
					to_chat(user, "<span class='warning'>I managed to grab it, but it slided away!</span>")
					playsound(src, pick('sound/vo/mobs/rat/rat_life.ogg','sound/vo/mobs/rat/rat_life2.ogg','sound/vo/mobs/rat/rat_life3.ogg'), 100, TRUE, -1)
					return
	..()

/obj/item/reagent_containers/food/snacks/fogdart/process()
	..()
	if(dead)
		return
	if(!isturf(loc)) //no floating out of bags
		return
	if(prob(5))
		playsound(src, pick('sound/vo/mobs/rat/rat_life.ogg','sound/vo/mobs/rat/rat_life2.ogg','sound/vo/mobs/rat/rat_life3.ogg'), 100, TRUE, -1)
	if(prob(75) && !dead)
		dir = pick(GLOB.cardinals)
		step(src, dir)


/obj/item/reagent_containers/food/snacks/fogdart/obj_destruction(damage_flag)
	//..()
	if(!dead)
		dead = TRUE
		rotprocess = 15 MINUTES
		playsound(src, 'sound/vo/mobs/rat/rat_death.ogg', 100, FALSE, -1)
		icon_state = "[icon_state]1"
		return 1
	. = ..()

/obj/item/reagent_containers/food/snacks/fogdart/attackby(obj/item/I, mob/user, params)
	if(!dead)
		if(isliving(user))
			var/mob/living/L = user
			if(prob(L.STASPD * 2))
				..()
			else
				if(isturf(loc))
					dir = pick(GLOB.cardinals)
					step(src, dir)
					to_chat(user, "<span class='warning'>The frog dodges my attack.</span>")
					playsound(src, pick('sound/vo/mobs/rat/rat_life.ogg','sound/vo/mobs/rat/rat_life2.ogg','sound/vo/mobs/rat/rat_life3.ogg'), 100, TRUE, -1)
					return
	..()
