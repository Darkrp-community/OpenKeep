/obj/effect/landmark
	name = "landmark"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "x2"
	anchored = TRUE
	layer = MID_LANDMARK_LAYER
	invisibility = INVISIBILITY_ABSTRACT
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/effect/landmark/singularity_act()
	return

// Please stop bombing the Observer-Start landmark.
/obj/effect/landmark/ex_act()
	return

/obj/effect/landmark/singularity_pull()
	return


INITIALIZE_IMMEDIATE(/obj/effect/landmark)

/obj/effect/landmark/Initialize()
	. = ..()
	GLOB.landmarks_list += src

/obj/effect/landmark/Destroy()
	GLOB.landmarks_list -= src
	return ..()

/obj/effect/landmark/start
	name = "start"
	icon = 'icons/mob/landmarks.dmi'
	icon_state = "arrow"
	anchored = TRUE
	layer = MOB_LAYER
	var/list/jobspawn_override = list()
	var/delete_after_roundstart = TRUE
	var/used = FALSE

/obj/effect/landmark/start/proc/after_round_start()
	if(delete_after_roundstart)
		qdel(src)

/obj/effect/landmark/start/New()
	GLOB.start_landmarks_list += src
	if(jobspawn_override.len)
		for(var/X in jobspawn_override)
			if(!GLOB.jobspawn_overrides[X])
				GLOB.jobspawn_overrides[X] = list()
			GLOB.jobspawn_overrides[X] += src
	..()
	if(name != "start")
		tag = "start*[name]"

/obj/effect/landmark/start/Destroy()
	GLOB.start_landmarks_list -= src
	for(var/X in jobspawn_override)
		GLOB.jobspawn_overrides[X] -= src
	return ..()

/obj/effect/landmark/events/haunts
	name = "hauntz"
	icon_state = "generic_event"

/obj/effect/landmark/events/haunts/Initialize(mapload)
	. = ..()
	GLOB.hauntstart += src
	icon_state = ""


/obj/effect/landmark/events/testportal
	name = "testserverportal"
	icon_state = "x4"
	var/aportalloc = "a"

/obj/effect/landmark/events/testportal/Initialize(mapload)
	. = ..()
//	GLOB.hauntstart += loc
#ifdef TESTSERVER
	var/obj/structure/fluff/testportal/T = new /obj/structure/fluff/testportal(loc)
	T.aportalloc = aportalloc
	GLOB.testportals += T
#endif
	return INITIALIZE_HINT_QDEL


//..	Court starters		..
/obj/effect/landmark/start/lord
	name = "King"
	jobspawn_override = list("King")
/obj/effect/landmark/latejoin/lord
	name = "King"
/obj/effect/landmark/start/steward
	name = "Steward"
	jobspawn_override = list("Steward")
/obj/effect/landmark/latejoin/steward
	name = "Steward"
/obj/effect/landmark/start/archivist
	name = "Archivist"
	jobspawn_override = list("Archivist")
/obj/effect/landmark/latejoin/archivist
	name = "Archivist"
/obj/effect/landmark/start/manorguardsman
	name = "Royal Guard"
	jobspawn_override = list("Royal Guard")
/obj/effect/landmark/latejoin/royalguard
	name = "Royal Guard"


/obj/effect/landmark/start/hand
	name = "Hand"
	jobspawn_override = list("Hand")
/obj/effect/landmark/latejoin/hand
	name = "Hand"
/obj/effect/landmark/start/consort
	name = "Consort"
	jobspawn_override = list("Consort")
/obj/effect/landmark/latejoin/consort
	name = "Consort"
/obj/effect/landmark/start/prince
	name = "Prince"
	jobspawn_override = list("Prince")
/obj/effect/landmark/latejoin/prince
	name = "Prince"
/obj/effect/landmark/start/jester
	name = "Jester"
	jobspawn_override = list("Jester")
/obj/effect/landmark/latejoin/jester
	name = "Jester"
/obj/effect/landmark/start/butler
	name = "Butler"
	jobspawn_override = list("Butler")
/obj/effect/landmark/latejoin/butler
	name = "Butler"
/obj/effect/landmark/start/servant
	name = "Servant"
	jobspawn_override = list("Servant")
/obj/effect/landmark/latejoin/servant
	name = "Servant"

//..	Court Mage starters		..
/obj/effect/landmark/start/magician
	name = "Court Magician"
	jobspawn_override = list("Court Magician")
/obj/effect/landmark/latejoin/magician
	name = "Court Magician"
/obj/effect/landmark/start/wapprentice
	name = "Magician's Apprentice"
	jobspawn_override = list("Magician's Apprentice")
/obj/effect/landmark/latejoin/wapprentice
	name = "Magician's Apprentice"

//..	Town Watch starters		..
/obj/effect/landmark/start/sheriff
	name = "Sheriff"
	jobspawn_override = list("Sheriff")
/obj/effect/landmark/latejoin/sheriff
	name = "Sheriff"
/obj/effect/landmark/start/watchman
	name = "Watchman"
	jobspawn_override = list("Watchman")
/obj/effect/landmark/latejoin/watchman
	name = "Watchman"
/obj/effect/landmark/start/squire
	name = "Squire"
	jobspawn_override = list("Squire")
/obj/effect/landmark/latejoin/squire
	name = "Squire"


//..	Temple starters		..
/obj/effect/landmark/start/priest
	name = "Priest"
	jobspawn_override = list("Priest")
/obj/effect/landmark/latejoin/priest
	name = "Priest"
/obj/effect/landmark/start/templar
	name = "Templar"
	jobspawn_override = list("Templar")
/obj/effect/landmark/latejoin/templar
	name = "Templar"
/obj/effect/landmark/start/monk
	name = "Acolyte"
	jobspawn_override = list("Acolyte")
/obj/effect/landmark/latejoin/acolyte
	name = "Acolyte"
/obj/effect/landmark/start/gravedigger
	name = "Gravekeeper"
	jobspawn_override = list("Gravekeeper")
/obj/effect/landmark/latejoin/gravedigger
	name = "Gravekeeper"

/obj/effect/landmark/start/puritan
	name = "Inquisitor"
	icon_state = "arrow"
/obj/effect/landmark/latejoin/inquisitor
	name = "Inquisitor"
	icon_state = "latejoin"
/obj/effect/landmark/start/shepherd
	name = "Adept"
	icon_state = "arrow"
/obj/effect/landmark/latejoin/adept
	name = "Adept"
	icon_state = "latejoin"


//..	Townspeople starters		..
/obj/effect/landmark/start/merchant
	name = "Merchant"
	jobspawn_override = list("Merchant")
/obj/effect/landmark/latejoin/merchant
	name = "Merchant"
/obj/effect/landmark/start/stevedore
	name = "Stevedore"
	jobspawn_override = list("Stevedore")
/obj/effect/landmark/latejoin/stevedore
	name = "Stevedore"

/obj/effect/landmark/start/innkeep
	name = "Innkeep"
	jobspawn_override = list("Innkeep")
/obj/effect/landmark/latejoin/innkeep
	name = "Innkeep"
/obj/effect/landmark/start/cook
	name = "Cook"
	jobspawn_override = list("Cook")
/obj/effect/landmark/latejoin/cook
	name = "Cook"
/obj/effect/landmark/start/mason
	name = "Mason"
	jobspawn_override = list( "Mason")
/obj/effect/landmark/latejoin/mason
	name =  "Mason"
/obj/effect/landmark/start/blacksmith
	name = "Blacksmith"
	jobspawn_override = list( "Blacksmith")
/obj/effect/landmark/latejoin/blacksmith
	name =  "Blacksmith"
/obj/effect/landmark/start/sapprentice
	name = "Smithy Apprentice"
	jobspawn_override = list( "Smithy Apprentice")
/obj/effect/landmark/latejoin/sapprentice
	name =  "Smithy Apprentice"
/obj/effect/landmark/start/tailor
	name = "Tailor"
	jobspawn_override = list("Tailor")
/obj/effect/landmark/latejoin/tailor
	name = "Tailor"
/obj/effect/landmark/start/feldsher
	name = "Feldsher"
	jobspawn_override = list("Feldsher")
/obj/effect/landmark/latejoin/feldsher
	name = "Feldsher"

/obj/effect/landmark/start/nightman
	name = "Niteman"
	jobspawn_override = list(	 "Niteman" )
/obj/effect/landmark/latejoin/niteman
	name = "Niteman"
/obj/effect/landmark/start/nightmaiden
	name = "Nitemaiden"
	jobspawn_override = list(	 "Nitemaiden" )
/obj/effect/landmark/latejoin/nitemaiden
	name = "Niteman"
/obj/effect/landmark/start/mercenary
	name = "Mercenary"
	jobspawn_override = list(	 "Mercenary" )
/obj/effect/landmark/latejoin/mercenary
	name = "Mercenary"

/obj/effect/landmark/start/woodsman
	name = "Mayor"
	jobspawn_override = list(	"Mayor" )
/obj/effect/landmark/latejoin/mayor
	name = "Mayor"
/obj/effect/landmark/start/veteran
	name = "Veteran"
	jobspawn_override = list(	"Veteran" )
/obj/effect/landmark/latejoin/veteran
	name = "Veteran"
/obj/effect/landmark/start/farmer
	name = "Soilson"
	jobspawn_override = list(	"Soilson" )
/obj/effect/landmark/latejoin/soilson
	name = "Soilson"
/obj/effect/landmark/start/beastmonger
	name = "Butcher"
	jobspawn_override = list(	 "Butcher")
/obj/effect/landmark/latejoin/butcher
	name = "Butcher"

/obj/effect/landmark/start/vagrant
	name = "Beggar"
	jobspawn_override = list(	 "Beggar" )
/obj/effect/landmark/latejoin/beggar
	name = "Beggar"

/obj/effect/landmark/start/prisoner
	name = "Prisoner"


/obj/effect/landmark/start/pilgrim	// for both roundstart and latejoins, on a road on the main map
	name = "Pilgrim"
	icon_state = "arrow"
	jobspawn_override = list("Pilgrim")
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/adventurer
	name = "Adventurer"
	jobspawn_override = list("Drifter", "Adventurer")
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/adventurerlate	// obsolete
	name = "Adventurerlate"
	icon_state = "arrow"
	jobspawn_override = list("Drifter", "Adventurer")
	delete_after_roundstart = FALSE


/obj/effect/landmark/start/guardsman
	name = "Garrison Guard"
	icon_state = "arrow"

/obj/effect/landmark/start/knight
	name = "Knight"
	icon_state = "arrow"

/obj/effect/landmark/start/captain
	name = "Captain"
	icon_state = "arrow"

/obj/effect/landmark/start/dungeoneer
	name = "Dungeoneer"
	icon_state = "arrow"

/obj/effect/landmark/start/villager
	name = "Towner"
	icon_state = "arrow"

/obj/effect/landmark/start/cleric
	name = "Cleric"
	icon_state = "arrow"

/obj/effect/landmark/start/weaponsmith
	name = "Weaponsmith"
	icon_state = "arrow"

/obj/effect/landmark/start/armorsmith
	name = "Armorer"
	icon_state = "arrow"

/obj/effect/landmark/start/alchemist
	name = "Alchemist"
	icon_state = "arrow"

/obj/effect/landmark/start/scribe
	name = "Scribe"
	icon_state = "arrow"


/obj/effect/landmark/start/hunter
	name = "Hunter"
	icon_state = "arrow"

/obj/effect/landmark/start/fisher
	name = "Fisher"
	icon_state = "arrow"

/obj/effect/landmark/start/lumberjack
	name = "Lumberjack"
	icon_state = "arrow"



/obj/effect/landmark/start/villagerlate
	name = "Townerlate"
	icon_state = "arrow"
	jobspawn_override = list("Towner")
	delete_after_roundstart = FALSE


/obj/effect/landmark/start/vagrantlate	// obsolete
	name = "Beggarlate"

/obj/effect/landmark/start/orphanlate	// obsolete
	name = "Orphanlate"

/obj/effect/landmark/start/mercenarylate	// obsolete
	name = "Mercenarylate"
	icon_state = "arrow"
	jobspawn_override = list("Mercenary")
	delete_after_roundstart = FALSE



/obj/effect/landmark/start/colonist
	name = "Colonist"
	icon_state = "arrow"

/obj/effect/landmark/start/evilskeleton	// Trying to make EVIL SKELTON actually spawn
	name = "Skeleton"
	icon = 'icons/mob/actions/roguespells.dmi'
	icon_state = "raiseskele"
	alpha = 20
	delete_after_roundstart = FALSE

//Antagonist spawns

/obj/effect/landmark/start/wizard
	name = "wizard"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "wiznerd_spawn"

/obj/effect/landmark/start/wizard/Initialize()
	. = ..()
	GLOB.wizardstart += loc

/obj/effect/landmark/start/nukeop
	name = "nukeop"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "snukeop_spawn"

/obj/effect/landmark/start/nukeop/Initialize()
	. = ..()
	GLOB.nukeop_start += loc

/obj/effect/landmark/start/bandit
	name = "bandit"
	icon = 'icons/mob/landmarks.dmi'
	icon_state = "arrow"

/obj/effect/landmark/start/bandit/Initialize()
	. = ..()
	GLOB.bandit_starts += loc


/obj/effect/landmark/start/delf
	name = "delf"
	icon = 'icons/mob/landmarks.dmi'
	icon_state = "arrow"

/obj/effect/landmark/start/delf/Initialize()
	. = ..()
	GLOB.delf_starts += loc


/obj/effect/landmark/start/nukeop_leader
	name = "nukeop leader"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "snukeop_leader_spawn"

/obj/effect/landmark/start/nukeop_leader/Initialize()
	. = ..()
	GLOB.nukeop_leader_start += loc

// Must be immediate because players will
// join before SSatom initializes everything.
INITIALIZE_IMMEDIATE(/obj/effect/landmark/start/new_player)

/obj/effect/landmark/start/new_player
	name = "New Player"

/obj/effect/landmark/start/new_player/Initialize()
	. = ..()
	GLOB.newplayer_start += loc

/obj/effect/landmark/latejoin
	name = "JoinLate"
	icon_state = "latejoin"

/obj/effect/landmark/latejoin/Initialize(mapload)
	..()
	SSjob.latejoin_trackers += loc
	return INITIALIZE_HINT_QDEL

//space carps, magicarps, lone ops, slaughter demons, possibly revenants spawn here
/obj/effect/landmark/carpspawn
	name = "carpspawn"
	icon_state = "carp_spawn"

//observer start
/obj/effect/landmark/observer_start
	name = "Observer-Start"
	icon_state = "x"

//objects with the stationloving component (nuke disk) respawn here.
//also blobs that have their spawn forcemoved (running out of time when picking their spawn spot), santa and respawning devils
/obj/effect/landmark/blobstart
	name = "blobstart"
	icon_state = "blob_start"

/obj/effect/landmark/blobstart/Initialize(mapload)
	..()
	GLOB.blobstart += loc
	return INITIALIZE_HINT_QDEL

//spawns sec equipment lockers depending on the number of sec officers
/obj/effect/landmark/secequipment
	name = "secequipment"
	icon_state = "secequipment"

/obj/effect/landmark/secequipment/Initialize(mapload)
	..()
	GLOB.secequipment += loc
	return INITIALIZE_HINT_QDEL

//players that get put in admin jail show up here
/obj/effect/landmark/prisonwarp
	name = "prisonwarp"
	icon_state = "prisonwarp"

/obj/effect/landmark/prisonwarp/Initialize(mapload)
	..()
	GLOB.prisonwarp += loc
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/ert_spawn
	name = "Emergencyresponseteam"
	icon_state = "ert_spawn"

/obj/effect/landmark/ert_spawn/Initialize(mapload)
	..()
	GLOB.emergencyresponseteamspawn += loc
	return INITIALIZE_HINT_QDEL

//ninja energy nets teleport victims here
/obj/effect/landmark/holding_facility
	name = "Holding Facility"
	icon_state = "holding_facility"

/obj/effect/landmark/holding_facility/Initialize(mapload)
	..()
	GLOB.holdingfacility += loc
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/thunderdome/observe
	name = "tdomeobserve"
	icon_state = "tdome_observer"

/obj/effect/landmark/thunderdome/observe/Initialize(mapload)
	..()
	GLOB.tdomeobserve += loc
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/thunderdome/one
	name = "tdome1"
	icon_state = "tdome_t1"

/obj/effect/landmark/thunderdome/one/Initialize(mapload)
	..()
	GLOB.tdome1	+= loc
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/thunderdome/two
	name = "tdome2"
	icon_state = "tdome_t2"

/obj/effect/landmark/thunderdome/two/Initialize(mapload)
	..()
	GLOB.tdome2 += loc
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/thunderdome/admin
	name = "tdomeadmin"
	icon_state = "tdome_admin"

/obj/effect/landmark/thunderdome/admin/Initialize(mapload)
	..()
	GLOB.tdomeadmin += loc
	return INITIALIZE_HINT_QDEL

//generic event spawns
/obj/effect/landmark/event_spawn
	name = "generic event spawn"
	icon_state = "generic_event"
	layer = HIGH_LANDMARK_LAYER


/obj/effect/landmark/event_spawn/New()
	..()
	GLOB.generic_event_spawns += src

/obj/effect/landmark/event_spawn/Destroy()
	GLOB.generic_event_spawns -= src
	return ..()

/obj/effect/landmark/ruin
	var/datum/map_template/ruin/ruin_template

/obj/effect/landmark/ruin/New(loc, my_ruin_template)
	name = "ruin_[GLOB.ruin_landmarks.len + 1]"
	..(loc)
	ruin_template = my_ruin_template
	GLOB.ruin_landmarks |= src

/obj/effect/landmark/ruin/Destroy()
	GLOB.ruin_landmarks -= src
	ruin_template = null
	. = ..()

//Underworld landmark

/obj/effect/landmark/underworld
	name = "underworld spawn"

/obj/effect/landmark/underworldcoin
	name = "ferryman coin"

/obj/effect/landmark/underworldsafe // To prevent demons spawn camping will save a lot of ear rape.
	name = "safe zone"

/obj/effect/landmark/underworldcoin/Initialize(mapload)
	SHOULD_CALL_PARENT(FALSE)
	GLOB.underworldcoinspawns += loc
	return INITIALIZE_HINT_QDEL
