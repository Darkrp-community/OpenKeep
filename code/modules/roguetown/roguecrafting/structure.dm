
/datum/crafting_recipe/roguetown/structure
	req_table = FALSE

/datum/crafting_recipe/roguetown/structure/TurfCheck(mob/user, turf/T)
	if(istype(T,/turf/open/transparent/openspace))
		return FALSE
	return ..()

/obj/structure/fermenting_barrel/crafted
	sellprice = 6

/datum/crafting_recipe/roguetown/structure/dye_bin_luxury
	name = "luxury dye bin"
	result = /obj/machinery/dye_bin
	reqs = list(/obj/item/grown/log/tree/small = 1,
	/obj/item/reagent_containers/food/snacks/produce/fyritius = 3,
	/obj/item/reagent_containers/food/snacks/produce/pear = 3,
	/obj/item/reagent_containers/food/snacks/produce/sunflower = 3,)
	verbage = "construct"
	verbage_tp = "carpents"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 0
	subtype_reqs = TRUE // so you can use any subtype of the berries and swampweed

/obj/item/chair/rogue/crafted
	sellprice = 6

/obj/item/chair/stool/bar/rogue/crafted
	sellprice = 6

/datum/crafting_recipe/roguetown/structure/anvil
	name = "anvil"
	result = /obj/machinery/anvil
	reqs = list(/obj/item/ingot/iron = 1)

	verbage = "build"
	verbage_tp = "builds"
	craftsound = 'sound/foley/Building-01.ogg'


/obj/structure/closet/crate/chest/crafted
	name = "sturdy chest"
	icon_state = "chest_neu"
	base_icon_state = "chest_neu"
	keylock = FALSE
	sellprice = 6

/obj/structure/closet/crate/roguecloset/crafted
	sellprice = 6

/datum/crafting_recipe/roguetown/structure/campfire
	name = "campfire"
	result = /obj/machinery/light/rogue/campfire
	reqs = list(/obj/item/grown/log/tree/stick = 2)
	verbage = "build"
	verbage_tp = "builds"
	craftdiff = 0

/datum/crafting_recipe/roguetown/structure/densefire
	name = "greater campfire"
	result = /obj/machinery/light/rogue/campfire/densefire
	reqs = list(/obj/item/grown/log/tree/stick = 2,
				/obj/item/natural/stone = 2)
	verbage = "build"
	verbage_tp = "builds"

/datum/crafting_recipe/roguetown/structure/cookpit
	name = "cookpit"
	result = /obj/machinery/light/rogue/hearth
	reqs = list(/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/stone = 3)
	verbage = "build"
	verbage_tp = "builds"
	craftdiff = 0

/datum/crafting_recipe/roguetown/structure/brazier
	name = "brazier"
	result = /obj/machinery/light/rogue/firebowl/stump
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/rogueore/coal = 1)
	verbage = "build"
	verbage_tp = "builds"

/datum/crafting_recipe/roguetown/structure/dryingrack
	name = "drying rack"
	result = /obj/structure/fluff/dryingrack
	reqs = list(/obj/item/grown/log/tree/stick = 3)
	verbage = "construct"
	verbage_tp = "constructs"
	craftsound = 'sound/foley/Building-01.ogg'

/datum/crafting_recipe/roguetown/structure/bed
	name = "bed"
	result = /obj/structure/bed/rogue/shit
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/fibers = 1)
	verbage = "carpent"
	verbage_tp = "carpents"
	craftsound = 'sound/foley/Building-01.ogg'
	craftdiff = 0

/datum/crafting_recipe/roguetown/structure/millstone
	name = "millstone"
	result = /obj/structure/fluff/millstone
	reqs = list(/obj/item/natural/stone = 3)
	verbage = "mason"
	verbage_tp = "masons"
	craftsound = null
	skillcraft = /datum/skill/craft/masonry
