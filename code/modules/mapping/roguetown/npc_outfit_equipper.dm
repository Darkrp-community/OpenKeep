/obj/effect/mapping_helpers/outfit_handler
	name = "generic outfit equipper (SET PATH IN VARS)"
	icon_state = "dress"
	icon = 'icons/roguetown/clothing/armor.dmi'
	alpha = 155 //so its easier to tell apart
	var/datum/outfit/outfit_to_equip

/obj/effect/mapping_helpers/ianbirthday/admin/LateInitialize()
	if(!outfit_to_equip)
		qdel(src)
		return
	var/mob/living/carbon/human/located = locate(/mob/living/carbon/human) in get_turf(src)
	if(!located)
		qdel(src)
		return
	located.equipOutfit(outfit_to_equip)
	qdel(src)
