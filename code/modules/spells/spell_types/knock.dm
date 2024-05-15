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

/obj/effect/proc_holder/spell/aoe_turf/knock/cast(list/targets, mob/user = usr)
    SEND_SOUND(user, sound('sound/timestop.ogg'))
    for(var/turf/T in targets)
        // Target any mineral doors, not just wooden ones, to make your spell more general
        for(var/obj/structure/mineral_door/door in T.contents)
            // Asynchronously call the open procedure for each door
            INVOKE_ASYNC(src, .proc/open_door, door)

// Simplified the opening procedure by checking the door type inside one method
/obj/effect/proc_holder/spell/aoe_turf/knock/proc/open_door(obj/structure/mineral_door/door)
    // No need to re-check type - just call the open method if it's a mineral_door
    if(istype(door))
        // Assuming force_open is a correct method for both wooden and other doors.
        // Check your door implementation to ensure this method exists and is appropriate.
        door.force_open()
