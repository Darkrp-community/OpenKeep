/obj/item/alch
	name = "dust"
	desc = ""
	icon = 'icons/roguetown/misc/alchemy.dmi'
	icon_state = "irondust"
	w_class = WEIGHT_CLASS_TINY
	dust_result = null

//pestle recipes
/obj/item/seeds
	dust_result = /obj/item/alch/seeddust
	
/obj/item/reagent_containers/food/snacks/grown/rogue/sweetleaf
	dust_result = /obj/item/alch/sweetdust

/obj/item/reagent_containers/food/snacks/grown/rogue/sweetleafdry
	dust_result = /obj/item/alch/sweetdust

/obj/item/reagent_containers/food/snacks/grown/rogue/pipeweed
	dust_result = /obj/item/alch/tobaccodust

/obj/item/reagent_containers/food/snacks/grown/rogue/pipeweeddry
	dust_result = /obj/item/alch/tobaccodust

/obj/item/rogueore/gold
	dust_result = /obj/item/alch/golddust

/obj/item/ingot/gold
	dust_result = /obj/item/alch/golddust

/obj/item/rogueore/silver
	dust_result = /obj/item/alch/silverdust

/obj/item/ingot/silver
	dust_result = /obj/item/alch/silverdust

/obj/item/rogueore/iron
	dust_result = /obj/item/alch/irondust

/obj/item/ingot/iron
	dust_result = /obj/item/alch/irondust

/obj/item/rogueore/coal
	dust_result = /obj/item/alch/coaldust

/obj/item/rune/spell/fire_rune
	dust_result = /obj/item/alch/firedust

/obj/item/rune/spell/air_rune
	dust_result = /obj/item/alch/airdust

/obj/item/rune/spell/water_rune
	dust_result = /obj/item/alch/waterdust

/obj/item/rune/spell/earth_rune
	dust_result = /obj/item/alch/earthdust

/obj/item/rune/spell/blank_rune
	dust_result = /obj/item/alch/runedust

//potion ingredients, sorted by potion

/obj/item/alch/viscera
	name = "viscera"
	icon_state = "viscera"
	possible_potion = "healthpot"

/obj/item/natural/chaff/wheat
	possible_potion = "healthpot"

/obj/item/alch/waterdust
	name = "water rune dust"
	icon_state = "runedust"
	possible_potion = "stronghealth"

/obj/item/alch/bonemeal
	name = "bone meal"
	icon_state = "bonemeal"
	possible_potion = "manapot"

/obj/item/alch/seeddust
	name = "seed dust"
	icon_state = "seeddust"
	possible_potion = "manapot"

/obj/item/alch/runedust
	name = "rune dust"
	icon_state = "runedust"
	possible_potion = "strongmana"

/obj/item/reagent_containers/food/snacks/grown/berries
	possible_potion = "antidote"

/obj/item/alch/coaldust
	name = "coal dust"
	icon_state = "coaldust"
	possible_potion = "antidote"

/obj/item/ash
	possible_potion = "diseasecure"

/obj/item/alch/silverdust
	name = "silver dust"
	icon_state = "silverdust"
	possible_potion = "diseasecure"

/obj/item/alch/magicdust
	name = "magicdust"
	//icon_state = "magicdust"
	possible_potion = "buffpot"

/obj/item/alch/firedust
	name = "fire rune dust"
	icon_state = "runedust"
	possible_potion = "bodycomp"

/obj/item/alch/sinew
	name = "sinew"
	icon_state = "sinew"
	dropshrink = 0.5
	dust_result = /obj/item/alch/viscera
	possible_potion = "strpot"

/obj/item/alch/irondust
	name = "iron dust"
	icon_state = "irondust"
	possible_potion = "strpot"

/obj/item/reagent_containers/powder/moondust_purest
	possible_potion = "spdpot"

/obj/item/reagent_containers/powder/flour/salt
	possible_potion = "spdpot"

/obj/item/alch/airdust
	name = "air rune dust"
	icon_state = "runedust"
	possible_potion = "mindcomp"

/obj/item/alch/sweetdust
	name = "sweet leaf dust"
	icon_state = "tobaccodust"
	possible_potion = "intpot"

/obj/item/reagent_containers/moondust
	possible_potion = "intpot"

/obj/item/reagent_containers/powder/ozium
	possible_potion = "perpot"

/obj/item/alch/tobaccodust
	name = "tobacco dust"
	icon_state = "tobaccodust"
	possible_potion = "perpot"

/obj/item/alch/earthdust
	name = "earth rune dust"
	//icon_state = "earthdust"
	possible_potion = "spiritcomp"

/obj/item/alch/bone
	name = "tail bone"
	icon_state = "bone"
	desc = "The only bone in creachers with alchemical properties."
	force = 7
	throwforce = 5
	w_class = WEIGHT_CLASS_SMALL
	dust_result = /obj/item/alch/bonemeal
	possible_potion = "conpot"

/obj/item/reagent_containers/food/snacks/fish
	possible_potion = "conpot"

/obj/item/natural/worms/leeches
	possible_potion = "endpot"

/obj/item/reagent_containers/food/snacks/grown/apple
	possible_potion = "endpot"

/obj/item/natural/dirtclod
	possible_potion = "poison"

/obj/item/reagent_containers/food/snacks/grown/berries/poison
	possible_potion = "poison"

/obj/item/seeds/berry/poison
	possible_potion = "poison"

/obj/item/reagent_containers/food/snacks/grown/rogue/sweetleaf
	possible_potion = "poison"

/obj/item/reagent_containers/food/snacks/grown/rogue/pipeweed
	possible_potion = "poison"

//Modifier ingredients
/obj/item/alch/golddust
	name = "gold dust"
	icon_state = "golddust"
	possible_potion = "strong"

/obj/item/alch/feaudust
	name = "feau dust"
	icon_state = "feaudust"
	possible_potion = "long"

//dust mix crafting
/datum/crafting_recipe/roguetown/alch/feaudust
	name = "feau dust"
	result = list(/obj/item/alch/feaudust,
				/obj/item/alch/feaudust)
	reqs = list(/obj/item/alch/irondust = 2,
				/obj/item/alch/golddust = 1)
	structurecraft = /obj/structure/table/wood
	verbage = "mixes"
	craftsound = 'sound/foley/scribble.ogg'
	skillcraft = /datum/skill/craft/alchemy
	craftdiff = 0

/datum/crafting_recipe/roguetown/alch/magicdust
	name = "magic dust"
	result = list(/obj/item/alch/magicdust)
	reqs = list(/obj/item/alch/waterdust = 1, /obj/item/alch/firedust = 1,
				/obj/item/alch/airdust = 1, /obj/item/alch/earthdust = 1)
	structurecraft = /obj/structure/table/wood
	verbage = "mixes"
	craftsound = 'sound/foley/scribble.ogg'
	skillcraft = /datum/skill/craft/alchemy
	craftdiff = 0
