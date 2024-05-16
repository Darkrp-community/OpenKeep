/obj/effect/proc_holder/spell/aoe_turf/knock
    name = "Knock"
    desc = ""

    school = "transmutation"
    charge_max = 100
    clothes_req = FALSE
    invocation = "DORIS OXIN OPANI"
    invocation_type = "whisper"
    range = 3
    cooldown_min = 300 //20 deciseconds reduction per rank
    associated_skill = /datum/skill/magic/arcane

    action_icon_state = "knock"

/obj/effect/proc_holder/spell/aoe_turf/knock/cast(list/targets,mob/user = usr)
	SEND_SOUND(user, sound('sound/blank.ogg'))
	for(var/turf/T in targets)
		for(var/obj/machinery/door/door in T.contents)
			INVOKE_ASYNC(src, PROC_REF(open_door), door)
		for(var/obj/structure/closet/C in T.contents)
			INVOKE_ASYNC(src, PROC_REF(open_closet), C)

// Simplified the opening procedure by checking the door type inside one method
/obj/effect/proc_holder/spell/aoe_turf/knock/proc/open_door(obj/structure/mineral_door/door)
    // No need to re-check type - just call the open method if it's a mineral_door
    if(istype(door))
        // Assuming force_open is a correct method for both wooden and other doors.
        // Check your door implementation to ensure this method exists and is appropriate.
        door.force_open()
