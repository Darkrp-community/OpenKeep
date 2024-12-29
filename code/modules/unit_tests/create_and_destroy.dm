///Delete one of every type, sleep a while, then check to see if anything has gone fucky
/datum/unit_test/create_and_destroy
	//You absolutely must run last
	priority = TEST_CREATE_AND_DESTROY

GLOBAL_VAR_INIT(running_create_and_destroy, FALSE)
/datum/unit_test/create_and_destroy/Run()
	//We'll spawn everything here
	var/turf/spawn_at = run_loc_bottom_left
	var/list/ignore = list(
		//Never meant to be created, errors out the ass for mobcode reasons
		/mob/living/carbon,
		//Needs a seed passed, but subtypes set one by default
		/obj/item/grown,
		/obj/item/reagent_containers/food/snacks/grown,
		//And another
		/obj/item/slimecross/recurring,
		//This should be obvious
		/obj/machinery/doomsday_device,
		//Template type
		/obj/effect/mob_spawn,
		//Singleton
		/mob/dview,
		//Template type
		/obj/item/bodypart,
		//briefcase launchpads erroring
		/obj/item/storage/briefcase/launchpad,
		/obj/machinery/launchpad/briefcase,
		/obj/item/storage/box/syndicate/bundle_A, // can contain a launchpad briefcase
		//template types
		/obj/item/gun/magic,
		/obj/item/gun/magic/staff,
		//template type again
		/obj/item/storage/fancy,
		//needs a mob passed to view it
		/atom/movable/screen/credit,
		//invalid without mob/living passed
		/obj/shapeshift_holder,
		//abstract type, should not be spawned but subtypes are okay
		/mob/living/silicon/robot/modules,
		//explodes when deleted
		/obj/structure/checkoutmachine,
		//spawns a bunch of swarmers that wander off and damage stuff that gets spawned
		/mob/living/simple_animal/hostile/megafauna/swarmer_swarm_beacon,
		// requires a pod passed
		/obj/effect/DPfall,
		/obj/effect/DPtarget,
		// prompts loc for input
		/obj/item/clothing/suit/roguetown/shirt/grenzelhoft,
		// maploading
		/obj/item/hilbertshotel,
	)
	//these are VERY situational and need info passed
	ignore += typesof(/obj/effect/abstract)
	//needs a lich passed
	ignore += typesof(/obj/item/phylactery)
	//cba to fix hitscans erroring in Destroy, so just ignore all projectiles
	ignore += typesof(/obj/projectile)
	//needs an owner to work
	ignore += typesof(/obj/item/paper/contract)
	//needs a spell to work
	ignore += typesof(/obj/item/melee/blood_magic)
	//Doesn't work on our map setup
	ignore += typesof(/obj/item/disk/nuclear)
	//Say it with me now, type template
	ignore += typesof(/obj/effect/mapping_helpers)
	//This turf existing is an error in and of itself
	ignore += typesof(/turf/baseturf_skipover)
	ignore += typesof(/turf/baseturf_bottom)
	//This one demands a computer, so we'll let it off easy
	ignore += typesof(/obj/item/modular_computer/processor)
	//Very finiky, blacklisting to make things easier
	ignore += typesof(/obj/item/poster/wanted)
	//Needs a client / mob / hallucination to observe it to exist.
	ignore += typesof(/obj/effect/hallucination)
	ignore += typesof(/obj/projectile/hallucination)
	//Can't pass in a thing to glow
	ignore += typesof(/obj/effect/abstract/eye_lighting)
	//We have a baseturf limit of 10, adding more than 10 baseturf helpers will kill CI, so here's a future edge case to fix.
	ignore += typesof(/obj/effect/baseturf_helper)
	//No trauma to pass in
	ignore += typesof(/mob/camera/imaginary_friend)
	//No linked console
	ignore += typesof(/mob/camera/aiEye/remote/base_construction)
	//See above
	ignore += typesof(/mob/camera/aiEye/remote/shuttle_docker)
	//No one to be friends with :(
	ignore += typesof(/obj/effect/mob_spawn/human/demonic_friend)
	//Hangs a ref post invoke async, which we don't support. Could put a qdeleted check but it feels hacky
	ignore += typesof(/obj/effect/anomaly/grav/high)
	//See above
	ignore += typesof(/obj/effect/timestop)
	//this boi spawns turf changing stuff, and it stacks and causes pain. Let's just not
	ignore += typesof(/obj/effect/sliding_puzzle)
	//Our system doesn't support it without warning spam from unregister calls on things that never registered
	ignore += typesof(/obj/docking_port)
	//Asks for a shuttle that may not exist, let's leave it alone
	ignore += typesof(/obj/item/pinpointer/shuttle)
	//Expects a mob to holderize, we have nothing to give
	ignore += typesof(/obj/item/clothing/head/mob_holder)
	//Needs cards passed into the initilazation args
	ignore += typesof(/obj/item/toy/cards/cardhand)
	//Needs a holodeck area linked to it which is not guarenteed to exist and technically is supposed to have a 1:1 relationship with computer anyway.
	ignore += typesof(/obj/machinery/computer/holodeck)
	//invalid without start and end
	ignore += typesof(/obj/effect/immovablerod)
	//invoke async + explosion in init + all sorts of nastiness on subtypes
	ignore += typesof(/obj/effect/temp_visual/hierophant)
	//these explode when Destroy()ed
	ignore += typesof(/obj/machinery/vending/custom)
	ignore += typesof(/obj/vehicle/sealed)
	ignore += typesof(/obj/mecha)
	//these also like to explode if anything else is on their turf or nearby
	ignore += typesof(/obj/effect/meteor)
	//ENDS THE FUCKING WORLD.
	ignore += typesof(/obj/singularity/narsie)
	//needs multiple atoms passed
	ignore += typesof(/obj/effect/buildmode_line)
	//needs a fried item passed
	ignore += typesof(/obj/item/reagent_containers/food/snacks/deepfryholder)
	// requires other parts
	ignore += typesof(/obj/machinery/gravity_generator)
	// requires a generator
	ignore += typesof(/obj/structure/projected_forcefield)
	// genuinely just too lazy to get this one working
	ignore += typesof(/obj/structure/bodycontainer)

	var/list/cached_contents = spawn_at.contents.Copy()
	var/baseturf_count = length(spawn_at.baseturfs)

	GLOB.running_create_and_destroy = TRUE
	for(var/type_path in typesof(/atom/movable, /turf) - ignore) //No areas please
		if(ispath(type_path, /turf))
			spawn_at.ChangeTurf(type_path, /turf/baseturf_skipover)
			//We change it back to prevent pain, please don't ask
			spawn_at.ChangeTurf(/turf/open/floor/wood, /turf/baseturf_skipover)
			if(baseturf_count != length(spawn_at.baseturfs))
				Fail("[type_path] changed the amount of baseturfs we have [baseturf_count] -> [length(spawn_at.baseturfs)]")
				baseturf_count = length(spawn_at.baseturfs)
		else
			var/atom/creation = new type_path(spawn_at)
			if(QDELETED(creation))
				continue
			//Go all in
			qdel(creation, force = TRUE)
			//This will hold a ref to the last thing we process unless we set it to null
			//Yes byond is fucking sinful
			creation = null

		//There's a lot of stuff that either spawns stuff in on create, or removes stuff on destroy. Let's cut it all out so things are easier to deal with
		var/list/to_del = spawn_at.contents - cached_contents
		if(length(to_del))
			for(var/atom/to_kill in to_del)
				qdel(to_kill, force = TRUE)

	GLOB.running_create_and_destroy = FALSE
	//Hell code, we're bound to have ended the round somehow so let's stop if from ending while we work
	SSticker.delay_end = TRUE
	//Prevent the garbage subsystem from harddeling anything, if only to save time
	SSgarbage.collection_timeout[GC_QUEUE_HARDDELETE] = 10000 HOURS
	//Clear it, just in case
	cached_contents.Cut()

	//Now that we've qdel'd everything, let's sleep until the gc has processed all the shit we care about
	var/time_needed = SSgarbage.collection_timeout[GC_QUEUE_CHECK]
	var/start_time = world.time
	sleep(time_needed)

	// spin until the first item in the check queue is older than start_time
	var/garbage_queue_processed = FALSE
	var/list/queue_to_check = SSgarbage.queues[GC_QUEUE_CHECK]
	while(!garbage_queue_processed || !SSgarbage.can_fire)
		if(!SSgarbage.can_fire) // probably running find references
			CHECK_TICK
			continue
		//How the hell did you manage to empty this? Good job!
		if(!length(queue_to_check))
			garbage_queue_processed = TRUE
			break

		var/list/oldest_packet = queue_to_check[1]
		//Pull out the time we deld at
		var/qdeld_at = oldest_packet[1]
		//If we've found a packet that got del'd later then we finished, then all our shit has been processed
		if(qdeld_at > start_time)
			garbage_queue_processed = TRUE
			break

		if(world.time > start_time + time_needed + 30 MINUTES) //If this gets us gitbanned I'm going to laugh so hard
			Fail("Something has gone horribly wrong, the garbage queue has been processing for well over 30 minutes. What the hell did you do")
			break

		//Immediately fire the gc right after
		SSgarbage.next_fire = 1
		//Unless you've seriously fucked up, queue processing shouldn't take "that" long. Let her run for a bit, see if anything's changed
		sleep(20 SECONDS)

	//Alright, time to see if anything messed up
	var/list/cache_for_sonic_speed = SSgarbage.items
	for(var/path in cache_for_sonic_speed)
		var/datum/qdel_item/item = cache_for_sonic_speed[path]
		if(item.failures)
			Fail("[item.name] hard deleted [item.failures] times out of a total del count of [item.qdels]")
		if(item.no_respect_force)
			Fail("[item.name] failed to respect force deletion [item.no_respect_force] times out of a total del count of [item.qdels]")
		if(item.no_hint)
			Fail("[item.name] failed to return a qdel hint [item.no_hint] times out of a total del count of [item.qdels]")

	cache_for_sonic_speed = SSatoms.BadInitializeCalls
	for(var/path in cache_for_sonic_speed)
		var/fails = cache_for_sonic_speed[path]
		if(fails & BAD_INIT_NO_HINT)
			Fail("[path] didn't return an Initialize hint")
		if(fails & BAD_INIT_QDEL_BEFORE)
			Fail("[path] qdel'd in New()")
		if(fails & BAD_INIT_SLEPT)
			Fail("[path] slept during Initialize()")

	SSticker.delay_end = FALSE
	//This shouldn't be needed, but let's be polite
	SSgarbage.collection_timeout[GC_QUEUE_HARDDELETE] = 10 SECONDS
