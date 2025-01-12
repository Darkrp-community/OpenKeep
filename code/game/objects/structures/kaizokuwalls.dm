/turf/closed/wall/mineral/rogue/stone/abyssal
	name = "abyssal ishigaki wall"
	desc = "Made from large, interlocking uncut stones without the use of mortar, so a castle is built above it. However, many make simple walls out of it."
	icon = 'icons/roguetown/kaizoku/wallset/abyssalstone.dmi'
	icon_state = "abyssabyssal"
	sheet_type = /obj/item/natural/stone
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')
	canSmoothWith = list(/turf/closed/wall/mineral/rogue/stone/abyssal)
	above_floor = /turf/open/floor/rogue/blocks
	baseturfs = list(/turf/open/floor/rogue/blocks)
	climbdiff = 1
	damage_deflection = 10

/turf/closed/wall/mineral/rogue/stone/abyssal/window
	name = "abyssal ishigaki window"
	desc = "An simple hole within a Ishigaki wall."
	opacity = FALSE
	max_integrity = 800

/turf/closed/wall/mineral/rogue/stone/window/CanPass(atom/movable/mover, turf/target)
	if(istype(mover) && ((mover.pass_flags & PASSTABLE) || (mover.pass_flags & PASSGRILLE)) )
		return 1
	return ..()

/turf/closed/wall/mineral/rogue/stone/abyssal/window/Initialize()
	. = ..()
	icon_state = "abyssal"
	var/mutable_appearance/M = mutable_appearance(icon, "abyssalhole", layer = ABOVE_NORMAL_TURF_LAYER)
	add_overlay(M)

/turf/closed/wall/mineral/rogue/wood/abyssal
	name = "wagoya wall"
	desc = "wooden wall of abyssal architecture that uses wooden joinery that fits together seamlessly to avoid use of nails or screws, increasing protection against earthshakes."
	icon = 'icons/roguetown/kaizoku/wallset/eastern_wood.dmi'
	icon_state = "wood"
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')
	canSmoothWith = list(/turf/closed/wall/mineral/rogue/wood, /obj/structure/roguewindow, /obj/structure/roguetent, /turf/closed/wall/mineral/rogue/wooddark)
//	sheet_type = /obj/item/grown/log/tree/lumber
	above_floor = /turf/open/floor/rogue/woodturned
	baseturfs = list(/turf/open/floor/rogue/woodturned)
	neighborlay = "dirtedge"
	climbdiff = 3

/turf/closed/wall/mineral/rogue/wood/abyssal/window
	name = "wagoya no sama"
	desc = "A murderhole on a wooden wall that lacks nails and screws."
	opacity = FALSE
	max_integrity = 550

/turf/closed/wall/mineral/rogue/wood/abyssal/window/CanPass(atom/movable/mover, turf/target)
	if(istype(mover) && ((mover.pass_flags & PASSTABLE) || (mover.pass_flags & PASSGRILLE)) )
		return 1
	return ..()

/turf/closed/wall/mineral/rogue/wood/abyssal/window/Initialize()
	. = ..()
	var/mutable_appearance/M = mutable_appearance(icon, "woodhole", layer = ABOVE_NORMAL_TURF_LAYER)
	add_overlay(M)
