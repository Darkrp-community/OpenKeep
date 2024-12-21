/datum/repeatable_crafting_recipe/leather
	abstract_type = /datum/repeatable_crafting_recipe/leather
	requirements = list(
		/obj/item/natural/hide/cured = 1
	)
	tool_usage = list(
		/obj/item/needle = list("starts to sew", "start to sew")
	)

	starting_atom = /obj/item/needle
	attacking_atom = /obj/machinery/tanningrack
	skillcraft = /datum/skill/craft/tanning
	craftdiff = 0
	subtypes_allowed = TRUE // so you can use any subtype of fur

/datum/repeatable_crafting_recipe/leather/pouch
	name = "leather pouch"
	output = /obj/item/storage/belt/rogue/pouch
	sellprice = 6
