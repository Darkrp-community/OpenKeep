/datum/roguestock/import
	import_only = TRUE
	stable_price = TRUE

/obj/structure/closet/crate/chest/crate/steward
	lockid = "steward"
	locked = TRUE
	masterkey = TRUE

// =====================	FOOD IMPORTS	==========================
// ---------- Hardtack ----------------
/datum/roguestock/import/crackers
	name = "Hardtack rations"
	desc = "Low moisture crackers that keeps well."
	item_type = /obj/structure/closet/crate/chest/crate/steward/hardtack
	export_price = 100
	importexport_amt = 1

/obj/structure/closet/crate/chest/crate/steward/hardtack/PopulateContents()
	for(var/i in 1 to 10)
		new /obj/item/reagent_containers/food/snacks/rogue/crackerscooked(src)

// ---------- Oatmeal ----------------
/datum/roguestock/import/oatmeal
	name = "Oatmeal bin"
	desc = "Cold oatmeal? Things must be desperate around here."
	item_type = /obj/item/roguebin/oatmeal
	export_price = 60
	importexport_amt = 1

/obj/item/roguebin/oatmeal
	name = "Oatmeal bin"
/obj/item/roguebin/oatmeal/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/soup/oatmeal,200)
	update_icon()

// ---------- Wheat ----------------
/datum/roguestock/import/wheat
	name = "Crate of wheat"
	desc = "Grain."
	item_type = /obj/structure/closet/crate/chest/crate/steward/wheat
	export_price = 150
	importexport_amt = 1

/obj/structure/closet/crate/chest/crate/steward/wheat/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/food/snacks/produce/wheat(src)


// =====================	CRAFTING IMPORTS	==========================
// ---------- Iron ----------------
/datum/roguestock/import/iron
	name = "Iron scrap import"
	desc = "These ingots come at a steep price."
	item_type = /obj/structure/closet/crate/chest/crate/steward/iron
	export_price = 150
	importexport_amt = 1

/obj/structure/closet/crate/chest/crate/steward/iron/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/rogueore/iron(src)

// ---------- Mining Tools ----------------
/datum/roguestock/import/miningtools
	name = "Mining equipment"
	desc = "Made by dwarven craftsmen."
	item_type = /obj/structure/closet/crate/chest/crate/steward/miningtools
	export_price = 80
	importexport_amt = 1

/obj/structure/closet/crate/chest/crate/steward/miningtools/PopulateContents()
	new /obj/item/rogueweapon/pick (src)
	new /obj/item/flashlight/flare/torch/lantern/copper(src)

// ---------- Woodsman Tools ----------------	// TO DO add saw when added
/datum/roguestock/import/woodsmantools
	name = "Woodsman equipment"
	desc = "For cutting and chastising of trees, large and small."
	item_type = /obj/structure/closet/crate/chest/crate/steward/woodsmantools
	export_price = 60
	importexport_amt = 1

/obj/structure/closet/crate/chest/crate/steward/woodsmantools/PopulateContents()
	new /obj/item/rogueweapon/polearm/halberd/bardiche/woodcutter(src)

// ---------- Wagon ----------------
/datum/roguestock/import/woodsmantools
	name = "Hand cart"
	desc = "For transporting goods around."
	item_type = /obj/structure/closet/crate/chest/crate/steward/handcart
	export_price = 40
	importexport_amt = 1

/obj/structure/closet/crate/chest/crate/steward/handcart/PopulateContents()
	new /obj/structure/handcart(src)


