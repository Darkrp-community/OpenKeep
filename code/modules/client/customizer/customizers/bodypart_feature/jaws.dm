// adjust bits
/datum/customizer/organ/tongue/kitsune
	customizer_choices = list(/datum/customizer_choice/organ/tongue/kitsune)

/datum/sprite_accessory/tongue/kitsune
	name = "Souleating Jaws"
	icon = 'icons/roguetown/kaizoku/body_details/kitsunejaws.dmi'
	color_key_name = "tongue"
	icon_state = "eldritch"
	relevant_layers = list(BODY_FRONT_LAYER, BODY_BEHIND_LAYER)
	var/can_wag = FALSE

/datum/sprite_accessory/tongue_animated/kitsune
	name = "Souleating Jaws"
	icon = 'icons/roguetown/kaizoku/body_details/kitsunejaws.dmi'
	color_key_name = "tongue"
	icon_state = "eldritch"
	relevant_layers = list(BODY_FRONT_LAYER, BODY_BEHIND_LAYER)

/datum/customizer/bodypart_feature/tongue/kitsune
	name = "Souleating Jaws"
	customizer_choices = list(/datum/customizer_choice/bodypart_feature/tongue/kitsune_tongue)
	allows_disabling = FALSE
	default_disabled = FALSE

/datum/customizer_choice/bodypart_feature/tongue/kitsune_tongue
	name = "Souleating Jaws"
	feature_type = /datum/bodypart_feature/tongue/kitsune_tongue
	allows_accessory_color_customization = FALSE
	sprite_accessories = list(
		/datum/sprite_accessory/tongue/kitsune/eldritch
		)

/datum/sprite_accessory/tongue/kitsune/get_icon_state(obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	if(!can_wag)
		return ..()
	var/obj/item/organ/tongue/kitsune/tongue_organ = organ
	if(!owner || !tongue_organ.wagging)
		return ..()
	return "[icon_state]_wagging"

#ifdef UNIT_TESTS

/datum/sprite_accessory/tongue/kitsune/unit_testing_icon_states(list/states)
	states += icon_state
	if(can_wag)
		states += "[icon_state]_wagging"

#endif

/datum/customizer_choice/organ/tongue/kitsune
	name = "Kitsune tongue"
	organ_type = /obj/item/organ/tongue/kitsune
	generic_random_pick = TRUE
	sprite_accessories = list(
		/datum/sprite_accessory/tongue/kitsune/eldritch,
		)

/datum/sprite_accessory/tongue/kitsune/eldritch
	name = "Eldritch"
	icon_state = "eldritch"
	icon = 'icons/roguetown/kaizoku/body_details/kitsunejaws.dmi'
	can_wag = TRUE

/obj/item/organ/tongue/kitsune
	name = "kitsune tongue"
	desc = "The tongue that inwardly bends the moldable kitsune skull into a Glasgow smile, or other shapes depending on their branch."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "eldritch"
	slot = ORGAN_SLOT_TONGUE
	accessory_type = /datum/sprite_accessory/tongue/kitsune/eldritch
	var/tongue_type = "eldritch"
	var/can_wag = TRUE
	var/wagging = FALSE
	zone = BODY_ZONE_PRECISE_MOUTH
	slot = ORGAN_SLOT_TONGUE

/obj/item/organ/tongue/kitsune/Insert(mob/living/carbon/human/H, special = 0, drop_if_replaced = TRUE)
	..()
	if(istype(H))
		if(!("kitsune_tongue" in H.dna.species.mutant_bodyparts))
			H.dna.species.mutant_bodyparts |= "kitsune_tongue"
			H.dna.features["kitsune_tongue"] = tongue_type
			H.update_body()

/obj/item/organ/tongue/kitsune/Remove(mob/living/carbon/human/H,  special = 0)
	..()
	if(istype(H))
		H.dna.features["kitsune_tongue"] = "None"
		H.dna.species.mutant_bodyparts -= "kitsune_tongue"
		color = H.hair_color
		H.update_body()