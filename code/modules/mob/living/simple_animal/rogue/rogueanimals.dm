//these mobs run away when attacked
/mob/living/simple_animal/hostile/retaliate/rogue
	turns_per_move = 5
	see_in_dark = 6
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	faction = list("rogueanimal")
	robust_searching = 1
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	attack_sound = PUNCHWOOSH
	health = 40
	maxHealth = 40
	move_to_delay = 5
	d_intent = INTENT_DODGE
	minbodytemp = 180
	lose_patience_timeout = 150
	vision_range = 5
	aggro_vision_range = 18
	harm_intent_damage = 5
	attack_same = 0
	environment_smash = ENVIRONMENT_SMASH_NONE
	blood_volume = BLOOD_VOLUME_NORMAL
	food_type = list(/obj/item/reagent_containers/food/snacks/grown)
	footstep_type = FOOTSTEP_MOB_SHOE
	stop_automated_movement_when_pulled = 0
	tame_chance = 0
	retreat_distance = 10
	minimum_distance = 10
	candodge = TRUE
	dodge_sound = 'sound/combat/dodge.ogg'
	dodge_prob = 0
	search_objects = TRUE
	//Should turn this into a flag thing but i dont want to touch too many things
	var/body_eater = FALSE
	//If the creature is doing something they should STOP MOVING.
	var/can_act = TRUE
	//Trolls eat more than wolves
	var/food_max = 50
	var/deaggroprob = 10
	var/eat_forever
	var/obj/item/udder/udder = null
	var/milkies = FALSE

/mob/living/simple_animal/hostile/retaliate/rogue/Move()
	//If you cant act and dont have a player stop moving.
	if(!can_act && !client)
		return FALSE
	..()

/mob/living/simple_animal/hostile/retaliate/rogue/apply_damage(damage = 0,damagetype = BRUTE, def_zone = null, blocked = FALSE, forced = FALSE)
	..()
	if(damagetype == BRUTE)
		if(damage > 5 && prob(damage * 3))
			emote("pain")
		if(damage > 10)
			Immobilize(clamp(damage/2, 1, 30))
			shake_camera(src, 1, 1)
		if(damage < 10)
			flash_fullscreen("redflash1")
		else if(damage < 20)
			flash_fullscreen("redflash2")
		else if(damage >= 20)
			flash_fullscreen("redflash3")
	if(damagetype == BURN)
		if(damage > 10 && prob(damage))
			emote("pain")
			shake_camera(src, 1, 1)
		if(damage < 10)
			flash_fullscreen("redflash1")
		else if(damage < 20)
			flash_fullscreen("redflash2")
		else if(damage >= 20)
			flash_fullscreen("redflash3")

/mob/living/simple_animal/hostile/retaliate/rogue/death(gibbed)
	emote("death")
	..()

/mob/living/simple_animal/hostile/retaliate/rogue/handle_automated_movement()
	set waitfor = FALSE
	if(!stop_automated_movement && wander && !doing)
		if(ssaddle && has_buckled_mobs())
			return FALSE
		else
			..()

//What can we attack?
/mob/living/simple_animal/hostile/retaliate/rogue/CanAttack(atom/the_target)
	//If is foodtype and food is less than 50 or you eat forever.
	if(is_type_in_list(the_target, food_type) && (food < food_max || eat_forever))
		return TRUE
	//Return root code
	. = ..()
	//Am i a body eater?
	if(body_eater)
		if(isliving(the_target))
			var/mob/living/stuff = the_target
			if(stuff.stat != CONSCIOUS && !faction_check_mob(stuff))
				return TRUE

//Im coding this because im curious if your server will work better with it -IP
/mob/living/simple_animal/hostile/retaliate/rogue/PickTarget(list/Targets)
	/*
	* Here let me explain how this works
	* We are going to skim through the
	* Targets list and seperate it into
	* two groups, food and living.
	* If there is any items in the living
	* list then the AI will use the root code
	* to select the nearest of those targets.
	* If that list is empty we instead scan
	* the food list. This prioritizes living
	* targets over food.
	* <3 IP
	*/
	var/list/foodtargets = list()
	var/list/enemytargets = list()
	for(var/atom/A in Targets)
		if(isliving(A))
			//Dead creatures are to be considered food.
			var/mob/living/L = A
			if(L.stat != CONSCIOUS)
				foodtargets += L
			else
				enemytargets += A
		else
			foodtargets += A
	if(LAZYLEN(enemytargets))
		return ..(enemytargets)
	return ..(foodtargets)

//What happens when we attack something
/mob/living/simple_animal/hostile/retaliate/rogue/AttackingTarget()
	//If you cant act and dont have a player stop moving.
	if(!can_act && !client)
		return FALSE
	UniqueAttack()

	return ..()

/mob/living/simple_animal/hostile/retaliate/rogue/proc/UniqueAttack()
	if(body_eater)
		if(isliving(target))
			var/mob/living/body = target
			if(body.stat != CONSCIOUS)
				can_act = FALSE
				/*
				* Dodge is divided by 10 so
				* hits while eating are easier.
				*/
				dodge_prob /= 10
				DismemberBody(body)
				dodge_prob *= 10
				can_act = TRUE
				return

	//Now this is eating!
	if(is_type_in_list(target, food_type))
		playsound(src,'sound/misc/eat.ogg', rand(30,60), TRUE)
		qdel(target)
		food = max(food + 30, food_max + 50)
		return

/mob/living/simple_animal/hostile/retaliate/rogue/proc/DismemberBody(mob/living/L)
	//Lets keep track of this to see if we start getting wounded while eating.
	var/start_hp = src.health
	var/interrupted = FALSE
	testing("[src]_eating_[L]")
	if(L.stat != CONSCIOUS)
		if(iscarbon(L))
			var/mob/living/carbon/C = L
			if(attack_sound)
				playsound(src, pick(attack_sound), 100, TRUE, -1)
			src.visible_message("<span class='danger'>[src] starts to rip apart [C]!</span>")
			//Run the do after twice if either of the checks fail
			for(var/i = 1 to 2)
				if(!do_after(src,5 SECONDS, target = L) || start_hp > health)
					interrupted = TRUE
					LoseTarget()
					break
			if(!interrupted)
				var/obj/item/bodypart/limb
				var/list/limb_list = list(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)
				for(var/zone in limb_list)
					limb = C.get_bodypart(zone)
					if(limb)
						limb.dismember()
						return TRUE
				limb = C.get_bodypart(BODY_ZONE_HEAD)
				if(limb)
					limb.dismember()
					return TRUE
				limb = C.get_bodypart(BODY_ZONE_CHEST)
				if(limb)
					if(!limb.dismember())
						C.gib()
					return TRUE
		else
			if(attack_sound)
				playsound(src, pick(attack_sound), 100, TRUE, -1)
			src.visible_message("<span class='danger'>[src] starts to rip apart [L]!</span>")
			//Run the do after twice if either of the checks fail
			for(var/i = 1 to 2)
				if(!do_after(src,5 SECONDS, target = L) || start_hp > health)
					interrupted = TRUE
					LoseTarget()
					break
			if(!interrupted)
				L.gib()
				return TRUE

/mob/living/simple_animal/hostile/retaliate/rogue/Initialize()
	..()
	if(milkies)
		udder = new()
	if(tame)
		tamed()
	ADD_TRAIT(src, TRAIT_SIMPLE_WOUNDS, TRAIT_GENERIC)

/mob/living/simple_animal/hostile/retaliate/rogue/GiveTarget(new_target)
	..()
	/*
	* I considered making a true/false proc for
	* this since for some structures it may be
	* better for cowardly creatures to run.
	*/
	if(isitem(new_target) || isstructure(new_target))
		retreat_distance = 0
		minimum_distance = 1

/mob/living/simple_animal/hostile/retaliate/rogue/LoseTarget()
	..()
	retreat_distance = initial(retreat_distance)
	minimum_distance = initial(minimum_distance)

/mob/living/simple_animal/hostile/retaliate/rogue/tamed()
	del_on_deaggro = 0
	aggressive = 0
	if(enemies.len)
		if(prob(23))
			enemies = list()
			src.visible_message("<span class='notice'>[src] calms down.</span>")
			LoseTarget()
		else
			return
	..()

/mob/living/simple_animal/hostile/retaliate/rogue/Destroy()
	qdel(udder)
	udder = null
	..()

/mob/living/simple_animal/hostile/retaliate/rogue/Life()
	. = ..()
	if(.)
		if(enemies.len)
			if(prob(5))
				emote("cidle")
			if(prob(deaggroprob))
				if(mob_timers["aggro_time"])
					if(world.time > mob_timers["aggro_time"] + 30 SECONDS)
						enemies = list()
						src.visible_message("<span class='info'>[src] calms down.</span>")
						LoseTarget()
				else
					mob_timers["aggro_time"] = world.time
		else
			if(prob(8))
				emote("idle")
//			for(var/direction in shuffle(list(1,2,4,8,5,6,9,10)))
//				var/step = get_step(src, direction)
//				if(step)
//					var/obj/item/reagent_containers/food/I = locate(/obj/item/reagent_containers/food) in step
//					if(is_type_in_list(I, food_type))
//						Move(step, get_dir(src, step))
			if(adult_growth)
				growth_prog += 0.5
				if(growth_prog >= 100)
					if(isturf(loc))
						var/mob/living/simple_animal/A = new adult_growth(loc)
						if(tame)
							A.tame = TRUE
						qdel(src)
						return
			else
				if(childtype)
					make_babies()
		if(udder)
			if(production > 0)
				production--
				udder.generateMilk()

/mob/living/simple_animal/hostile/retaliate/rogue/Retaliate()
//	if(!enemies.len && message)
//		src.visible_message("<span class='warning'>[src] panics!</span>")
//	if(flee)
//		retreat_distance = 10
//		minimum_distance = 10
	mob_timers["aggro_time"] = world.time
	..()

/mob/living/simple_animal/hostile/retaliate/rogue/attackby(obj/item/O, mob/user, params)
	if(!stat && istype(O, /obj/item/reagent_containers/glass))
		if(udder)
			udder.milkAnimal(O, user)
			return 1
	else
		return ..()

/mob/living/simple_animal/hostile/retaliate/rogue/proc/return_action()
	stop_automated_movement = FALSE
	walk(src,0)

/mob/living/simple_animal/hostile/retaliate/rogue/shood(mob/user)
	if(tame)
		Retaliate()

/mob/living/simple_animal/hostile/retaliate/rogue/onkick(mob/M)
	..()
	Retaliate()
	GiveTarget(M)

/mob/living/simple_animal/hostile/retaliate/rogue/beckoned(mob/user)
	if(tame && !stop_automated_movement)
		stop_automated_movement = TRUE
		Goto(user,move_to_delay)
		addtimer(CALLBACK(src, PROC_REF(return_action)), 3 SECONDS)

/mob/living/simple_animal/hostile/retaliate/rogue/food_tempted(obj/item/O, mob/user)
	testing("tempted")
	if(is_type_in_list(O, food_type) && !stop_automated_movement)
		testing("infoodtype")
		stop_automated_movement = TRUE
		Goto(user,move_to_delay)
		addtimer(CALLBACK(src, PROC_REF(return_action)), 3 SECONDS)
