/obj/effect/landmark/hammer
	icon = 'modular/mapping/hammer/source.dmi'
	icon_state = "error"
	var/actively_testing = FALSE
	invisibility = 101
	layer = 9999
	anchored = 1
	plane = ABOVE_LIGHTING_PLANE

/obj/effect/landmark/hammer/Initialize()
	..()
	#ifdef TESTING
	actively_testing = TRUE
	#endif
	if(!actively_testing)
		qdel(src)
	if(actively_testing)
		invisibility = 0

// dev_text, it's only visible in game when "TESTING" is defined in _compile_options.dm
/obj/effect/landmark/hammer/dev_text
	icon = 'modular/mapping/hammer/source.dmi'
	icon_state = "dev_text"
	desc = "Use the (dev_text) var and you shall see your text in game! How cool!."
	var/dev_text = "Put your text here!"

/obj/effect/landmark/hammer/dev_text/Initialize()
	..()
	src.maptext = "[src.dev_text]"
	src.maptext_width = 500
	src.maptext_x = 32
