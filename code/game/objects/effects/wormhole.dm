GLOBAL_LIST_EMPTY(all_wormholes) // So we can pick wormholes to teleport to

/obj/effect/portal/wormhole
	name = "wormhole"
	desc = ""
	icon = 'icons/obj/objects.dmi'
	icon_state = "anom"
	mech_sized = TRUE


/obj/effect/portal/wormhole/Initialize(mapload, _creator, _lifespan = 0, obj/effect/portal/_linked, automatic_link = FALSE, turf/hard_target_override, atmos_link_override)
	. = ..()
	GLOB.all_wormholes += src

/obj/effect/portal/wormhole/Destroy()
	. = ..()
	GLOB.all_wormholes -= src

/obj/effect/portal/wormhole/teleport(atom/movable/M)
	if(iseffect(M))	//sparks don't teleport
		return
	if(M.anchored)
		if(!(ismecha(M) && mech_sized))
			return

	if(ismovableatom(M))
		if(GLOB.all_wormholes.len)
			var/obj/effect/portal/wormhole/P = pick(GLOB.all_wormholes)
			if(P && isturf(P.loc))
				hard_target = P.loc
		if(!hard_target)
			return
		do_teleport(M, hard_target, 1, 1, 0, 0, channel = TELEPORT_CHANNEL_WORMHOLE) ///You will appear adjacent to the beacon
