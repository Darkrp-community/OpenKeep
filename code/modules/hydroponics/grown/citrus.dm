// Citrus - base type
/obj/item/reagent_containers/food/snacks/grown/citrus
//	seed = /obj/item/seeds/lime
	name = "citrus"
	desc = ""
	icon_state = "lime"
	bitesize_mod = 2
	foodtype = FRUIT
	//wine_power = 30



/obj/item/reagent_containers/food/snacks/grown/firelemon
//	seed = /obj/item/seeds/firelemon
	name = "Combustible Lemon"
	desc = ""
	icon_state = "firelemon"
	bitesize_mod = 2
	foodtype = FRUIT
	//wine_power = 70

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
/*	switch(seed.potency) //Combustible lemons are alot like IEDs, lots of flame, very little bang.
//		if(0 to 30)
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

