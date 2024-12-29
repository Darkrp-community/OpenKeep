/datum/component/storage/concrete/roguetown
	grid = TRUE

/datum/component/storage/concrete/roguetown/satchel
	screen_max_rows = 4
	max_w_class = WEIGHT_CLASS_NORMAL

/datum/component/storage/concrete/roguetown/backpack
	screen_max_rows = 7
	screen_max_columns = 4
	max_w_class = WEIGHT_CLASS_NORMAL
	not_while_equipped = TRUE

/datum/component/storage/concrete/roguetown/surgery_bag
	screen_max_rows = 5
	screen_max_columns = 4
	max_w_class = WEIGHT_CLASS_NORMAL

/datum/component/storage/concrete/roguetown/belt
	screen_max_rows = 3
	screen_max_columns = 2
	max_w_class = WEIGHT_CLASS_SMALL

/datum/component/storage/concrete/roguetown/coin_pouch
	screen_max_rows = 4
	screen_max_columns = 1
	max_w_class = WEIGHT_CLASS_NORMAL
	not_while_equipped = FALSE

/datum/component/storage/concrete/roguetown/keyring
	screen_max_rows = 4
	screen_max_columns = 5
	max_w_class = WEIGHT_CLASS_SMALL
	allow_dump_out = TRUE
	click_gather = TRUE
	attack_hand_interact = FALSE
	collection_mode = COLLECT_ONE
	insert_verb = "slide"
	insert_preposition = "on"

/datum/component/storage/concrete/roguetown/keyring/New(datum/P, ...)
	. = ..()
	can_hold = typecacheof(list(/obj/item/key))

/datum/component/storage/concrete/roguetown/belt/knife_belt
	screen_max_rows = 6
	screen_max_columns = 4

/datum/component/storage/concrete/roguetown/belt/knife_belt/New(datum/P, ...)
	. = ..()
	can_hold = typecacheof(list(/obj/item/rogueweapon/knife/throwingknife))


/datum/component/storage/concrete/roguetown/belt/cloth
	screen_max_columns = 1

/datum/component/storage/concrete/roguetown/belt/assassin
	max_w_class = WEIGHT_CLASS_NORMAL
