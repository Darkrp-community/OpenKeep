/obj/item
	var/possible_potion // check if it can be used in the cauldron, and what potion.

/obj/machinery/light/rogue/cauldron
	name = "cauldron"
	desc = ""
	icon = 'icons/roguetown/misc/alchemy.dmi'
	icon_state = "cauldron1"
	base_state = "cauldron"
	density = TRUE
	opacity = FALSE
	anchored = TRUE
	max_integrity = 300
	var/list/ingredients = list()
	var/maxingredients = 3
	var/brewing = 0
	var/potion_result = "bland"
	var/brew_amount = 60
	fueluse = 5 MINUTES
	crossfire = FALSE

/obj/machinery/light/rogue/cauldron/Initialize()
	create_reagents(500, DRAINABLE | AMOUNT_VISIBLE | REFILLABLE)
	. = ..()

/obj/machinery/light/rogue/cauldron/Destroy()
	chem_splash(loc, 2, list(reagents))
	qdel(reagents)
	..()

/obj/machinery/light/rogue/cauldron/burn_out()
	brewing = 0
	..()

/*
/obj/machinery/light/rogue/cauldron/examine(mob/user)
	if(ingredients.len)//ingredients.len
		DISABLE_BITFIELD(reagents.flags, AMOUNT_VISIBLE)
	else
		ENABLE_BITFIELD(reagents.flags, AMOUNT_VISIBLE)
	. = ..()
*/

/obj/machinery/light/rogue/cauldron/process()
	..()
	if(on)
		
		if(ingredients.len)
			if(brewing < 20)
				if(src.reagents.has_reagent(/datum/reagent/water = 20))
					brewing++
					if(prob(10))
						playsound(src, "bubbles", 100, FALSE)
			else if(brewing == 20)
				var/healthpot_weight = 0
				var/manapot_weight = 0
				var/antidote_weight = 0
				var/diseasecure_weight = 0

				var/strength_weight = 0
				var/speed_weight = 0
				var/perception_weight = 0
				var/intelligence_weight = 0
				var/constitution_weight = 0
				var/endurance_weight = 0
				var/fortune_weight = 0

				var/poison_weight = 0

				var/strong_mod = 0
				var/long_mod = 0
				//ingredients convert to their potion
				for(var/obj/item/I in ingredients)
					testing("[I], [I.possible_potion]")
					switch(I.possible_potion)
						//potions
						if("healthpot")
							healthpot_weight++
						if("stronghealth")
							healthpot_weight++
							strong_mod++
						if("manapot")
							manapot_weight++
						if("strongmana")
							manapot_weight++
							strong_mod++
						if("antidote")
							antidote_weight++
						if("diseasecure")
							diseasecure_weight++
						//buff potions
						if("bodycomp")
							strength_weight++
							speed_weight++
						if("mindcomp")
							perception_weight++
							speed_weight++
						if("spiritcomp")
							constitution_weight++
							endurance_weight++

						if("strpot")
							strength_weight++
						if("spdpot")
							speed_weight++
						if("perpot")
							perception_weight++
						if("intpot")
							intelligence_weight++
						if("conpot")
							constitution_weight++
						if("endpot")
							endurance_weight++
						if("forpot")
							fortune_weight++
						//poisons
						if("poison")
							poison_weight++
						//modifiers
						if("long")
							long_mod++
						if("strong")
							strong_mod++
						if("robust")
							long_mod++
							strong_mod++
					qdel(I)
				if(reagents)
					var/brew_water = reagents.get_reagent_amount(/datum/reagent/water)
					reagents.remove_reagent(/datum/reagent/water, brew_water)
				//modify the potion
				if(long_mod)
					brew_amount *= 1.5
				if(strong_mod)
					if(healthpot_weight >= 3)
						reagents.add_reagent(/datum/reagent/additive, brew_amount)
					if(manapot_weight >= 3)
						reagents.add_reagent(/datum/reagent/additive, brew_amount)

					if(poison_weight >= 2)
						reagents.add_reagent(/datum/reagent/additive, brew_amount/6)
				//select the result
				//potions
				if(healthpot_weight >= 2)
					reagents.add_reagent(/datum/reagent/medicine/healthpot, brew_amount)
					potion_result = "metallic"
				if(manapot_weight >= 2)
					reagents.add_reagent(/datum/reagent/medicine/manapot, brew_amount)
					potion_result = "sweet"
				if(antidote_weight >= 2)
					reagents.add_reagent(/datum/reagent/medicine/antidote, (brew_amount/2))
					potion_result = "sickly sweet"
				if(diseasecure_weight >= 2)
					reagents.add_reagent(/datum/reagent/medicine/diseasecure, (brew_amount/2))
					potion_result = "dirt"
				//buff potions
				if(strength_weight >= 3)
					reagents.add_reagent(/datum/reagent/buff/strength, (brew_amount/10))
					potion_result = "stew"
				if(perception_weight >= 3)
					reagents.add_reagent(/datum/reagent/buff/perception, (brew_amount/10))
					potion_result = "burnt"
				if(intelligence_weight >= 3)
					reagents.add_reagent(/datum/reagent/buff/intelligence, (brew_amount/10))
					potion_result = "energy"
				if(constitution_weight >= 3)
					reagents.add_reagent(/datum/reagent/buff/constitution, (brew_amount/10))
					potion_result = "sour"
				if(endurance_weight >= 3)
					reagents.add_reagent(/datum/reagent/buff/endurance, (brew_amount/10))
					potion_result = "vinegar"
				if(speed_weight >= 3)
					reagents.add_reagent(/datum/reagent/buff/speed, (brew_amount/10))
					potion_result = "acidic"
				if(fortune_weight >= 3)
					reagents.add_reagent(/datum/reagent/buff/fortune, (brew_amount/10))
					potion_result = "fortune!"
				//poisons
				if(poison_weight >= 2)
					reagents.add_reagent(/datum/reagent/berrypoison, (brew_amount/6))
					potion_result = "death"
				//handle player perception and reset for next time
				src.visible_message("<span class='info'>The cauldron finishes boiling with a faint [potion_result] smell.</span>")
//give xp for /datum/skill/craft/alchemy
				playsound(src, "bubbles", 100, TRUE)
				playsound(src,'sound/misc/smelter_fin.ogg', 30, FALSE)
				ingredients = list()
				brew_amount = 45
				brewing = 21

/obj/machinery/light/rogue/cauldron/attackby(obj/item/I, mob/user, params)
	if(I.possible_potion)
		if(ingredients.len >= maxingredients)
			to_chat(user, "<span class='warning'>Nothing else can fit.</span>")
			return TRUE
		for(var/obj/item/x in ingredients)
			if(x)
				if(I.name == x.name)
					to_chat(user, "<span class='warning'>There's already [I] in the cauldron!</span>")
					return TRUE
		if(!user.transferItemToLoc(I,src))
			to_chat(user, "<span class='warning'>[I] is stuck to my hand!</span>")
			return TRUE
		to_chat(user, "<span class='info'>I add [I] to [src].</span>")
		ingredients += I
		brewing = 0
		playsound(src, "bubbles", 100, TRUE)
		return TRUE
	..()

/obj/machinery/light/rogue/cauldron/attack_hand(mob/user, params)
	if(on)
		if(ingredients.len)
			to_chat(user, "<span class='warning'>Something's brewing.</span>")
			return
		else
			to_chat(user, "<span class='info'>Nothing's brewing.</span>")
			return
	else
		if(ingredients.len)
			var/obj/item/I = ingredients[ingredients.len]
			ingredients -= I
			I.loc = user.loc
			user.put_in_active_hand(I)
			user.visible_message("<span class='info'>[user] pulls [I] from [src].</span>")
			return
		to_chat(user, "<span class='info'>It's empty.</span>")
		return ..()

/datum/crafting_recipe/roguetown/cauldron
	name = "cauldron"
	result = /obj/machinery/light/rogue/cauldron
	reqs = list(/obj/item/ingot/iron = 2,
				/obj/item/natural/stone = 4,
				/obj/item/grown/log/tree/small = 1)
	verbage = "crafts"
	time = 50
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/masonry
