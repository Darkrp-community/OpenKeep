//genstuff
/obj/effect/landmark/mapGenerator/rogue/decap
	mapGeneratorType = /datum/mapGenerator/decap
	endTurfX = 255
	endTurfY = 255
	startTurfX = 1
	startTurfY = 1


/datum/mapGenerator/decap
	modules = list(/datum/mapGeneratorModule/ambushing,/datum/mapGeneratorModule/abovemountain,/datum/mapGeneratorModule/undermountain)


/datum/mapGeneratorModule/abovemountain
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	include_subtypes = FALSE
	allowed_turfs = list(/turf/open/floor/rogue/snow,/turf/open/floor/rogue/grass/cold,/turf/open/floor/rogue/snow/patchy)
	spawnableAtoms = list(/obj/structure/flora/roguetree/burnt = 30,
							/obj/structure/flora/roguegrass/bush_meagre = 25,
							/obj/structure/flora/roguegrass = 23,
							/obj/structure/flora/roguegrass/snow = 13,
							/obj/structure/flora/roguegrass/herb = 2,
							/obj/item/natural/stone = 23,
							/obj/item/natural/rock/random_ore = 4,
							/obj/item/natural/rock = 8,
							/obj/item/grown/log/tree/stick = 8,
							/obj/structure/flora/roguegrass/pyroclasticflowers = 20)
	allowed_areas = list(/area/rogue/outdoors/mountains/decap,/area/rogue/outdoors/mountains/anvil/snowy)

/datum/mapGeneratorModule/undermountain
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt,/turf/open/floor/rogue/cobblerock)
	spawnableAtoms = list(/obj/item/natural/stone = 10,
							/obj/item/natural/rock = 5,
							/obj/item/natural/rock/random_ore = 3,
							/obj/structure/flora/rogueshroom = 5)
	spawnableTurfs = list(/turf/open/lava = 2)
	allowed_areas = list(/area/rogue/under/mountains/anvil/lower)
