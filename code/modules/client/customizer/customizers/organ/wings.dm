/*
/datum/customizer/organ/wings
	abstract_type = /datum/customizer/organ/wings
	name = "Wings"

/datum/customizer_choice/organ/wings
	abstract_type = /datum/customizer_choice/organ/wings
	name = "Wings"
	organ_type = /obj/item/organ/wings
	organ_slot = ORGAN_SLOT_WINGS

/datum/customizer/organ/wings/abyssariad/tengu
	customizer_choices = list(/datum/customizer_choice/organ/wings/abyssariad/tengu)
	allows_disabling = TRUE
	default_disabled = TRUE

/datum/customizer_choice/organ/wings/abyssariad/tengu
	name = "Wings"
	organ_type = /obj/item/organ/wings/abyssariad/tengu
	sprite_accessories = list(
		/datum/sprite_accessory/wings/abyssariad/tengu)
*/