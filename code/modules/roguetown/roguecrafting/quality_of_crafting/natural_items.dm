/datum/repeatable_crafting_recipe/cloth
	requirements = list(
		/obj/item/natural/fibers = 2
	)
	tool_usage = list(
		/obj/item/needle = list("starts to sew", "start to sew")
	)

	starting_atom = /obj/item/needle
	attacking_atom = /obj/item/natural/fibers
	skillcraft = /datum/skill/misc/sewing
	output = /obj/item/natural/cloth
	craftdiff = 0

/datum/repeatable_crafting_recipe/thorn_needle
	requirements = list(
		/obj/item/natural/fibers = 1,
		/obj/item/natural/thorn = 1,
	)

	starting_atom = /obj/item/natural/fibers
	attacking_atom = /obj/item/natural/thorn
	output = /obj/item/needle/thorn
	craftdiff = 0
