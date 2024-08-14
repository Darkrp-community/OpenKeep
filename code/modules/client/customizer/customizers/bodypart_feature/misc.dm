/datum/customizer/bodypart_feature/accessory
	name = "Accessory"
	customizer_choices = list(/datum/customizer_choice/bodypart_feature/accessory)
	allows_disabling = TRUE
	default_disabled = TRUE

/datum/customizer_choice/bodypart_feature/accessory
	name = "Accessory"
	feature_type = /datum/bodypart_feature/accessory
	allows_accessory_color_customization = FALSE
	sprite_accessories = list(
		/datum/sprite_accessory/accessories/earrings,
		/datum/sprite_accessory/accessories/earrings/sil,
		/datum/sprite_accessory/accessories/earrings/em,
		/datum/sprite_accessory/accessories/eyepierce,
		/datum/sprite_accessory/accessories/eyepierce/alt,
		/datum/sprite_accessory/accessories/choker,
		/datum/sprite_accessory/accessories/chokere,
		)
