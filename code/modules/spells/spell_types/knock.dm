/obj/effect/proc_holder/spell/aoe_turf/knock
	name = "Knock"
	desc = ""

	school = "transmutation"
	charge_max = 100
	clothes_req = FALSE
	invocation = "AULIE OXIN FIERA"
	invocation_type = "whisper"
	range = 3
	cooldown_min = 20 //20 deciseconds reduction per rank

	action_icon_state = "knock"

/obj/effect/proc_holder/spell/aoe_turf/knock/nerfed
	range = 2
	cooldown_min = 25
	invocation = "Open up your secrets."

/obj/effect/proc_holder/spell/aoe_turf/knock/cast(list/targets,mob/user = usr)
	SEND_SOUND(user, sound('sound/blank.ogg'))
	for(var/turf/T in targets)
		for(var/obj/structure/mineral_door/door in T.contents)
			INVOKE_ASYNC(src, PROC_REF(open_door), door)
		for(var/obj/structure/closet/C in T.contents)
			INVOKE_ASYNC(src, PROC_REF(open_closet), C)

/obj/effect/proc_holder/spell/aoe_turf/knock/proc/open_door(obj/structure/mineral_door/door)
    if(istype(door))
        // Assuming force_open is a correct method for both wooden and other doors.
        // Check your door implementation to ensure this method exists and is appropriate.
        door.force_open()

/obj/effect/proc_holder/spell/aoe_turf/knock/proc/open_closet(obj/structure/closet/C)
	C.locked = FALSE
	C.open()
