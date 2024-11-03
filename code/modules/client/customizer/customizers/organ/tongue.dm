/datum/customizer/organ/tongue
	abstract_type = /datum/customizer/organ/tongue
	name = "tongue"

/datum/customizer_choice/organ/tongue
	abstract_type = /datum/customizer_choice/organ/tongue
	name = "tongue"
	organ_type = /obj/item/organ/tongue
	organ_slot = ORGAN_SLOT_TONGUE
	customizer_entry_type = /datum/customizer_entry/organ/tongue
	organ_dna_type = /datum/organ_dna/tongue
	allows_accessory_color_customization = FALSE

/datum/customizer/organ/tongue/humanoid
	customizer_choices = list(/datum/customizer_choice/organ/tongue/humanoid)
	default_choice = /datum/customizer_choice/organ/tongue/humanoid

/datum/customizer_choice/organ/tongue/humanoid

/datum/customizer/organ/tongue/abyssariad/kitsune
	customizer_choices = list(/datum/customizer_choice/organ/tongue/abyssariad/kitsune)
