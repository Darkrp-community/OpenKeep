/*
/datum/customizer/organ/tail
	name = "Tail"
	abstract_type = /datum/customizer/organ/tail

/datum/customizer_choice/organ/tail
	name = "Tail"
	organ_type = /obj/item/organ/tail
	organ_slot = ORGAN_SLOT_TAIL
	abstract_type = /datum/customizer_choice/organ/tail

/datum/customizer/organ/tail/abyssariad/kitsune
	customizer_choices = list(/datum/customizer_choice/organ/tail/abyssariad/kitsune)

/datum/customizer_choice/organ/tail/abyssariad/kitsune
	name = "Kitsune Tail"
	organ_type = /obj/item/organ/tail/rogue/abyssariad/kitsune
	sprite_accessories = list(
		/datum/sprite_accessory/tail/abyssariad/onetail,
		/datum/sprite_accessory/tail/abyssariad/twotail,
		/datum/sprite_accessory/tail/abyssariad/threetail,
		/datum/sprite_accessory/tail/abyssariad/fourtail,
		/datum/sprite_accessory/tail/abyssariad/fivetail
	)
*/