// ***********************************************************
// Foods that are produced from hydroponics ~~~~~~~~~~
// Data from the seeds carry over to these grown foods
// ***********************************************************

// Base type. Subtypes are found in /grown dir. Lavaland-based subtypes can be found in mining/ash_flora.dm
/obj/item/reagent_containers/food/snacks/grown
	icon = 'icons/roguetown/items/produce.dmi'
	var/obj/item/seeds/seed = null // type path, gets converted to item on New(). It's safe to assume it's always a seed item.
	var/plantname = ""
	var/bitesize_mod = 0
	var/splat_type = /obj/effect/decal/cleanable/food/plant_smudge
	// If set, bitesize = 1 + round(reagents.total_volume / bitesize_mod)
	dried_type = -1
	// Saves us from having to define each stupid grown's dried_type as itself.
	// If you don't want a plant to be driable (watermelons) set this to null in the time definition.
	resistance_flags = FLAMMABLE
	var/dry_grind = FALSE //If TRUE, this object needs to be dry to be ground up
	var/wine_flavor //If NULL, this is automatically set to the fruit's flavor. Determines the flavor of the wine if distill_reagent is NULL.
	var/wine_power = 10 //Determines the boozepwr of the wine if distill_reagent is NULL.
	w_class = WEIGHT_CLASS_SMALL
	var/list/pipe_reagents = list()

/obj/item/reagent_containers/food/snacks/grown/attackby(obj/item/W, mob/user, params)
	if(W && isturf(loc))
		if(seed && (user.used_intent.blade_class == BCLASS_BLUNT) && (!user.used_intent.noaa))
			playsound(src,'sound/items/seedextract.ogg', 100, FALSE)
			user.visible_message("<span class='info'>[user] extracts the seeds.</span>")
			if(prob(5))
				qdel(src)
				return
			seed.forceMove(loc)
			if(prob(90))
				new seed.type(loc)
			if(prob(23))
				new seed.type(loc)
			if(prob(6))
				new seed.type(loc)
			seed = null
			qdel(src)
			return
	..()

/obj/item/reagent_containers/food/snacks/grown/Crossed(mob/living/carbon/human/H)
	..()
	if(prob(33))
		if(istype(H))
			if(eat_effect == /datum/status_effect/debuff/rotfood)
				visible_message("<span class='warning'>[H] crushes [src] underfoot.</span>")
				qdel(src)

/obj/item/reagent_containers/food/snacks/grown/Initialize(mapload, obj/item/seeds/new_seed)
	. = ..()
	if(!tastes)
		tastes = list("[name]" = 1)

//	if(new_seed)
//		seed = new_seed.Copy()
	if(ispath(seed))
		// This is for adminspawn or map-placed growns. They get the default stats of their seed type.
		seed = new seed()
		seed.adjust_potency(50-seed.potency)

	pixel_x = rand(-5, 5)
	pixel_y = rand(-5, 5)

	if(dried_type == -1)
		dried_type = src.type

//	if(seed)
//		for(var/datum/plant_gene/trait/T in seed.genes)
//			T.on_new(src, loc)
//		seed.prepare_result(src)
//		transform *= TRANSFORM_USING_VARIABLE(seed.potency, 100) + 0.5 //Makes the resulting produce's sprite larger or smaller based on potency!
//		add_juice()



/obj/item/reagent_containers/food/snacks/grown/proc/add_juice()
	if(reagents)
//		if(bitesize_mod)
//			bitesize = 1 + round(reagents.total_volume / bitesize_mod)
		return 1
	return 0

/obj/item/reagent_containers/food/snacks/grown/examine(user)
	. = ..()
	if(seed)
		for(var/datum/plant_gene/trait/T in seed.genes)
			if(T.examine_line)
				. += T.examine_line

/obj/item/reagent_containers/food/snacks/grown/attackby(obj/item/O, mob/user, params)
	..()
	if (istype(O, /obj/item/plant_analyzer))
		var/msg = "<span class='info'>*---------*\n This is \a <span class='name'>[src]</span>.\n"
		if(seed)
			msg += seed.get_analyzer_text()
		var/reag_txt = ""
		if(seed)
			for(var/reagent_id in seed.reagents_add)
				var/datum/reagent/R  = GLOB.chemical_reagents_list[reagent_id]
				var/amt = reagents.get_reagent_amount(reagent_id)
				reag_txt += "\n<span class='info'>- [R.name]: [amt]</span>"

		if(reag_txt)
			msg += reag_txt
			msg += "<br><span class='info'>*---------*</span>"
		to_chat(user, msg)
	else
		if(seed)
			for(var/datum/plant_gene/trait/T in seed.genes)
				T.on_attackby(src, O, user)


// Various gene procs
/obj/item/reagent_containers/food/snacks/grown/attack_self(mob/user)
	if(seed && seed.get_gene(/datum/plant_gene/trait/squash))
		squash(user)
	..()

/obj/item/reagent_containers/food/snacks/grown/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	if(!..()) //was it caught by a mob?
		if(seed)
			for(var/datum/plant_gene/trait/T in seed.genes)
				T.on_throw_impact(src, hit_atom)
			if(seed.get_gene(/datum/plant_gene/trait/squash))
				squash(hit_atom)

/obj/item/reagent_containers/food/snacks/grown/proc/squash(atom/target)
	var/turf/T = get_turf(target)
	forceMove(T)
	if(ispath(splat_type, /obj/effect/decal/cleanable/food/plant_smudge))
		if(filling_color)
			var/obj/O = new splat_type(T)
			O.color = filling_color
			O.name = "[name] smudge"
	else if(splat_type)
		new splat_type(T)

	if(trash)
		generate_trash(T)

	visible_message("<span class='warning'>[src] has been squashed.</span>","<span class='hear'>I hear a smack.</span>")
	if(seed)
		for(var/datum/plant_gene/trait/trait in seed.genes)
			trait.on_squash(src, target)

	reagents.reaction(T)
	for(var/A in T)
		reagents.reaction(A)

	qdel(src)

/obj/item/reagent_containers/food/snacks/grown/On_Consume()
	if(iscarbon(usr))
		if(seed)
			for(var/datum/plant_gene/trait/T in seed.genes)
				T.on_consume(src, usr)
	..()

/obj/item/reagent_containers/food/snacks/grown/generate_trash(atom/location)
	if(trash && (ispath(trash, /obj/item/grown) || ispath(trash, /obj/item/reagent_containers/food/snacks/grown)))
		. = new trash(location, seed)
		trash = null
		return
	return ..()

/obj/item/reagent_containers/food/snacks/grown/grind_requirements()
	if(dry_grind && !dry)
		to_chat(usr, "<span class='warning'>[src] needs to be dry before it can be ground up!</span>")
		return
	return TRUE

/obj/item/reagent_containers/food/snacks/grown/on_grind()
	var/nutriment = reagents.get_reagent_amount(/datum/reagent/consumable/nutriment)
	if(grind_results&&grind_results.len)
		for(var/i in 1 to grind_results.len)
			grind_results[grind_results[i]] = nutriment
		reagents.del_reagent(/datum/reagent/consumable/nutriment)
		reagents.del_reagent(/datum/reagent/consumable/nutriment/vitamin)

/obj/item/reagent_containers/food/snacks/grown/on_juice()
	var/nutriment = reagents.get_reagent_amount(/datum/reagent/consumable/nutriment)
	if(juice_results&&juice_results.len)
		for(var/i in 1 to juice_results.len)
			juice_results[juice_results[i]] = nutriment
		reagents.del_reagent(/datum/reagent/consumable/nutriment)
		reagents.del_reagent(/datum/reagent/consumable/nutriment/vitamin)

/*
 * Attack self for growns
 *
 * Spawns the trash item at the growns drop_location()
 *
 * Then deletes the grown object
 *
 * Then puts trash item into the hand of user attack selfing, or drops it back on the ground
 */
/obj/item/reagent_containers/food/snacks/grown/shell/attack_self(mob/user)
	var/obj/item/T
	if(trash)
		T = generate_trash(drop_location())
		//Delete grown so our hand is free
		qdel(src)
		//put trash obj in hands or drop to ground
		user.put_in_hands(T, user.active_hand_index, TRUE)
		to_chat(user, "<span class='notice'>I open [src]\'s shell, revealing \a [T].</span>")

/* Example of how to crush a item in hand to make it into another, could be a useful reference

/obj/item/reagent_containers/food/snacks/grown/meatwheat/attack_self(mob/living/user)
	user.visible_message("<span class='notice'>[user] crushes [src] into meat.</span>", "<span class='notice'>I crush [src] into something that resembles meat.</span>")
	playsound(user, 'sound/blank.ogg', 50, TRUE)
	var/obj/item/reagent_containers/food/snacks/meat/slab/meatwheat/M = new
	qdel(src)
	user.put_in_hands(M)
	return 1

/obj/item/grown/cotton/attack_self(mob/user)
	user.show_message("<span class='notice'>I pull some [cotton_name] out of the [name]!</span>", MSG_VISUAL)
	var/seed_modifier = 0
	if(seed)
		seed_modifier = round(seed.potency / 25)
	var/obj/item/stack/cotton = new cotton_type(user.loc, 1 + seed_modifier)
	var/old_cotton_amount = cotton.amount
	for(var/obj/item/stack/ST in user.loc)
		if(ST != cotton && istype(ST, cotton_type) && ST.amount < ST.max_amount)
			ST.attackby(cotton, user)
	if(cotton.amount > old_cotton_amount)
		to_chat(user, "<span class='notice'>I add the newly-formed [cotton_name] to the stack. It now contains [cotton.amount] [cotton_name].</span>")
	qdel(src)
	

/obj/item/grown/novaflower Could be rerolled to fyrtius flowers I suppose, could be useful inspiration
	name = "novaflower"
	desc = ""
	icon_state = "novaflower"
	lefthand_file = 'icons/mob/inhands/weapons/plants_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/plants_righthand.dmi'
	damtype = "fire"
	force = 0
	slot_flags = ITEM_SLOT_HEAD
	throwforce = 0
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 1
	throw_range = 3
	attack_verb = list("roasted", "scorched", "burned")
	grind_results = list(/datum/reagent/consumable/capsaicin = 0, /datum/reagent/consumable/condensedcapsaicin = 0)

/obj/item/grown/novaflower/add_juice()
	..()
	force = round((5 + seed.potency / 5), 1)

/obj/item/grown/novaflower/attack(mob/living/carbon/M, mob/user)
	if(!..())
		return
	if(isliving(M))
		to_chat(M, "<span class='danger'>I are lit on fire from the intense heat of the [name]!</span>")
		M.adjust_fire_stacks(seed.potency / 20)
		if(M.IgniteMob())
			message_admins("[ADMIN_LOOKUPFLW(user)] set [ADMIN_LOOKUPFLW(M)] on fire with [src] at [AREACOORD(user)]")
			log_game("[key_name(user)] set [key_name(M)] on fire with [src] at [AREACOORD(user)]")

/obj/item/grown/novaflower/afterattack(atom/A as mob|obj, mob/user,proximity)
	. = ..()
	if(!proximity)
		return
	if(force > 0)
		force -= rand(1, (force / 3) + 1)
	else
		to_chat(usr, "<span class='warning'>All the petals have fallen off the [name] from violent whacking!</span>")
		qdel(src)

/obj/item/grown/novaflower/pickup(mob/living/carbon/human/user)
	..()
	if(!user.gloves)
		to_chat(user, "<span class='danger'>The [name] burns my bare hand!</span>")
		user.adjustFireLoss(rand(1, 5))	

// corpse flower effect, another worth saving
/obj/item/seeds/starthistle/corpse_flower/process()
	var/obj/machinery/hydroponics/parent = loc
	if(parent.age < maturation) // Start a little before it blooms
		return

	var/turf/open/T = get_turf(parent)
	if(abs(ONE_ATMOSPHERE - T.return_air().return_pressure()) > (potency/10 + 10)) // clouds can begin showing at around 50-60 potency in standard atmos
		return

	var/datum/gas_mixture/stank = new
	ADD_GAS(/datum/gas/miasma, stank.gases)
	stank.gases[/datum/gas/miasma][MOLES] = (yield + 6)*7*MIASMA_CORPSE_MOLES // this process is only being called about 2/7 as much as corpses so this is 12-32 times a corpses
	stank.temperature = T20C // without this the room would eventually freeze and miasma mining would be easier
	T.assume_air(stank)
	T.air_update_turf()

// explosive produce code, also save-worthy
/obj/item/reagent_containers/food/snacks/grown/cherry_bomb/attack_self(mob/living/user)
	user.visible_message("<span class='warning'>[user] plucks the stem from [src]!</span>", "<span class='danger'>I pluck the stem from [src], which begins to hiss loudly!</span>")
	log_bomber(user, "primed a", src, "for detonation")
	prime()

/obj/item/reagent_containers/food/snacks/grown/cherry_bomb/deconstruct(disassembled = TRUE)
	if(!disassembled)
		prime()
	if(!QDELETED(src))
		qdel(src)

/obj/item/reagent_containers/food/snacks/grown/cherry_bomb/ex_act(severity)
	qdel(src) //Ensuring that it's deleted by its own explosion. Also prevents mass chain reaction with piles of cherry bombs

/obj/item/reagent_containers/food/snacks/grown/cherry_bomb/proc/prime()
	icon_state = "cherry_bomb_lit"
	playsound(src, 'sound/blank.ogg', seed.potency, FALSE)
	reagents.chem_temp = 1000 //Sets off the gunpowder
	reagents.handle_reactions()

// reminder how to do variable icons when pickup and dropped
/obj/item/reagent_containers/food/snacks/grown/citrus/orange_3d/pickup(mob/user)
	. = ..()
	icon_state = "orange"

/obj/item/reagent_containers/food/snacks/grown/citrus/orange_3d/dropped(mob/user)
	. = ..()
	icon_state = "orang"

// fire lemon code saved
/obj/item/reagent_containers/food/snacks/grown/firelemon/attack_self(mob/living/user)
	user.visible_message("<span class='warning'>[user] primes [src]!</span>", "<span class='danger'>I prime [src]!</span>")
	log_bomber(user, "primed a", src, "for detonation")
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		C.throw_mode_on()
	icon_state = "firelemon_active"
	playsound(loc, 'sound/blank.ogg', 75, TRUE, -3)
	addtimer(CALLBACK(src, PROC_REF(prime)), rand(10, 60))

/obj/item/reagent_containers/food/snacks/grown/firelemon/burn()
	prime()
	..()

/obj/item/reagent_containers/food/snacks/grown/firelemon/proc/update_mob()
	if(ismob(loc))
		var/mob/M = loc
		M.dropItemToGround(src)

/obj/item/reagent_containers/food/snacks/grown/firelemon/ex_act(severity)
	qdel(src) //Ensuring that it's deleted by its own explosion

/obj/item/reagent_containers/food/snacks/grown/firelemon/proc/prime()
	switch(seed.potency) //Combustible lemons are alot like IEDs, lots of flame, very little bang.
		if(0 to 30)
			update_mob()
			explosion(src.loc,-1,-1,2, flame_range = 1)
			qdel(src)
		if(31 to 50)
			update_mob()
			explosion(src.loc,-1,-1,2, flame_range = 2)
			qdel(src)
		if(51 to 70)
			update_mob()
			explosion(src.loc,-1,-1,2, flame_range = 3)
			qdel(src)
		if(71 to 90)
			update_mob()
			explosion(src.loc,-1,-1,2, flame_range = 4)
			qdel(src)
		else
			update_mob()
			explosion(src.loc,-1,-1,2, flame_range = 5)
			qdel(src)

*/
