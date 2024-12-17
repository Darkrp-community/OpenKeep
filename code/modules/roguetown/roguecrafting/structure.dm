
/datum/crafting_recipe/roguetown/structure
	req_table = FALSE
	craftdiff = 0

/datum/crafting_recipe/roguetown/structure/TurfCheck(mob/user, turf/T)
	if(istype(T,/turf/open/transparent/openspace))
		return FALSE
	return ..()

/*========= CARPENTRY SKILL ==========*/

/datum/crafting_recipe/roguetown/structure/stool
	name = "wooden stool"
	result = /obj/item/chair/stool/bar/rogue/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1)
	skillcraft = /datum/skill/craft/carpentry
	verbage = "carpent"
	verbage_tp = "carpents"
	craftsound = 'sound/foley/Building-01.ogg'

/obj/item/chair/stool/bar/rogue/crafted
	sellprice = 6

/* === SKILL LEVEL 1 === */

/datum/crafting_recipe/roguetown/structure/chair
	name = "wooden chair"
	result = /obj/item/chair/rogue/crafted
	reqs = list(/obj/item/natural/plank = 2)
	verbage = "carpent"
	verbage_tp = "carpents"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 1

/obj/item/chair/rogue/crafted
	sellprice = 6

/datum/crafting_recipe/roguetown/structure/composter
	name = "composter"
	result = /obj/structure/composter
	reqs = list(/obj/item/grown/log/tree/small = 1)
	time = 3 SECONDS
	craftdiff = 1

/datum/crafting_recipe/roguetown/roguebin // Bins are easier to craft than barrels for pure convenience.
	name = "wooden bin"
	result = /obj/item/roguebin
	reqs = list(/obj/item/grown/log/tree/small = 2)
	verbage = "construct"
	verbage_tp = "makes"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 1

/datum/crafting_recipe/roguetown/structure/table
	name = "wooden table"
	result = /obj/structure/table/wood/crafted
	reqs = list(/obj/item/natural/plank = 2)
	verbage = "carpent"
	verbage_tp = "carpents"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 1

/datum/crafting_recipe/roguetown/structure/wallladder
	name = "wall ladder"
	result = /obj/structure/wallladder
	reqs = list(/obj/item/grown/log/tree/small = 1)
	verbage = "carpent"
	verbage_tp = "carpents"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/carpentry
	wallcraft = TRUE
	craftdiff = 1

/datum/crafting_recipe/roguetown/structure/sign
	name = "custom sign"
	result = /obj/structure/fluff/customsign
	reqs = list(/obj/item/grown/log/tree/small = 1)
	verbage = "construct"
	verbage_tp = "constructs"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 1

/datum/crafting_recipe/roguetown/structure/chest
	name = "chest"
	result = /obj/structure/closet/crate/chest/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1)
	verbage = "construct"
	verbage_tp = "constructs"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 1

/obj/structure/closet/crate/chest/crafted
	name = "sturdy chest"
	icon_state = "chest_neu"
	base_icon_state = "chest_neu"
	keylock = FALSE
	sellprice = 6

/datum/crafting_recipe/roguetown/structure/closet
	name = "closet"
	result = /obj/structure/closet/crate/roguecloset/crafted
	reqs = list(/obj/item/natural/plank = 2)
	verbage = "construct"
	verbage_tp = "constructs"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 1

/obj/structure/closet/crate/roguecloset/crafted
	sellprice = 6

/datum/crafting_recipe/roguetown/structure/coffin
	name = "wooden coffin"
	result = /obj/structure/closet/crate/coffin
	reqs = list(/obj/item/natural/plank=3)
	verbage = "construct"
	verbage_tp = "constructs"
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 1

/datum/crafting_recipe/roguetown/structure/psycrss
	name = "wooden cross"
	result = /obj/structure/fluff/psycross/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/grown/log/tree/stake = 3)
	verbage = "carpent"
	verbage_tp = "carpents"
	craftsound = 'sound/foley/Building-01.ogg'
	craftdiff = 1

/datum/crafting_recipe/roguetown/structure/loom
	name = "loom"
	result = /obj/machinery/loom
	reqs = list(/obj/item/grown/log/tree/small = 2,
				/obj/item/grown/log/tree/stick = 2,
				/obj/item/natural/fibers = 2)

	verbage = "constructs"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 1

/datum/crafting_recipe/roguetown/structure/dummy // Easier to craft than display dummies for convenience, and also because a training dummy isn't actually fitting any measurements. You're just smacking it.
	name = "training dummy"
	result = /obj/structure/fluff/statue/tdummy
	reqs = list(/obj/item/grown/log/tree/small = 1)
	verbage = "construct"
	verbage_tp = "constructs"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 1

/* === SKILL LEVEL 2 === */

/datum/crafting_recipe/roguetown/structure/display_stand
	name = "display stand"
	result = /obj/structure/mannequin
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/grown/log/tree/stick = 3)
	verbage = "construct"
	verbage_tp = "constructs"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2

/datum/crafting_recipe/roguetown/structure/mannequin
	name = "masculine mannequin"
	result = /obj/structure/mannequin/male
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/cloth = 1,
				/obj/item/ingot/iron = 1)
	verbage = "construct"
	verbage_tp = "constructs"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2

/datum/crafting_recipe/roguetown/structure/mannequin_f
	name = "feminine mannequin"
	result = /obj/structure/mannequin/male/female
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/cloth = 1,
				/obj/item/ingot/iron = 1)
	verbage = "construct"
	verbage_tp = "constructs"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2

/datum/crafting_recipe/roguetown/structure/handcart
	name = "handcart"
	result = /obj/structure/handcart
	reqs = list(/obj/item/grown/log/tree/small = 3,
				/obj/item/rope = 1)
	verbage = "carpent"
	verbage_tp = "carpents"
	craftsound = 'sound/foley/Building-01.ogg'
	craftdiff = 2

/datum/crafting_recipe/roguetown/structure/barrel
	name = "wooden barrel"
	result = /obj/structure/fermenting_barrel/crafted
	reqs = list(/obj/item/natural/plank=2)
	verbage = "construct"
	verbage_tp = "makes"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2

/obj/structure/fermenting_barrel/crafted
	sellprice = 6

/datum/crafting_recipe/roguetown/structure/stairsd
	name = "stairs"
	result = /obj/structure/stairs/d
	reqs = list(/obj/item/grown/log/tree/small = 1)
	skillcraft = /datum/skill/craft/carpentry
	verbage = "construct"
	verbage_tp = "constructs"
	craftsound = 'sound/foley/Building-01.ogg'
	ontile = TRUE

/datum/crafting_recipe/roguetown/structure/stairsd/TurfCheck(mob/user, turf/T)
	var/turf/checking = get_step(T, user.dir)
	if(!checking)
		return FALSE
	if(!istype(checking,/turf/open/transparent/openspace))
		return FALSE
	checking = get_step_multiz(checking, DOWN)
	if(!checking)
		return FALSE
	if(!isopenturf(checking))
		return FALSE
	if(istype(checking,/turf/open/transparent/openspace))
		return FALSE
	for(var/obj/structure/S in checking)
		if(istype(S, /obj/structure/stairs))
			return FALSE
		if(S.density)
			return FALSE
	return TRUE

/datum/crafting_recipe/roguetown/structure/nicebed
	name = "nice bed"
	result = /obj/structure/bed/rogue
	reqs = list(/obj/item/natural/plank=2,
				/obj/item/natural/cloth = 1)
	tools = list(/obj/item/needle)
	verbage = "carpent"
	verbage_tp = "carpents"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2

/datum/crafting_recipe/roguetown/structure/door
	name = "wooden door"
	result = /obj/structure/mineral_door/wood/deadbolt
	reqs = list(/obj/item/natural/plank=2)
	verbage = "carpent"
	verbage_tp = "carpents"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2

/*========= MASONRY SKILL ==========*/

/datum/crafting_recipe/roguetown/structure/millstone
	name = "millstone"
	result = /obj/structure/fluff/millstone
	reqs = list(/obj/item/natural/stone = 3)
	verbage = "mason"
	verbage_tp = "masons"
	craftsound = null
	skillcraft = /datum/skill/craft/masonry
	craftdiff = 1

/datum/crafting_recipe/roguetown/structure/cauldron
	name = "cauldron"
	result = /obj/machinery/light/rogue/cauldron
	reqs = list(/obj/item/ingot/iron = 2,
				/obj/item/natural/stone = 4,
				/obj/item/grown/log/tree/small = 1)
	verbage = "craft"
	verbage_tp = "crafts"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/masonry
	craftdiff = 1

/datum/crafting_recipe/roguetown/structure/oven
	name = "oven"
	result = /obj/machinery/light/rogue/oven
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/stone = 3)
	verbage = "mason"
	verbage_tp = "masons"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/masonry
	wallcraft = TRUE
	craftdiff = 1

/datum/crafting_recipe/roguetown/structure/window
	name = "solid window"
	result = /obj/structure/roguewindow/solid
	reqs = list(/obj/item/natural/plank = 1,
				/obj/item/natural/glass = 1)
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/masonry
	craftdiff = 1

/datum/crafting_recipe/roguetown/structure/windowopen
	name = "openable window"
	result = /obj/structure/roguewindow/openclose
	reqs = list(/obj/item/natural/plank = 1,
				/obj/item/natural/glass = 1,
				/obj/item/ingot/iron = 1)
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/masonry
	craftdiff = 1

/datum/crafting_recipe/roguetown/structure/windowstained
	name = "stained glass window (silver)"
	result = /obj/structure/roguewindow/stained
	reqs = list(/obj/item/natural/stoneblock = 3,
				/obj/item/natural/glass = 2,
				/obj/item/ingot/silver = 1)
	skillcraft = /datum/skill/craft/masonry
	craftdiff = 2

/datum/crafting_recipe/roguetown/structure/stonetable
	name = "stone table (long mid)"
	result = /obj/structure/table/stone
	reqs = list(/obj/item/natural/stoneblock = 2)
	verbage = "build"
	verbage_tp = "builds"
	craftsound = 'sound/foley/Building-01.ogg'
	time = 4 SECONDS
	skillcraft = /datum/skill/craft/masonry
	craftdiff = 3
/datum/crafting_recipe/roguetown/structure/stonetable/end
	name = "stone table (long end)"
	result = /obj/structure/table/stone_end

/datum/crafting_recipe/roguetown/structure/stonetable/small
	name = "stone table (single)"
	result = /obj/structure/table/stone_small

/*========= MISCELLANY/CRAFTING SKILL ==========*/

/* === NO SKILL NEEDED === */

/datum/crafting_recipe/roguetown/structure/noose
	name = "noose"
	result = /obj/structure/noose
	reqs = list(/obj/item/rope = 1)
	verbage = "tie"
	verbage_tp = "ties"
	craftsound = 'sound/foley/noose_idle.ogg'
	ontile = TRUE

/datum/crafting_recipe/roguetown/structure/noose/TurfCheck(mob/user, turf/T)
	var/turf/checking = get_step_multiz(T, UP)
	if(!checking)
		return FALSE
	if(!isopenturf(checking))
		return FALSE
	if(istype(checking,/turf/open/transparent/openspace))
		return FALSE
	return TRUE

/datum/crafting_recipe/roguetown/structure/fence
	name = "palisade (s x2)"
	result = /obj/structure/fluff/railing/fence
	reqs = list(/obj/item/grown/log/tree/stake = 2)
	ontile = TRUE
	verbage = "build"
	verbage_tp = "builds"
	craftsound = 'sound/foley/Building-01.ogg'
	buildsame = TRUE

/datum/crafting_recipe/roguetown/structure/fencealt
	name = "palisade (l)"
	result = /obj/structure/fluff/railing/fence
	reqs = list(/obj/item/grown/log/tree/small = 1)
	ontile = TRUE
	verbage = "build"
	verbage_tp = "builds"
	craftsound = 'sound/foley/Building-01.ogg'
	buildsame = TRUE

/datum/crafting_recipe/roguetown/structure/bed // This one's not in carpentry because it's just a shitty pile of sticks and cloth.
	name = "bed"
	result = /obj/structure/bed/rogue/shit
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/fibers = 1)
	verbage = "carpent"
	verbage_tp = "carpents"
	craftsound = 'sound/foley/Building-01.ogg'

/datum/crafting_recipe/roguetown/structure/campfire
	name = "campfire"
	result = /obj/machinery/light/rogue/campfire
	reqs = list(/obj/item/grown/log/tree/stick = 2)
	verbage = "build"
	verbage_tp = "builds"

/datum/crafting_recipe/roguetown/structure/densefire
	name = "greater campfire"
	result = /obj/machinery/light/rogue/campfire/densefire
	reqs = list(/obj/item/grown/log/tree/stick = 2,
				/obj/item/natural/stone = 2)
	verbage = "build"
	verbage_tp = "builds"

/datum/crafting_recipe/roguetown/structure/pyre
	name = "wooden pyre"
	result = /obj/machinery/light/rogue/campfire/pyre
	reqs = list(/obj/item/grown/log/tree/small = 2,
				/obj/item/grown/log/tree/stake = 3)
	verbage = "carpent"
	verbage_tp = "carpents"
	craftsound = 'sound/foley/Building-01.ogg'

/* === SKILL LEVEL 1 === */

/datum/crafting_recipe/roguetown/structure/cookpit
	name = "cookpit"
	result = /obj/machinery/light/rogue/hearth
	reqs = list(/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/stone = 3)
	verbage = "build"
	verbage_tp = "builds"
	craftdiff = 1

/datum/crafting_recipe/roguetown/structure/brazier
	name = "brazier"
	result = /obj/machinery/light/rogue/firebowl/stump
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/rogueore/coal = 1)
	verbage = "build"
	verbage_tp = "builds"
	craftdiff = 1

/datum/crafting_recipe/roguetown/structure/dryingrack
	name = "drying rack"
	result = /obj/structure/fluff/dryingrack
	reqs = list(/obj/item/grown/log/tree/stick = 3)
	verbage = "construct"
	verbage_tp = "constructs"
	craftsound = 'sound/foley/Building-01.ogg'
	craftdiff = 1

/* === SKILL LEVEL 2 === */

/datum/crafting_recipe/roguetown/structure/anvil // Call me crazy, but I think there should be some difficulty involved in making these huge structures.
	name = "anvil"
	result = /obj/machinery/anvil
	reqs = list(/obj/item/ingot/iron = 1)

	verbage = "build"
	verbage_tp = "builds"
	craftsound = 'sound/foley/Building-01.ogg'
	craftdiff = 2

/datum/crafting_recipe/roguetown/structure/smelter
	name = "ore furnace"
	result = /obj/machinery/light/rogue/smelter
	reqs = list(/obj/item/natural/stone = 6,
			/obj/item/rogueore/coal = 1)
	verbage = "build"
	verbage_tp = "builds"
	craftsound = null
	craftdiff = 2

/datum/crafting_recipe/roguetown/structure/smelter_block
	name = "ore furnace"
	result = /obj/machinery/light/rogue/smelter
	reqs = list(/obj/item/natural/stoneblock = 4,
			/obj/item/rogueore/coal = 1)
	verbage = "build"
	verbage_tp = "builds"
	craftsound = null
	craftdiff = 2

/datum/crafting_recipe/roguetown/structure/forge
	name = "forge"
	result = /obj/machinery/light/rogue/forge
	reqs = list(/obj/item/natural/stoneblock = 4,
				/obj/item/rogueore/coal = 1)

	verbage = "build"
	verbage_tp = "builds"
	craftsound = null
	craftdiff = 2

/* === SKILL LEVEL 3 === */

/datum/crafting_recipe/roguetown/structure/sharpwheel
	name = "sharpening wheel"
	result = /obj/structure/fluff/grindwheel
	reqs = list(/obj/item/ingot/iron = 1,
				/obj/item/natural/stone = 1)

	verbage = "construct"
	verbage_tp = "constructs"
	craftsound = null
	craftdiff = 3

/datum/crafting_recipe/roguetown/structure/greatsmelter // I figure if you've already got a riddle of steel you're a mason making this anyway.
	name = "great furnace"
	result = /obj/machinery/light/rogue/smelter/great
	reqs = list(/obj/item/ingot/iron = 2,
				/obj/item/riddleofsteel = 1,
				/obj/item/rogueore/coal = 1)
	verbage = "build"
	verbage_tp = "builds"
	craftsound = null
	craftdiff = 3

/*
/datum/crafting_recipe/roguetown/structure/stairs
	name = "stairs (up)"
	result = /obj/structure/stairs
	reqs = list(/obj/item/grown/log/tree/small = 1)

	verbage = "carpents"
	craftsound = 'sound/foley/Building-01.ogg'
	ontile = TRUE

/datum/crafting_recipe/roguetown/structure/stairs/TurfCheck(mob/user, turf/T)
	var/turf/checking = get_step_multiz(T, UP)
	if(!checking)
		return FALSE
	if(!istype(checking,/turf/open/transparent/openspace))
		return FALSE
	checking = get_step(checking, user.dir)
	if(!checking)
		return FALSE
	if(!isopenturf(checking))
		return FALSE
	if(istype(checking,/turf/open/transparent/openspace))
		return FALSE
	for(var/obj/structure/S in checking)
		if(istype(S, /obj/structure/stairs))
			return FALSE
		if(S.density)
			return FALSE
	return TRUE
*/

/*========= ENGINEERING SKILL ==========*/

/datum/crafting_recipe/roguetown/structure/lever
	name = "lever"
	result = /obj/structure/lever
	reqs = list(/obj/item/roguegear = 1)
	verbage = "construct"
	verbage_tp = "constructs"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 1

/datum/crafting_recipe/roguetown/structure/trapdoor
	name = "floorhatch"
	result = /obj/structure/floordoor
	reqs = list(/obj/item/grown/log/tree/small = 1,
					/obj/item/roguegear = 1)
	verbage = "construct"
	verbage_tp = "constructs"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 1

/datum/crafting_recipe/roguetown/structure/pressureplate
	name = "pressure plate"
	result = /obj/structure/pressure_plate
	reqs = list(/obj/item/grown/log/tree/small = 1,
					/obj/item/roguegear = 1)
	verbage = "construct"
	verbage_tp = "constructs"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 1

/datum/crafting_recipe/roguetown/structure/repeater
	name = "repeater"
	result = /obj/structure/repeater
	reqs = list(/obj/item/grown/log/tree/small = 1,
					/obj/item/ingot/iron = 2,
					/obj/item/roguegear = 1)
	verbage = "construct"
	verbage_tp = "constructs"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 1

/datum/crafting_recipe/roguetown/structure/activator
	name = "activator"
	result = /obj/structure/activator
	reqs = list(/obj/item/grown/log/tree/small = 2,
					/obj/item/ingot/iron = 1,
					/obj/item/roguegear = 2)
	verbage = "construct"
	verbage_tp = "constructs"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 1

/datum/crafting_recipe/roguetown/structure/trapdoor/TurfCheck(mob/user, turf/T)
	if(istype(T,/turf/open/transparent/openspace))
		return TRUE
	if(istype(T,/turf/open/lava))
		return TRUE // its just too hilarious not to allow this
	return ..()

/datum/crafting_recipe/roguetown/structure/passage
	name = "passage"
	result = /obj/structure/bars/passage
	reqs = list(/obj/item/ingot/iron = 1,
					/obj/item/roguegear = 1)
	verbage = "build"
	verbage_tp = "builds"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 1

/datum/crafting_recipe/roguetown/structure/passage/TurfCheck(mob/user, turf/T)
	if(istype(T,/turf/open/transparent/openspace))
		return FALSE
	if(istype(T,/turf/open/lava))
		return FALSE
	if(istype(T,/turf/open/water))
		return FALSE
	return ..()
