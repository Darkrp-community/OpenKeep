/datum/roguestock/import
	import_only = TRUE
	stable_price = TRUE

/obj/structure/closet/crate/chest/steward
	lockid = "steward"
	locked = TRUE
	masterkey = TRUE

// =====================	FOOD IMPORTS	==========================
// ---------- Hardtack ----------------
/datum/roguestock/import/crackers
	name = "survival rations"
	desc = "Low moisture hardtack that keeps well."
	item_type = /obj/structure/closet/crate/chest/steward/hardtack
	export_price = 100
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/hardtack/PopulateContents()
	for(var/i in 1 to 10)
		new /obj/item/reagent_containers/food/snacks/rogue/crackerscooked(src)

// ---------- Oatmeal ----------------
/datum/roguestock/import/oatmeal
	name = "cold oatmeal bin"
	desc = "Things must be desperate around here."
	item_type = /obj/item/roguebin/oatmeal
	export_price = 60
	importexport_amt = 1

/obj/item/roguebin/oatmeal
	name = "cold oatmeal bin"
	desc = "Things must be desperate around here."
/obj/item/roguebin/oatmeal/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/soup/oatmeal,200)
	update_icon()

// ---------- Wheat ----------------
/datum/roguestock/import/wheat
	name = "crate of wheat"
	desc = "Wheat."
	item_type = /obj/structure/closet/crate/chest/steward/wheat
	export_price = 150
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/wheat/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/food/snacks/produce/wheat(src)


// =====================	CRAFTING IMPORTS	==========================
// ---------- Iron ----------------
/datum/roguestock/import/iron
	name = "iron scrap import"
	desc = "Iron ingots."
	item_type = /obj/structure/closet/crate/chest/steward/wheat
	export_price = 150
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/wheat/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/food/snacks/produce/wheat(src)

// ---------- Mining Tools ----------------
/datum/roguestock/import/miningtools
	name = "mining equipment"
	desc = "Made by dwarven craftsmen."
	item_type = /obj/structure/closet/crate/chest/steward/miningtools
	export_price = 80
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/miningtools/PopulateContents()
	new /obj/item/rogueweapon/pick (src)
	new /obj/item/flashlight/flare/torch/lantern/copper(src)

// ---------- Woodsman Tools ----------------	// TO DO add saw when added
/datum/roguestock/import/woodsmantools
	name = "woodsman equipment"
	desc = "For cutting and chastising of trees, large and small."
	item_type = /obj/structure/closet/crate/chest/steward/woodsmantools
	export_price = 60
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/woodsmantools/PopulateContents()
	new /obj/item/rogueweapon/polearm/halberd/bardiche/woodcutter(src)

// ---------- Wagon ----------------
/datum/roguestock/import/woodsmantools
	name = "hand cart"
	desc = "For transporting goods around."
	item_type = /obj/structure/closet/crate/chest/steward/handcart
	export_price = 40
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/handcart/PopulateContents()
	new /obj/structure/handcart(src)


