// ********************************************************
// Here's all the seeds (plants) that can be used in hydro
// ********************************************************

// TO DO
/obj/item/seeds/glowshroom/glowcap
/obj/item/grown/bananapeel
/obj/item/reagent_containers/food/snacks/grown/banana
/obj/item/grown/bananapeel/bombanana

/obj/item/seeds
	var/plantname = "Plants"		// Name of plant when planted.
	var/obj/item/product						// A type path. The thing that is created when the plant is harvested.
	var/productdesc
	var/species = ""				// Used to update icons. Should match the name in the sprites unless all icon_* are overridden.

	var/growing_icon = 'icons/obj/hydroponics/growing.dmi' //the file that stores the sprites of the growing plant from this seed.
	var/icon_grow					// Used to override grow icon (default is "[species]-grow"). You can use one grow icon for multiple closely related plants with it.
	var/icon_dead					// Used to override dead icon (default is "[species]-dead"). You can use one dead icon for multiple closely related plants with it.
	var/icon_harvest				// Used to override harvest icon (default is "[species]-harvest"). If null, plant will use [icon_grow][growthstages].

	var/watersucc = 1
	var/foodsucc = 1
	var/growthrate = 1 //0.5, 1.3, etc its multilpeid
	var/maxphp = 100
	var/obscura = FALSE
	var/delonharvest = TRUE
	var/timesharvested = 0

	var/lifespan = 25				// How long before the plant begins to take damage from age.
	var/endurance = 15				// Amount of health the plant has.
	var/maturation = 6				// Used to determine which sprite to switch to when growing.
	var/production = 6				// Changes the amount of time needed for a plant to become harvestable.
	var/yield = 3					// Amount of growns created per harvest. If is -1, the plant/shroom/weed is never meant to be harvested.
	var/potency = 10				// The 'power' of a plant. Generally effects the amount of reagent in a plant, also used in other ways.
	var/growthstages = 6			// Amount of growth sprites the plant has.
	var/rarity = 0					// How rare the plant is. Used for giving points to cargo when shipping off to CentCom.
	var/list/mutatelist = list()	// The type of plants that this plant can mutate into.
	var/list/genes = list()			// Plant genes are stored here, see plant_genes.dm for more info.
	var/list/reagents_add = list()
	// A list of reagents to add to product.
	// Format: "reagent_id" = potency multiplier
	// Stronger reagents must always come first to avoid being displaced by weaker ones.
	// Total amount of any reagent in plant is calculated by formula: 1 + round(potency * multiplier)

	var/weed_rate = 20 //If the chance below passes, then this many weeds sprout during growth
	var/weed_chance = 5 //Percentage chance per tray update to grow weeds


/obj/item/seeds/proc/Copy()
	return 

/obj/item/seeds/proc/get_gene(typepath)
	return


/obj/item/seeds/proc/reagents_from_genes()
	return

///This proc adds a mutability_flag to a gene
/obj/item/seeds/proc/set_mutability(typepath, mutability)
	return

///This proc removes a mutability_flag from a gene
/obj/item/seeds/proc/unset_mutability(typepath, mutability)
	return

/obj/item/seeds/proc/mutate()

/obj/item/seeds/bullet_act(obj/projectile/Proj) //Works with the Somatoray to modify plant variables.
	return

// Harvest procs
/obj/item/seeds/proc/getYield()
	return

/obj/item/seeds/proc/harvest(mob/user)
	return

/obj/item/seeds/proc/prepare_result(obj/item/T)
	return

/// Setters procs ///
/obj/item/seeds/proc/adjust_yield(adjustamt)
	return

/obj/item/seeds/proc/adjust_lifespan(adjustamt)
	return

/obj/item/seeds/proc/adjust_endurance(adjustamt)
	return

/obj/item/seeds/proc/adjust_production(adjustamt)
	return

/obj/item/seeds/proc/adjust_potency(adjustamt)
	return

/obj/item/seeds/proc/adjust_weed_rate(adjustamt)
	return

/obj/item/seeds/proc/adjust_weed_chance(adjustamt)
	return

//Directly setting stats

/obj/item/seeds/proc/set_yield(adjustamt)
	return

/obj/item/seeds/proc/set_lifespan(adjustamt)
	return

/obj/item/seeds/proc/set_endurance(adjustamt)
	return

/obj/item/seeds/proc/set_production(adjustamt)
	return

/obj/item/seeds/proc/set_potency(adjustamt)
	return

/obj/item/seeds/proc/set_weed_rate(adjustamt)
	return

/obj/item/seeds/proc/set_weed_chance(adjustamt)
	return

/obj/item/seeds/proc/get_analyzer_text()  //in case seeds have something special to tell to the analyzer
	return

/obj/item/seeds/proc/on_chem_reaction(datum/reagents/S)  //in case seeds have some special interaction with special chems
	return

// Checks plants for broken tray icons. Use Advanced Proc Call to activate.
// Maybe some day it would be used as unit test.
/proc/check_plants_growth_stages_icons()
	return

/obj/item/seeds/proc/randomize_stats()
	return
/obj/item/seeds/proc/add_random_reagents(lower = 0, upper = 2)
	return

/obj/item/seeds/proc/add_random_traits(lower = 0, upper = 2)
	return
/obj/item/seeds/proc/add_random_plant_type(normal_plant_chance = 75)
	return
