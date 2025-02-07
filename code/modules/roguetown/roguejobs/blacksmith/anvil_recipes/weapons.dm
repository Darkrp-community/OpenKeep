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
	created_item = /obj/item/rogueweapon/knife/dagger/silver
	craftdiff = 2

/datum/anvil_recipe/weapons/sword_silver
	name = "Silver Sword"
	recipe_name = "a Silver Sword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/silver
	created_item = /obj/item/rogueweapon/sword/silver
	craftdiff = 3

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
	name = "Axe (2)"
	recipe_name = "an Axe"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/copper
	additional_items = list(/obj/item/ingot/copper)
	created_item = /obj/item/rogueweapon/axe/copper
	craftdiff = 0

/datum/anvil_recipe/weapons/cbludgeon
	name = "Bludgeon (+s)"
	recipe_name = "a Bludgeon"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/copper
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/mace/cudgel/bludgeon
	craftdiff = 0

/datum/anvil_recipe/weapons/cdagger
	name = "Dagger x2"
	recipe_name = "a couple Daggers"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/copper
	created_item = /obj/item/rogueweapon/knife/copper
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

//datum/anvil_recipe/weapons/cmace
//	name = "Mace (2)"
//	recipe_name = "a Mace"
//	appro_skill = /datum/skill/craft/weaponsmithing
//	req_bar = /obj/item/ingot/copper
//	additional_items = list(/obj/item/ingot/copper)
//	created_item = (/obj/item/rogueweapon/mace/coppermace)
//	craftdiff = 0

/datum/anvil_recipe/weapons/cmesser
	name = "Messer (+1s)"
	recipe_name = "a Messer"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/copper
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/sword/coppermesser
	craftdiff = 0

/datum/anvil_recipe/weapons/cspears
	name = "Spear x2 (+w)"
	recipe_name = "two Spears"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/copper
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/polearm/spear/stone/copper
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/weapons/cfalx
	name = "Copper Falx (2)"
	recipe_name = "a great copper sword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/copper
	additional_items = list(/obj/item/ingot/copper)
	created_item = /obj/item/rogueweapon/sword/long/rider/copper
	craftdiff = 0

// IRON GEAR - Middle Tier, what most disgusting Men at Arms have

/datum/anvil_recipe/weapons/arrows
	name = "Arrows x5 (+s)"
	recipe_name = "five Arrows"
	appro_skill = /datum/skill/craft/engineering
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/ammo_casing/caseless/rogue/arrow
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
	created_item = /obj/item/rogueweapon/axe/iron

/datum/anvil_recipe/weapons/bardiche
	name = "Bardiche (2) (+w)"
	recipe_name = "a Bardiche"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron,/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/polearm/halberd/bardiche
	craftdiff = 2

/datum/anvil_recipe/weapons/woodcutter
	name = "woodcutter great axe (+w)"
	recipe_name = "a great axe for woodcutters"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/polearm/halberd/bardiche/woodcutter
	craftdiff = 1

/datum/anvil_recipe/weapons/warcutter
	name = "War axe (2) (+w)"
	recipe_name = "a war greataxe"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron,/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/polearm/halberd/bardiche/warcutter
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

/datum/anvil_recipe/weapons/bullets
	name = "Lead Bullets x5 (+s)"
	recipe_name = "five Lead Bullets"
	appro_skill = /datum/skill/craft/engineering
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/ammo_casing/caseless/rogue/bullet
	createmultiple = TRUE
	createditem_num = 4
	i_type = "Ammo"
	craftdiff = 0

/datum/anvil_recipe/weapons/dagger_iron
	name = "Dagger x2"
	recipe_name = "a couple Daggers"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/knife/dagger
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0 // To train with

/datum/anvil_recipe/weapons/dagger_iron
	name = "peasant knife x3"
	recipe_name = "three peasantry knives"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/knife/villager
	createmultiple = TRUE
	createditem_num = 2
	craftdiff = 0

/datum/anvil_recipe/weapons/flail_iron
	name = "Militia flail (+c) (+s)"
	recipe_name = "a militia flail"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/rope/chain, /obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/flail/militia


/datum/anvil_recipe/weapons/lucerne
	name = "Lucerne (2) (+w)"
	recipe_name = "a Lucerne"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron,/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/polearm/eaglebeak/lucerne
	craftdiff = 2

/datum/anvil_recipe/weapons/sledgehammer
	name = "Sledgehammer(+s)"
	recipe_name = "a big hammer"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = 	/obj/item/rogueweapon/hammer/sledgehammer

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
	created_item = /obj/item/rogueweapon/sword/scimitar/messer

/datum/anvil_recipe/weapons/spear_iron
	name = "Spear x2 (+w)"
	recipe_name = "a couple Spears"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/polearm/spear
	createmultiple = TRUE
	createditem_num = 1

/datum/anvil_recipe/weapons/shortsword_iron
	name = "Short sword"
	recipe_name = "a Short Sword"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/sword/short
	craftdiff = 0

/datum/anvil_recipe/weapons/sword_iron
	name = "Sword"
	recipe_name = "a Sword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/sword/iron

/datum/anvil_recipe/weapons/sword_iron
	name = "Florete"
	recipe_name = "a Duelist Sword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/sword/rapier/iron

/datum/anvil_recipe/weapons/towershield
	name = "Tower Shield (+w)"
	recipe_name = "a Tower Shield"
	appro_skill = /datum/skill/craft/armorsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/natural/plankshort, /obj/item/natural/plankshort)
	created_item = /obj/item/rogueweapon/shield/tower
	craftdiff = 2

/datum/anvil_recipe/weapons/ironbuckler
	name = "Buckler"
	recipe_name = "a small Shield"
	appro_skill = /datum/skill/craft/armorsmithing
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/shield/tower/buckleriron
	craftdiff = 1

/datum/anvil_recipe/weapons/warclub
	name = "Warclub (+w)"
	recipe_name = "a Warclub"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/mace/goden
	craftdiff = 2

/datum/anvil_recipe/weapons/zweihander
	name = "Zweihander (3)"
	recipe_name = "a Zweihander"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron, /obj/item/ingot/iron)
	created_item = /obj/item/rogueweapon/sword/long/greatsword/zwei
	craftdiff = 3

// STEEL GEAR - Fancy shit for Knights

/datum/anvil_recipe/weapons/axe_steel
	name = "Axe (+s)"
	recipe_name = "an Axe"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/axe/steel
	craftdiff = 2

/datum/anvil_recipe/weapons/warhammer
	name = "Warhammer(+s)"
	recipe_name = "a big warhammer"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = 	/obj/item/rogueweapon/hammer/sledgehammer/war


/datum/anvil_recipe/weapons/battleaxe
	name = "Battle Axe (2)"
	recipe_name = "a Battle Axe"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/axe/battle
	craftdiff = 3

/datum/anvil_recipe/weapons/billhook
	name = "Billhook (+w)"
	recipe_name = "a Billhook"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/polearm/spear/billhook
	craftdiff = 3

/datum/anvil_recipe/weapons/cleaver
	name = "Cleaver"
	recipe_name = "a Cleaver"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/knife/cleaver
	craftdiff = 1

/datum/anvil_recipe/weapons/crossbow_eng
	name = "Crossbow (+w) (+f)"
	recipe_name = "a Crossbow"
	appro_skill = /datum/skill/craft/engineering
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/natural/plank, /obj/item/natural/fibers)
	created_item = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
	craftdiff = 1 // Minimal engineering needed

/datum/anvil_recipe/weapons/cutlass_steel
	name = "Cutlass"
	recipe_name = "a Cutlass"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/sabre/cutlass
	craftdiff = 2

/datum/anvil_recipe/weapons/dagger_steel
	name = "Dagger x2"
	recipe_name = "a couple Daggers"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/knife/dagger/steel
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
	created_item = /obj/item/rogueweapon/polearm/eaglebeak
	craftdiff = 3

/datum/anvil_recipe/weapons/flail_steel
	name = "Flail (+c) (+s)"
	recipe_name = "a Flail"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/rope/chain, /obj/item/grown/log/tree/stick)
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
	created_item = /obj/item/rogueweapon/sword/long/greatsword
	craftdiff = 4

/datum/anvil_recipe/weapons/halberd
	name = "Halberd (2) (+w)"
	recipe_name = "a Halberd"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/polearm/halberd
	craftdiff = 4

/datum/anvil_recipe/weapons/huntknife
	name = "Hunting knife"
	recipe_name = "a Hunting Knife"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/knife/hunting
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

/datum/anvil_recipe/weapons/peasant_flail
	name = "Peasant Flail (+c) (+w)"
	recipe_name = "a two-handed flail"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/rope/chain, /obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/flail/peasant
	craftdiff = 3

/datum/anvil_recipe/weapons/paxe
	name = "Pick-Axe (2) (+s)"
	recipe_name = "a Pick that is also an Axe"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/pick/paxe
	craftdiff = 3

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
	created_item = /obj/item/rogueweapon/sword/arming
	craftdiff = 2

/datum/anvil_recipe/weapons/scimitar_steel
	name = "Scimitar"
	recipe_name = "a Zybean Sword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/scimitar
	craftdiff = 2

/datum/anvil_recipe/weapons/falchion
	name = "Falchion"
	recipe_name = "a heavy one handed sword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/scimitar/falchion
	craftdiff = 2

//Kaizoku Smithing content. I humbly ask for help; A way in which only people with the trait "Kaizoku", being the ones able to make Kaizoku weapons and armor. In another hand,
//they cannot make most (exceptions; the objects that have no abyssariad alternative) armors and weapons.

/datum/anvil_recipe/weapons/sword_steel
	name = "Uchigatana zatana"
	recipe_name = "a Uchigatana"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/uchigatana
	craftdiff = 2

/datum/anvil_recipe/weapons/odachi
	name = "Odachi zatana (3)"
	recipe_name = "a Odachi"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/sword/long/greatsword/odachi
	craftdiff = 4

/datum/anvil_recipe/weapons/tachi
	name = "Tachi zatana (2)"
	recipe_name = "a Tachi"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/sword/long/tachi
	craftdiff = 3

/datum/anvil_recipe/weapons/jiansword
	name = "Jian sword"
	recipe_name = "a Jian sword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/sword/iron/jian

/datum/anvil_recipe/weapons/daosword
	name = "Dao sword"
	recipe_name = "a Dao Sword"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/sword/scimitar/messer/dao

/datum/anvil_recipe/weapons/yuntoudao
	name = "Yuntoudao"
	recipe_name = "a willow-shaped sword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/scimitar/falchion/yuntoudao
	craftdiff = 2

/datum/anvil_recipe/weapons/shortjian
	name = "Short Jian"
	recipe_name = "a Short Jian"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/short/jian
	craftdiff = 1

/datum/anvil_recipe/weapons/wakizashi
	name = "Wakisashi Zatana"
	recipe_name = "a Wakizashi"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/short/wakizashi
	craftdiff = 1

/datum/anvil_recipe/weapons/piandao
	name = "Piandao"
	recipe_name = "a Piandao"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/sabre/piandao
	craftdiff = 2

/datum/anvil_recipe/weapons/decpiandao
	name = "Decorated piandao (+g)"
	recipe_name = "a Decorated Piandao"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/gold)
	created_item = /obj/item/rogueweapon/sword/sabre/piandao/dec
	craftdiff = 3

/datum/anvil_recipe/weapons/kanabo
	name = "Iron Kanabo Warclub (+w)"
	recipe_name = "a Iron kanabo"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/mace/goden/kanabo
	craftdiff = 2

/datum/anvil_recipe/weapons/tetsubo
	name = "Steel Tetsubo Warclub (+w)"
	recipe_name = "a Steel Tetsubo"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/mace/goden/steel/tetsubo
	craftdiff = 3

/datum/anvil_recipe/weapons/iararebo
	name = "Iron ararebo club (+s)"
	recipe_name = "a Iron Ararebo Club"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/mace/ararebo

/datum/anvil_recipe/weapons/sararebo
	name = "Steel Ararebo club (2)"
	recipe_name = "a Steel Ararebo "
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/mace/steel/ararebo
	craftdiff = 2

/datum/anvil_recipe/weapons/kusarifundo
	name = "Kusarifundo (+c) (+s)"
	recipe_name = "a Kusarifundo"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/rope/chain, /obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/flail/sflail/kusarifundo
	craftdiff = 2

/datum/anvil_recipe/weapons/kunai
	name = "Kunai"
	recipe_name = "a Kunai"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/knife/kaizoku/kunai
	craftdiff = 1

/datum/anvil_recipe/weapons/tanto
	name = "Tanto smallsword x2"
	recipe_name = "a couple Tantos"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/knife/kaizoku/tanto
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/weapons/kaiken
	name = "Kaiken knife x2"
	recipe_name = "a couple Daggers"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/knife/kaizoku/kaiken
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 3

/datum/anvil_recipe/weapons/sai //not made of iron. Still Less damage tho.
	name = "Sai x2"
	recipe_name = "a couple of Sai"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/knife/kaizoku/sai
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 3

/datum/anvil_recipe/weapons/yari
	name = "yari x2 (+w)"
	recipe_name = "a couple Spears"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/polearm/spear/yari
	createmultiple = TRUE
	createditem_num = 1

/datum/anvil_recipe/weapons/katakama
	name = "Katakama Yari x2 (+w) (+i)"
	recipe_name = "a couple Spears"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small, /obj/item/ingot/iron)
	created_item = /obj/item/rogueweapon/polearm/spear/yari/katakama

/datum/anvil_recipe/weapons/jumonji
	name = "Jumonji Yari (+w)"
	recipe_name = "a Jumonji Yari"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/polearm/spear/billhook/jumonji
	craftdiff = 3

/datum/anvil_recipe/weapons/naginata
	name = "Traditional Naginata (2) (+w)"
	recipe_name = "a Naginata"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron,/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/polearm/halberd/bardiche/naginata
	craftdiff = 2

/datum/anvil_recipe/weapons/tsukushi
	name = "Tsukushi Naginata x2 (2) (+w)"
	recipe_name = "a couple of Massproduced Naginata"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron,/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/polearm/halberd/bardiche/naginata/tsukushi
	craftdiff = 1
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/weapons/bisento
	name = "Bisento (3) (+w)"
	recipe_name = "a Bisento"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/grown/log/tree/small,/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/polearm/halberd/bisento
	craftdiff = 5

/datum/anvil_recipe/weapons/onobattle
	name = "Ono Battle Axe (2)"
	recipe_name = "a Ono Battle Axe"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/battle/ono
	craftdiff = 3

/datum/anvil_recipe/weapons/changfu
	name = "changfu woodcutter (+s)"
	recipe_name = "an Chang-fu"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/woodcut/changfu

//Unique few
/datum/anvil_recipe/weapons/jitte
	name = "Jitte Cudgel"
	recipe_name = "an Jitte"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/mace/cudgel/jitte

/datum/anvil_recipe/weapons/otsuchi
	name = "Otsuchi warhammer (+l)"
	recipe_name = "a Otsuchi Warhammer"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/mace/goden/otsuchi

/datum/anvil_recipe/weapons/kusarigama
	name = "Kusarigama (+c) (+s)"
	recipe_name = "a Kusarigama"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/rope/chain, /obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/flail/kusarigama

/datum/anvil_recipe/weapons/mancatcher
	name = "Mancatchers x2 (+w)"
	recipe_name = "a couple Mancatchers"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/polearm/mancatcher
	createmultiple = TRUE
	createditem_num = 1

/datum/anvil_recipe/weapons/onothrow
	name = "Ono throwing axe (2)"
	recipe_name = "a Ono Throwing Axe"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/thrown/ono
	craftdiff = 3

/datum/anvil_recipe/weapons/tetsubishi
	name = "tetsubishi caltrop (2)"
	recipe_name = "a Tetsubishi"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/tetsubishi
	craftdiff = 2

/datum/anvil_recipe/weapons/kama
	name = "Kama sickle (2)"
	recipe_name = "a Warsickle"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/sickle/kama
	craftdiff = 2
