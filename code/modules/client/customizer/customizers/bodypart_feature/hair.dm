/datum/customizer/bodypart_feature/hair
	abstract_type = /datum/customizer/bodypart_feature/hair

/datum/customizer_choice/bodypart_feature/hair
	abstract_type = /datum/customizer_choice/bodypart_feature/hair
	customizer_entry_type = /datum/customizer_entry/hair
	allows_accessory_color_customization = FALSE //Customized through hair color
	var/allows_natural_gradient = TRUE

/datum/customizer_choice/bodypart_feature/hair/customize_feature(datum/bodypart_feature/feature, mob/living/carbon/human/human, datum/preferences/prefs, datum/customizer_entry/hair/entry)
	var/datum/bodypart_feature/hair/hair_feature = feature
	hair_feature.hair_color = entry.hair_color
	hair_feature.accessory_colors = entry.hair_color
	hair_feature.natural_color = entry.natural_color
	hair_feature.natural_gradient = entry.natural_gradient

/datum/customizer_choice/bodypart_feature/hair/validate_entry(datum/preferences/prefs, datum/customizer_entry/entry)
	..()
	var/datum/customizer_entry/hair/hair_entry = entry
	hair_entry.hair_color = sanitize_hexcolor(hair_entry.hair_color, 6, TRUE, initial(hair_entry.hair_color))
	hair_entry.natural_color = sanitize_hexcolor(hair_entry.natural_color, 6, TRUE, initial(hair_entry.natural_color))

/datum/customizer_choice/bodypart_feature/hair/generate_pref_choices(list/dat, datum/preferences/prefs, datum/customizer_entry/entry, customizer_type)
	..()
	var/datum/customizer_entry/hair/hair_entry = entry
	dat += "<br>Hair Color: <a href='?_src_=prefs;task=change_customizer;customizer=[customizer_type];customizer_task=hair_color''><span class='color_holder_box' style='background-color:[hair_entry.hair_color]'></span></a>"
	if(allows_natural_gradient)
		var/datum/hair_gradient/gradient = HAIR_GRADIENT(hair_entry.natural_gradient)
		dat += "<br>Natural Gradient: <a href='?_src_=prefs;task=change_customizer;customizer=[customizer_type];customizer_task=natural_gradient'>[gradient.name]</a>"
		if(hair_entry.natural_gradient != /datum/hair_gradient/none)
			dat += "<br>Natural Color: <a href='?_src_=prefs;task=change_customizer;customizer=[customizer_type];customizer_task=natural_gradient_color''><span class='color_holder_box' style='background-color:[hair_entry.natural_color]'></span></a>"

/datum/customizer_choice/bodypart_feature/hair/handle_topic(mob/user, list/href_list, datum/preferences/prefs, datum/customizer_entry/entry, customizer_type)
	..()
	var/datum/customizer_entry/hair/hair_entry = entry
	switch(href_list["customizer_task"])
		if("hair_color")
			var/new_color = color_pick_sanitized_lumi(user, "Choose your hair color:", "Character Preference", hair_entry.hair_color)
			if(!new_color)
				return
			hair_entry.hair_color = sanitize_hexcolor(new_color, 6, TRUE)
		if("natural_gradient")
			if(!allows_natural_gradient)
				return
			var/list/choice_list = hair_gradient_name_to_type_list()
			var/chosen_input = input(user, "Choose your natural gradient:", "Character Preference")  as null|anything in choice_list
			if(!chosen_input)
				return
			hair_entry.natural_gradient = choice_list[chosen_input]
		if("natural_gradient_color")
			if(!allows_natural_gradient)
				return
			var/new_color = color_pick_sanitized_lumi(user, "Choose your natural gradient color:", "Character Preference", hair_entry.natural_color)
			if(!new_color)
				return
			hair_entry.natural_color = sanitize_hexcolor(new_color, 6, TRUE)

/datum/customizer_entry/hair
	var/hair_color = "#FFFFFF"
	var/natural_gradient = /datum/hair_gradient/none
	var/natural_color = "#FFFFFF"

/datum/customizer_entry/hair/facial

/datum/customizer/bodypart_feature/hair/head
	abstract_type = /datum/customizer/bodypart_feature/hair/head
	name = "Hair"

/datum/customizer_choice/bodypart_feature/hair/head
	abstract_type = /datum/customizer_choice/bodypart_feature/hair/head
	name = "Hair"
	feature_type = /datum/bodypart_feature/hair/head

/datum/customizer/bodypart_feature/hair/facial
	abstract_type = /datum/customizer/bodypart_feature/hair/facial
	name = "Facial Hair"

/datum/customizer/bodypart_feature/hair/facial/is_allowed(datum/preferences/prefs)
	return (prefs.gender == MALE)

/datum/customizer_choice/bodypart_feature/hair/facial
	abstract_type = /datum/customizer_choice/bodypart_feature/hair/facial
	name = "Facial Hair"
	feature_type = /datum/bodypart_feature/hair/facial
	customizer_entry_type = /datum/customizer_entry/hair/facial

/datum/customizer_choice/bodypart_feature/hair/head/humanoid/get_random_accessory(datum/customizer_entry/entry, datum/preferences/prefs)
	return pick(sprite_accessories)

/datum/customizer_choice/bodypart_feature/hair/head/humanoid/on_randomize_entry(datum/customizer_entry/entry, datum/preferences/prefs)
	var/datum/customizer_entry/hair/hair_entry = entry
	var/color = pick(HAIR_COLOR_LIST)
	hair_entry.hair_color = color
