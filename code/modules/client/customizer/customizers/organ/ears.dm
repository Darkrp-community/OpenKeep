/*
/datum/customizer/organ/ears
	name = "Ears"
	abstract_type = /datum/customizer/organ/ears

/datum/customizer_choice/organ/ears
	name = "Ears"
	organ_type = /obj/item/organ/ears
	organ_slot = ORGAN_SLOT_EARS
	abstract_type = /datum/customizer_choice/organ/ears

/datum/customizer/organ/ears/abyssariad/kitsune
	customizer_choices = list(/datum/customizer_choice/organ/ears/abyssariad/kitsune)

/datum/customizer_choice/organ/ears/abyssariad/kitsune
	name = "Kitsune Ears"
	organ_type = /obj/item/organ/ears/abyssariad/kitsune
	sprite_accessories = list(
		/datum/sprite_accessory/ears/kitsune1,
		/datum/sprite_accessory/ears/kitsune2,
        /datum/sprite_accessory/ears/kitsune3
		)
*/