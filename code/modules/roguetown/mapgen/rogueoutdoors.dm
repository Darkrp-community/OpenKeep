/obj/effect/landmark/mapGenerator/rogue/roguetownfield
	mapGeneratorType = /datum/mapGenerator/roguetownfield
	endTurfX = 255
	endTurfY = 255
	startTurfX = 1
	startTurfY = 1


/datum/mapGenerator/roguetownfield
	modules = list(/datum/mapGeneratorModule/ambushing,/datum/mapGeneratorModule/roguetownfield/grass,/datum/mapGeneratorModule/roguetowngrass,/datum/mapGeneratorModule/roguetownfield,/datum/mapGeneratorModule/roguetownfield/road,/datum/mapGeneratorModule/roguetownswampwaterturf,/datum/mapGeneratorModule/roguetownwaterturf)


/datum/mapGeneratorModule/roguetownfield
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/newtree = 5,
							/obj/structure/flora/roguegrass/bush_meagre = 13,
							/obj/structure/flora/roguegrass = 50,
							/obj/structure/flora/roguegrass/maneater = 1,
							/obj/structure/flora/roguegrass/pyroclasticflowers = 1,
							/obj/item/natural/stone = 8,
							/obj/item/natural/rock = 7,
							/obj/item/grown/log/tree/stick = 3,
							/obj/structure/closet/dirthole/closed/loot=12,
							/obj/item/restraints/legcuffs/beartrap/armed/camouflage=0.5)
	spawnableTurfs = list(/turf/open/floor/rogue/dirt/road=5)
	allowed_areas = list(/area/rogue/outdoors/rtfield)

/datum/mapGeneratorModule/roguetownfield/road
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt/road)
	excluded_turfs = list()
	spawnableAtoms = list(/obj/item/natural/stone = 8,
							/obj/item/grown/log/tree/stick = 3)
	allowed_areas = list(/area/rogue/outdoors/rtfield)

/datum/mapGeneratorModule/roguetownfield/grass
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/floor/rogue/dirt)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableTurfs = list(/turf/open/floor/rogue/grass = 15)
	allowed_areas = list(/area/rogue/outdoors/rtfield)

/datum/mapGeneratorModule/roguetowngrass
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/floor/rogue/grass)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/roguegrass = 20,
						/obj/structure/flora/roguegrass/maneater = 1,
							/obj/item/natural/stone = 7,
							/obj/item/grown/log/tree/stick = 3)
	allowed_areas = list(/area/rogue/outdoors/town,/area/rogue/outdoors/rtfield)

/datum/mapGeneratorModule/roguetownwaterturf
	clusterCheckFlags = CLUSTER_CHECK_SAME_ATOMS
	allowed_turfs = list(/turf/open/water/cleanshallow)
	excluded_turfs = list()
	allowed_areas = list(/area/rogue/outdoors/rtfield)
	spawnableAtoms = list(/obj/structure/flora/roguegrass/water = 20,
	                        /obj/structure/flora/roguegrass/water/reeds = 12,
	                        /obj/structure/kneestingers = 6)

/datum/mapGeneratorModule/roguetownswampwaterturf
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/water/swamp)
	excluded_turfs = list()
	allowed_areas = list(/area/rogue/outdoors/rtfield)
	spawnableAtoms = list(/obj/structure/flora/roguegrass/water = 20,
		                    /obj/structure/flora/roguegrass/water/reeds = 12,
	                        /obj/structure/kneestingers = 3)


// ----------------		STONEHAMLET	--------------------
/obj/effect/landmark/mapGenerator/rogue/stonehamlet
	mapGeneratorType = /datum/mapGenerator/stonehamlet
	endTurfX = 128
	endTurfY = 192
	startTurfX = 1
	startTurfY = 1

/datum/mapGenerator/stonehamlet
	modules = list(
		/datum/mapGeneratorModule/stonehamlet,
		/datum/mapGeneratorModule/stonehamlet/roadturf,
		/datum/mapGeneratorModule/stonehamlet/bonus_grassturfs,
		/datum/mapGeneratorModule/stonehamlet/bonus_ambushsturfs,
		/datum/mapGeneratorModule/stonehamlet_grassturf,
		/datum/mapGeneratorModule/stonehamlet_swampturf,
		/datum/mapGeneratorModule/stonehamlet_waterturf,
		/datum/mapGeneratorModule/stonehamlet_buriedtreasure,
		/datum/mapGeneratorModule/ambushing/hamlet)

/datum/mapGeneratorModule/stonehamlet
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(
							/obj/structure/flora/roguegrass/bush_meagre = 10,
							/obj/structure/flora/roguegrass = 20,
							/obj/item/natural/stone = 5,
							/obj/item/natural/rock = 3,
							/obj/item/grown/log/tree/stick = 2)
	spawnableTurfs = list(/turf/open/floor/rogue/dirt/road=5)
	allowed_areas = list(/area/rogue/outdoors/rtfield)

/datum/mapGeneratorModule/stonehamlet/roadturf
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt/road)
	excluded_turfs = list()
	spawnableAtoms = list(/obj/item/natural/stone = 3,
							/obj/item/grown/log/tree/stick = 2)
	allowed_areas = list(/area/rogue/outdoors/rtfield)

/datum/mapGeneratorModule/stonehamlet/bonus_grassturfs
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/floor/rogue/dirt)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableTurfs = list(/turf/open/floor/rogue/grass = 4)
	allowed_areas = list(/area/rogue/outdoors/rtfield)

/datum/mapGeneratorModule/stonehamlet/bonus_ambushsturfs
	allowed_areas = list(/area/rogue/outdoors/rtfield/spooky,/area/rogue/outdoors/rtfield/plague_district)
	spawnableTurfs = list(/turf/open/floor/rogue/dirt/ambush = 3)
	allowed_turfs = list(/turf/open/floor/rogue/dirt)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)

/datum/mapGeneratorModule/stonehamlet_buriedtreasure
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(
							/obj/structure/closet/dirthole/closed/loot=5)		// add more stuff I guess
	allowed_areas = list(/area/rogue/outdoors/rtfield/spooky, /area/rogue/outdoors/rtfield/outlaw)

/datum/mapGeneratorModule/stonehamlet_grassturf
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/floor/rogue/grass)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/roguegrass = 15,
							/obj/item/natural/stone = 6,
							/obj/item/grown/log/tree/stick = 2,
							/obj/structure/flora/rogueflower/lavendergrass = 0.5,
							/obj/structure/flora/rogueflower/ywflowers = 0.5,
							/obj/structure/flora/rogueflower/brflowers = 0.5,
							/obj/structure/flora/rogueflower/ppflowers = 0.5)
	allowed_areas = list(/area/rogue/outdoors/town,/area/rogue/outdoors/rtfield)

/datum/mapGeneratorModule/stonehamlet_swampturf
	clusterCheckFlags = CLUSTER_CHECK_SAME_ATOMS
	allowed_turfs = list(/turf/open/water/swamp)
	excluded_turfs = list()
	allowed_areas = list(/area/rogue/outdoors/rtfield/boggish)
	spawnableAtoms = list(/obj/structure/flora/roguegrass/water = 12,
	                        /obj/structure/flora/roguegrass/water/reeds = 8,
							/obj/structure/flora/roguegrass/stalky = 4,
	                        /obj/structure/kneestingers = 4,
							/obj/structure/flora/rogueflower/reedbush = 2,
							/obj/structure/flora/roguegrass/maneater/real = 1)

/datum/mapGeneratorModule/stonehamlet_waterturf
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/water/cleanshallow)
	excluded_turfs = list()
	allowed_areas = list(/area/rogue/outdoors/rtfield)
	spawnableAtoms = list(/obj/structure/flora/roguegrass/water = 8,
	                        /obj/structure/flora/roguegrass/water/reeds = 4)

/datum/mapGeneratorModule/ambushing/hamlet
	spawnableAtoms = list(/obj/effect/landmark/ambush=50)
	spawnableTurfs = list()
	clusterMax = 3
	clusterMin = 1
	checkdensity = FALSE
	allowed_areas = list(/area/rogue/outdoors/rtfield/spooky, /area/rogue/outdoors/rtfield/plague_district, /area/rogue/outdoors/rtfield/outlaw, /area/rogue/outdoors/rtfield/boggish, /area/rogue/outdoors/rtfield/woodish, /area/rogue/outdoors/rtfield/hamlet/unsafe	)
	allowed_turfs = list(/turf/open/floor/rogue/dirt/ambush)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)




//bandaid sunlight
/obj/effect/landmark/mapGenerator/sunlights/bandaid
	mapGeneratorType = /datum/mapGenerator/sunlights/bandaid
	endTurfX = 128
	endTurfY = 192
	startTurfX = 1
	startTurfY = 1

/datum/mapGenerator/sunlights/bandaid
	modules = list(/datum/mapGeneratorModule/sunlights/bandaid)

/datum/mapGeneratorModule/sunlights/bandaid
	spawnableAtoms = list(/obj/effect/sunlight = 100)
	spawnableTurfs = list()
	clusterMax = 7
	clusterMin = 7
	checkdensity = FALSE
	allowed_areas = list(/area/rogue/outdoors)
