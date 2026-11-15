GLOBAL_LIST_INIT(court_positions, list(
	"King",
	"Consort",
	"Hand",
	"Prince",
	"Steward",
	"Court Magician",
	"Archivist",
	"Butler",
	"Jester",
	"Warden of the Terrorbog",
	"Huntmaster of the Murderwoods",
	"Hetman of Mount Decapitation",
	))

GLOBAL_LIST_INIT(garrison_positions, list(
	"Captain",
	"Garrison Guard",
	"Royal Guard",
	"Veteran",
	"Dungeoneer",
	"Garrison Archer",
	"Mayor"
	))

GLOBAL_LIST_INIT(church_positions, list(
	"Priest",
	"Acolyte",
	"Gravekeeper",
	"Inquisitor",
	"Templar",
	"Adept",
	"Confessor",
	))

GLOBAL_LIST_INIT(towner_positions, list(
	"Merchant",
	"Stevedore",
	"Blacksmith",
	"Armorer",
	"Weaponsmith",
	"Mason",
	"Feldsher",
	"Innkeep",
	"Tailor",
	"Niteman",
	"Nitemaiden",
	"Alchemist",
	"Scribe",
	))

GLOBAL_LIST_INIT(peasant_positions, list(
	"Soilson",
	"Butcher",
	"Cook",
	"Gravedigger",
	"Miner",
	"Hunter",
	"Fisher",
	"Towner",
	"Prisoner",
	"Beggar",

))

GLOBAL_LIST_INIT(apprentices_positions, list(
	"Squire",
	"Smithy Apprentice",
	"Magician's Apprentice",
	"Servant"
	))

GLOBAL_LIST_INIT(no_antag_positions, list(
	"King",
	"Priest",
	"Merchant",
	"Royal Guard",
	"Templar",
	"Stevedore",
	"Inquisitor",
	"Adept"
	))

GLOBAL_LIST_INIT(allmig_positions, list(
	"Mercenary",
	"Adventurer",
	"Pilgrim",
	"Drifter"
	))

GLOBAL_LIST_INIT(roguewar_positions, list(
	"Adventurer"
	))

GLOBAL_LIST_INIT(roguefight_positions, list(
	"Red Captain",
	"Red Caster",
	"Red Ranger",
	"Red Fighter",
	"Green Captain",
	"Green Caster",
	"Green Ranger",
	"Green Fighter"
	))

GLOBAL_LIST_INIT(test_positions, list(
	"Tester"
	))

GLOBAL_LIST_EMPTY(job_assignment_order)

/proc/get_job_assignment_order()
	var/list/sorting_order = list()
	sorting_order += GLOB.court_positions
	sorting_order += GLOB.church_positions
	sorting_order += GLOB.towner_positions
	sorting_order += GLOB.garrison_positions
	sorting_order += GLOB.peasant_positions
	sorting_order += GLOB.apprentices_positions
	sorting_order += GLOB.allmig_positions
	return sorting_order

GLOBAL_LIST_INIT(exp_jobsmap, list(
	EXP_TYPE_TOWNER = list("titles" = peasant_positions| apprentices_positions), // crew positions
	EXP_TYPE_NOBLE = list("titles" = court_positions),
	EXP_TYPE_CHURCH = list("titles" = church_positions),
	EXP_TYPE_GARRISON = list("titles" = garrison_positions),
	EXP_TYPE_OUTERS = list("titles" = allmig_positions),
))

GLOBAL_LIST_INIT(exp_specialmap, list(
	EXP_TYPE_LIVING = list(), // all living mobs
	EXP_TYPE_ANTAG = list(),
	EXP_TYPE_GHOST = list() // dead people, observers
))
GLOBAL_PROTECT(exp_jobsmap)
GLOBAL_PROTECT(exp_specialmap)


//this is necessary because antags happen before job datums are handed out, but NOT before they come into existence
//so I can't simply use job datum.department_head straight from the mind datum, laaaaame.
/proc/get_department_heads(job_title)
	if(!job_title)
		return list()

	for(var/datum/job/J in SSjob.occupations)
		if(J.title == job_title)
			return J.department_head //this is a list
