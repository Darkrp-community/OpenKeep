/datum/anvil_recipe/weapons
	appro_skill = /datum/skill/craft/weaponsmithing
	craftdiff = 1
	i_type = "Weapons"

// SILVER - Harder to craft, does less damage and has less durability than steel, but banes undead.

/datum/anvil_recipe/weapons/daggersil
	name = "Silver Dagger"
	recipe_name = "a Silver Dagger"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/silver
	created_item = /obj/item/rogueweapon/huntingknife/idagger/silver
	craftdiff = 2

/datum/anvil_recipe/weapons/sword_silver
	name = "Silver Sword"
	recipe_name = "a Silver Sword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/silver
	created_item = /obj/item/rogueweapon/sword/silver
	craftdiff = 3

/datum/anvil_recipe/weapons/shortsword_silver
	name = "Silver Shortsword"
	recipe_name = "a Silver Short Sword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/silver
	created_item = /obj/item/rogueweapon/sword/short/silver
	craftdiff = 2

/datum/anvil_recipe/weapons/rapier_silver
	name = "Silver Rapier"
	recipe_name = "a Silver Rapier"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/silver
	created_item = /obj/item/rogueweapon/sword/rapier/silver
	craftdiff = 3

/datum/anvil_recipe/weapons/forgotten
	name = "Forgotten Blade (2)"
	recipe_name = "a Forgotten Blade"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/silver
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/sword/long/forgotten
	craftdiff = 4

// COPPER TIER - TODO: Move these to redsmithing in future

/datum/anvil_recipe/weapons/caxe
	name = "Copper Axe (+s)"
	recipe_name = "an Axe"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/copper
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/woodcut/copperaxe
	craftdiff = 0

/datum/anvil_recipe/weapons/cbludgeon
	name = "Copper Bludgeon (+s)"
	recipe_name = "a Bludgeon"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/copper
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/mace/copperbludgeon
	craftdiff = 0

/datum/anvil_recipe/weapons/cdagger
	name = "Copper Dagger x2"
	recipe_name = "a couple Copper Daggers"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/copper
	created_item = /obj/item/rogueweapon/knife/copperdagger
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

///datum/anvil_recipe/weapons/cmace removing this one for balance reasons, is hard to balance 2 maces so the copper bludgeon is the one that keeps on the world
//	name = "Copper Mace (2)"
//	recipe_name = "a Mace"
//	appro_skill = /datum/skill/craft/weaponsmithing
//	req_bar = /obj/item/ingot/copper
//	additional_items = list(/obj/item/ingot/copper)
//	created_item = (/obj/item/rogueweapon/mace/coppermace)
//	craftdiff = 0

/datum/anvil_recipe/weapons/cmesser
	name = "Copper Messer (+1s)"
	recipe_name = "a rustic Messer"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/copper
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/sword/coppermesser
	craftdiff = 0

/datum/anvil_recipe/weapons/cspears
	name = "Copper Spear x2 (+1w)"
	recipe_name = "two Spears"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/copper
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/copperspear
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/weapons/gcopper
	name = "Copper Warclub (2) + (1w)"
	recipe_name = "A Copper Warclub"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/copper
	additional_items = list(/obj/item/ingot/copper,/obj/item/grown/log/tree/small)
	created_item = (/obj/item/rogueweapon/mace/goden/copper)
	craftdiff = 2

/datum/anvil_recipe/weapons/swordcopper
	name = "Copper Sword"
	recipe_name = "a Copper Sword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/copper
	created_item = /obj/item/rogueweapon/sword/copper

/datum/anvil_recipe/weapons/falxcopper
	name = "Copper Falx (2)"
	recipe_name = "a rustic Falx"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/copper
	additional_items = list(/obj/item/ingot/copper)
	created_item = /obj/item/rogueweapon/sword/long/rider/copper

// BRONZE GEAR - middle tier, what the ancient enemies, Aasimar roles, what poor Smiths with lack of iron and steel may use 





// IRON GEAR - Middle Tier, what most disgusting Men at Arms have

/datum/anvil_recipe/weapons/arrows
	name = "Arrows x5 (+s)"
	recipe_name = "five Arrows"
	appro_skill = /datum/skill/craft/engineering
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/projectile/bullet/reusable/arrow
	createmultiple = TRUE
	createditem_num = 4
	i_type = "Ammo"
	craftdiff = 0

/datum/anvil_recipe/weapons/axe_iron
	name = "Axe (+s)"
	recipe_name = "an Axe"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/woodcut

/datum/anvil_recipe/weapons/ironhammer
	name = "iron sledgehammer (+s)"
	recipe_name = "a sledgehammer"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/mace/smithy

/datum/anvil_recipe/weapons/woodcutter_iron
	name = "Woodcutter Axe (+w)"
	recipe_name = "an big Axe"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/halberd/bardiche/woodcutter

/datum/anvil_recipe/weapons/footmancutter
	name = "Warchopper Axe (2) (+w)"
	recipe_name = "a big war axe"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron,/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/halberd/bardiche/warcutter

/datum/anvil_recipe/weapons/bardiche
	name = "Bardiche (2) (+w)"
	recipe_name = "a Bardiche"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron,/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/halberd/bardiche
	craftdiff = 2

/datum/anvil_recipe/weapons/bolts
	name = "Crossbow Bolt x5 (+s)"
	recipe_name = "five Crossbow Bolts"
	appro_skill = /datum/skill/craft/engineering
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/ammo_casing/caseless/rogue/bolt
	createmultiple = TRUE
	createditem_num = 4
	i_type = "Ammo"
	craftdiff = 1

/datum/anvil_recipe/weapons/dagger_iron
	name = "Dagger x2"
	recipe_name = "a couple Daggers"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/huntingknife/idagger
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0 // To train with

/datum/anvil_recipe/weapons/flail_iron
	name = "Flail"
	recipe_name = "a Flail"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/flail

/datum/anvil_recipe/weapons/lucerne
	name = "Lucerne (2) (+w)"
	recipe_name = "a Lucerne"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron,/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/eaglebeak/lucerne
	craftdiff = 2

/datum/anvil_recipe/weapons/mace_iron
	name = "Mace (+s)"
	recipe_name = "a Mace"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/mace

/datum/anvil_recipe/weapons/messer_iron
	name = "Messer"
	recipe_name = "a Messer"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/sword/iron/messer

/datum/anvil_recipe/weapons/spear_iron
	name = "Spear x2 (+w)"
	recipe_name = "a couple Spears"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/spear
	createmultiple = TRUE
	createditem_num = 1

/datum/anvil_recipe/weapons/shortsword_iron
	name = "Short sword"
	recipe_name = "a Short Sword"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/sword/iron/short
	craftdiff = 0

/datum/anvil_recipe/weapons/sword_iron
	name = "Sword"
	recipe_name = "a Sword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/sword/iron

/datum/anvil_recipe/weapons/towershield
	name = "Tower Shield (+w)"
	recipe_name = "a Tower Shield"
	appro_skill = /datum/skill/craft/armorsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/shield/tower
	craftdiff = 2

/datum/anvil_recipe/weapons/zweihander
	name = "Zweihander (3)"
	recipe_name = "a Zweihander"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron, /obj/item/ingot/iron)
	created_item = /obj/item/rogueweapon/greatsword/zwei
	craftdiff = 3

// STEEL GEAR - Fancy shit for Knights

/datum/anvil_recipe/weapons/spear_steel
	name = "Steel Lance x2 (+w)"
	recipe_name = "a couple Lances"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/spear/steel
	createmultiple = TRUE
	createditem_num = 1

/datum/anvil_recipe/weapons/axe_steel
	name = "Axe (+s)"
	recipe_name = "an Axe"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/woodcut/steel
	craftdiff = 2

/datum/anvil_recipe/weapons/battleaxe
	name = "Battle Axe (2)"
	recipe_name = "a Battle Axe"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/battle
	craftdiff = 3

/datum/anvil_recipe/weapons/steelwarhammer
	name = "Steel Warhammer (2)"
	recipe_name = "a Warhammer"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/mace/smithywar
	craftdiff = 3

/datum/anvil_recipe/weapons/billhook
	name = "Billhook (+w)"
	recipe_name = "a Billhook"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/spear/billhook
	craftdiff = 3

/datum/anvil_recipe/weapons/cleaver
	name = "Cleaver"
	recipe_name = "a Cleaver"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/huntingknife/cleaver
	craftdiff = 1

/datum/anvil_recipe/weapons/crossbow_eng
	name = "Crossbow (+w) (+f)"
	recipe_name = "a Crossbow"
	appro_skill = /datum/skill/craft/engineering
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/small, /obj/item/natural/fibers)
	created_item = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
	craftdiff = 1 // Minimal engineering needed

/datum/anvil_recipe/weapons/cutlass_steel
	name = "Cutlass"
	recipe_name = "a Cutlass"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/cutlass
	craftdiff = 2

/datum/anvil_recipe/weapons/dagger_steel
	name = "Dagger x2"
	recipe_name = "a couple Daggers"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/huntingknife/idagger/steel
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/weapons/decsaber
	name = "Decorated sabre (+g)"
	recipe_name = "a Decorated Sabre"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/gold)
	created_item = /obj/item/rogueweapon/sword/sabre/dec
	craftdiff = 3

/datum/anvil_recipe/weapons/decsword
	name = "Decorated sword (+g)"
	recipe_name = "a Decorated Sword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/gold)
	created_item = /obj/item/rogueweapon/sword/decorated
	craftdiff = 3

/datum/anvil_recipe/weapons/decrapier
	name = "Decorated rapier (+g)"
	recipe_name = "a Decorated Rapier"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/gold)
	created_item = /obj/item/rogueweapon/sword/rapier/dec
	craftdiff = 3

/datum/anvil_recipe/weapons/eaglebeak
	name = "Eagle's Beak (2) (+w)"
	recipe_name = "an Eagle's Beak"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/eaglebeak
	craftdiff = 3

/datum/anvil_recipe/weapons/flail_steel
	name = "Flail"
	recipe_name = "a Flail"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/flail/sflail
	craftdiff = 2

/datum/anvil_recipe/weapons/grandmace
	name = "Grand Mace (+w)"
	recipe_name = "a Grand Mace"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/mace/goden/steel
	craftdiff = 3

/datum/anvil_recipe/weapons/greatsword
	name = "Greatsword (3)"
	recipe_name = "a Greatsword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/greatsword
	craftdiff = 4

/datum/anvil_recipe/weapons/halbert
	name = "Halberd (2) (+w)"
	recipe_name = "a Halberd"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/halberd
	craftdiff = 4

/datum/anvil_recipe/weapons/huntknife
	name = "Hunting knife"
	recipe_name = "a Hunting Knife"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/huntingknife
	craftdiff = 2

/datum/anvil_recipe/weapons/kiteshield
	name = "Kite Shield (2) (+h)"
	recipe_name = "a Kite Shield"
	appro_skill = /datum/skill/craft/armorsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/natural/hide)
	created_item = /obj/item/rogueweapon/shield/tower/metal
	craftdiff = 3

/datum/anvil_recipe/weapons/longsword
	name = "Longsword (2)"
	recipe_name = "a Longsword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/sword/long
	craftdiff = 3

/datum/anvil_recipe/weapons/mace_steel
	name = "Mace (2)"
	recipe_name = "a Mace"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/mace/steel
	craftdiff = 2

/datum/anvil_recipe/weapons/rapier_steel
	name = "Rapier"
	recipe_name = "a Rapier"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/rapier
	craftdiff = 2

/datum/anvil_recipe/weapons/saber_steel
	name = "Sabre"
	recipe_name = "a Sabre"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/sabre
	craftdiff = 2

/datum/anvil_recipe/weapons/shortsword
	name = "Shortsword"
	recipe_name = "a Short Sword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/short
	craftdiff = 1

/datum/anvil_recipe/weapons/sword_steel
	name = "Sword"
	recipe_name = "a Sword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword
	craftdiff = 2

/datum/anvil_recipe/weapons/warclub
	name = "Warclub (+w)"
	recipe_name = "a Warclub"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/mace/goden
	craftdiff = 2

