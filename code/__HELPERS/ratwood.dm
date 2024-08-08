/// Turns a color string such as "#FFFFFF#00FFFF" into a list of ("#FFFFFF", #00FFFF)
/proc/color_string_to_list(color_string)
	if(!color_string)
		return null
	. = list()
	var/list/split_colors = splittext(color_string, "#")
	for(var/color in 2 to length(split_colors))
		. += "#[split_colors[color]]"

/// Turns a list such as ("#FFFFFF", #00FFFF) into a color string of "#FFFFFF#00FFFF"
/proc/color_list_to_string(list/color_list)
	if(!islist(color_list))
		return null
	. = ""
	for(var/color in color_list)
		. += color

/proc/find_key_by_value(var/list/list, value)
	for(var/key in list)
		var/found_value = list[key]
		if(found_value == value)
			return key
	return null

/proc/is_human_part_visible(mob/living/carbon/human/human, flags_inv)
	if(!human)
		return TRUE
	if(flags_inv == NONE)
		return TRUE
	var/list/worn_items = get_all_worn_items(human)
	for(var/obj/item/item as anything in worn_items)
		if(item.flags_inv & flags_inv)
			return FALSE
	return TRUE

/proc/get_all_worn_items(mob/living/carbon/human/human)
	var/static/list/all_item_slots = ALL_ITEM_SLOTS
	var/list/worn_items = list()
	for(var/slot in all_item_slots)
		var/obj/item/item = human.get_item_by_slot(slot)
		if(!item)
			continue
		worn_items += item
	return worn_items
