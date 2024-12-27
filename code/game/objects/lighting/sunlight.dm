/obj/effect/sunlight
	var/brightness = 10
	light_power = 1
	light_color = "#2f1313"
	layer = BELOW_MOB_LAYER
	icon = 'icons/effects/effects.dmi'
	icon_state = "electricity2"
#ifndef TESTING
	name = ""
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
#else
	name = "sunlight"
#endif
	var/mode = "day"
	light_depth = 0
	light_height = 0

/obj/effect/sunlight/Initialize()
	light_color = pick("#ffefd5", "#fffacd", "#fafad2", "#e6e6fa", "#ffe4e1", "#ffffe0")
	..()
	if(istype(loc, /turf/open/transparent/openspace))
		var/turf/target = get_step_multiz(src, DOWN)
		if(!isclosedturf(target))
			new type(target)
	mode = GLOB.tod
	GLOB.sunlights += src
#ifndef FASTLOAD
	update()
#endif
/obj/effect/sunlight/Destroy()
	STOP_PROCESSING(SStodchange,src)
	GLOB.sunlights -= src
	. = ..()

/obj/effect/sunlight/Initialize(mapload)
	. = ..()
#ifdef TESTING
	icon_state = "electricity2"
#else
	icon_state = null
#endif

/obj/effect/sunlight/proc/update()
	if(mode == GLOB.tod)
		return
	mode = GLOB.tod
	switch(mode)
		if("night")
			light_color = pick("#1a0d2f", "#160920", "#210933")
		if("dusk")
			light_color = pick("#ff8c69", "#ff6f91", "#ff4500")
		if("dawn")
			light_color = pick("#6a5acd", "#7b68ee", "#800080")
		if("day")
			light_color = pick("#ffefd5", "#fffacd", "#fafad2", "#e6e6fa", "#ffe4e1", "#ffffe0")
	set_light(brightness, brightness, light_power, l_color = light_color)

/obj/effect/sunlight/ultra
	brightness = 30

//genstuff
/obj/effect/landmark/mapGenerator/sunlights
	mapGeneratorType = /datum/mapGenerator/sunlights
	endTurfX = 255
	endTurfY = 255
	startTurfX = 1
	startTurfY = 1

/obj/effect/landmark/mapGenerator/sunlights/Initialize(mapload)
	GLOB.sky_z |= z
	return ..()

/datum/mapGenerator/sunlights
	modules = list(/datum/mapGeneratorModule/sunlights)

/datum/mapGeneratorModule/sunlights
	spawnableAtoms = list(/obj/effect/sunlight = 100)
	spawnableTurfs = list()
	clusterMax = 5
	clusterMin = 5
	checkdensity = FALSE
	allowed_areas = list(/area/rogue/outdoors)
