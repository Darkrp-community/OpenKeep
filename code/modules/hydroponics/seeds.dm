// ********************************************************
// Here's all the seeds (plants) that can be used in hydro
// ********************************************************

/obj/item/reagent_containers/food/snacks/grown/citrus/lime
/obj/item/reagent_containers/food/snacks/grown/citrus
/obj/item/reagent_containers/food/snacks/grown/citrus/lemon
/obj/item/reagent_containers/food/snacks/grown/chili
/obj/item/reagent_containers/food/snacks/grown/corn
/obj/item/reagent_containers/food/snacks/grown/pumpkin
/obj/item/reagent_containers/food/snacks/grown/pineapple
/obj/item/reagent_containers/food/snacks/grown/nettle
/obj/item/reagent_containers/food/snacks/grown/nettle/death
/obj/item/reagent_containers/food/snacks/grown/kudzupod
/obj/item/reagent_containers/food/snacks/grown/shell/eggy
/obj/item/reagent_containers/food/snacks/grown/tomato
/obj/item/reagent_containers/food/snacks/grown/tomato/blue
/obj/item/reagent_containers/food/snacks/grown/tomato/blue/bluespace
/obj/item/reagent_containers/food/snacks/grown/ghost_chili
/obj/item/reagent_containers/food/snacks/grown/icepepper
/obj/item/reagent_containers/food/snacks/grown/chili
/obj/item/reagent_containers/food/snacks/grown/koibeans
/obj/item/reagent_containers/food/snacks/grown/banana
/obj/item/reagent_containers/food/snacks/grown/banana/bluespace
/obj/item/reagent_containers/food/snacks/grown/apple/gold
/obj/item/reagent_containers/food/snacks/grown/ambrosia
/obj/item/reagent_containers/food/snacks/grown/ambrosia/gaia
/obj/item/reagent_containers/food/snacks/grown/anbrosioa/vulgaris
/obj/machinery/vending/hydroseeds
/obj/structure/bonfire
/obj/item/reagent_containers/food/snacks/grown/ambrosia/vulgaris
/obj/item/reagent_containers/food/snacks/grown/cannabis
/obj/item/reagent_containers/food/snacks/grown/cannabis/white
/obj/item/reagent_containers/food/snacks/grown/cannabis/death
/obj/item/reagent_containers/food/snacks/grown/cannabis/ultimate
/obj/item/reagent_containers/food/snacks/grown/cannabis/white
/obj/item/reagent_containers/food/snacks/grown/cannabis/death
/obj/item/reagent_containers/food/snacks/grown/cannabis/ultimate
/obj/item/reagent_containers/food/snacks/grown/citrus/orange
/obj/item/reagent_containers/food/snacks/grown/watermelon
/obj/item/reagent_containers/food/snacks/grown/holymelon
/obj/item/reagent_containers/food/snacks/grown/citrus/orange
/obj/item/reagent_containers/food/snacks/grown/watermelon
/obj/item/seeds/nettle
/obj/item/seeds/replicapod
/obj/item/seeds/replicapod
/obj/item/seeds/replicapod
/obj/item/seeds/bamboo
/obj/item/seeds/eggplant/eggy
/obj/item/seeds/rainbow_bunch
/obj/item/seeds/rainbow_bunch
/obj/item/seeds/random
/obj/item/seeds/random
/obj/item/seeds/chili
/obj/item/seeds/cotton
/obj/item/seeds/corn
/obj/item/seeds/soya
/obj/item/seeds/sugarcane
/obj/item/vending_refill/hydroseeds
/obj/item/reagent_containers/food/snacks/grown/cannabis
/obj/item/reagent_containers/food/snacks/grown/cannabis/rainbow
/obj/item/reagent_containers/food/snacks/grown/cannabis/white
/obj/item/grown/bananapeel/specialpeel
/obj/item/reagent_containers/food/snacks/grown/parsnip
/obj/item/reagent_containers/food/snacks/grown/soybeans
/obj/machinery/crop
/obj/item/seeds/banana/bluespace
/obj/item/seeds/banana
/obj/item/seeds/tower
/obj/item/seeds/starthistle
/obj/item/seeds/nettle/death
/obj/item/seeds/kudzu
/datum/plant_gene/reagent/polypyr
/datum/plant_gene/reagent/liquidelectricity
/datum/plant_gene/trait/plant_type/carnivory
/obj/item/seeds/gatfruit
/obj/item/seeds/cherry/bomb
/obj/item/reagent_containers/food/snacks/grown/cherry_bomb
/obj/item/reagent_containers/food/snacks/grown/firelemon
/obj/item/disk/plantgene
/obj/item/reagent_containers/food/snacks/grown/cocoapod
/obj/item/reagent_containers/food/snacks/grown/vanillapod
/obj/item/reagent_containers/food/snacks/grown/cocoapod
/obj/item/reagent_containers/food/snacks/grown/cocoapod
/obj/machinery/plantgenes
/obj/machinery/seed_extractor
/obj/item/grown/corncob
/obj/item/reagent_containers/food/snacks/grown/ambrosia/deus
/datum/crafting_recipe/food/mimetart
/datum/crafting_recipe/food/berrytart
/datum/crafting_recipe/food/cocolavatart
/datum/crafting_recipe/food/clowncake
/datum/crafting_recipe/food/vanillacake
/datum/plant_gene/trait/plant_type/fungal_metabolism
/datum/plant_gene/core/yield
/obj/item/seeds/firelemon
/datum/plant_gene/trait/plant_type/weed_hardy
/datum/plant_gene/trait/repeated_harvest
/obj/structure/punji_sticks
/datum/plant_gene/trait/glow

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
