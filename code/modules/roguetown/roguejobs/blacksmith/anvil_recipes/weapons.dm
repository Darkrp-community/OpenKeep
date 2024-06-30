/datum/anvil_recipe/weapons
	appro_skill = /datum/skill/craft/weaponsmithing

// SILVER - Just the dagger

/datum/anvil_recipe/weapons/sidagger
	name = "Dagger"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/silver
	created_item = /obj/item/rogueweapon/huntingknife/idagger/silver

// COPPER TIER - Pretty dogshit, but EXTREMELY cheap.

/datum/anvil_recipe/weapons/cmesser
	name = "Messer (+1s)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/copper
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/sword/coppermesser

/datum/anvil_recipe/weapons/cdagger
	name = "Dagger x2"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/copper
	created_item = list(/obj/item/rogueweapon/knife/copperdagger, 
						/obj/item/rogueweapon/knife/copperdagger)

/datum/anvil_recipe/weapons/cbludgeon
	name = "Bludgeon (+s)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/copper
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = list(/obj/item/rogueweapon/mace/copperbludgeon)

/datum/anvil_recipe/weapons/cmace
	name = "Mace (2)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/copper
	additional_items = list(/obj/item/ingot/copper)
	created_item = (/obj/item/rogueweapon/mace/coppermace)

/datum/anvil_recipe/weapons/caxe
	name = "Axe (2)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/copper
	additional_items = list(/obj/item/ingot/copper)
	created_item = (/obj/item/rogueweapon/copperaxe)

/datum/anvil_recipe/weapons/cspears
	name = "Spear x2 (+4s)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/copper
	additional_items = list(/obj/item/grown/log/tree/stick,/obj/item/grown/log/tree/stick,/obj/item/grown/log/tree/stick,/obj/item/grown/log/tree/stick)
	created_item = list(/obj/item/rogueweapon/copperspear, 
						/obj/item/rogueweapon/copperspear)


// IRON GEAR - Middle Tier, what most disgusting Men at Arms have

/datum/anvil_recipe/weapons/arrows
	name = "Arrows x3 (+s)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = list(/obj/projectile/bullet/reusable/arrow, 
						/obj/projectile/bullet/reusable/arrow, 
						/obj/projectile/bullet/reusable/arrow)

/datum/anvil_recipe/weapons/axe
	name = "Axe (+s)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/woodcut

/datum/anvil_recipe/weapons/bardiche
	name = "Bardiche (2) (+w)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron,/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/halberd/bardiche

/datum/anvil_recipe/weapons/bolts
	name = "Crossbow Bolt x3 (+s)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = list(/obj/item/ammo_casing/caseless/rogue/bolt, 
						/obj/item/ammo_casing/caseless/rogue/bolt, 
						/obj/item/ammo_casing/caseless/rogue/bolt)

/datum/anvil_recipe/weapons/idagger
	name = "Dagger"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	created_item = list(/obj/item/rogueweapon/huntingknife/idagger,
	/obj/item/rogueweapon/huntingknife/idagger)

/datum/anvil_recipe/weapons/iflail
	name = "Flail"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/flail

/datum/anvil_recipe/weapons/mace
	name = "Mace (+s)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/mace

/datum/anvil_recipe/weapons/imesser
	name = "Messer"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/sword/iron/messer

/datum/anvil_recipe/weapons/spear
    name = "Spear x2 (+w)"
    appro_skill = /datum/skill/craft/weaponsmithing
    req_bar = /obj/item/ingot/iron
    additional_items = list(/obj/item/grown/log/tree/small)
    created_item = list(/obj/item/rogueweapon/spear,
                        /obj/item/rogueweapon/spear)

/datum/anvil_recipe/weapons/isword
	name = "Sword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/sword/iron

/datum/anvil_recipe/weapons/iswordshort
	name = "Short sword"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/sword/iron/short

/datum/anvil_recipe/weapons/ironshield
	name = "Tower Shield (+w)"
	appro_skill = /datum/skill/craft/armorsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/shield/tower

/datum/anvil_recipe/weapons/zweihander
	name = "Zweihander (3)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron, /obj/item/ingot/iron)
	created_item = /obj/item/rogueweapon/greatsword/zwei

// STEEL GEAR - Fancy shit for Knights

/datum/anvil_recipe/weapons/saxe
	name = "Axe (+s)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/woodcut/steel

/datum/anvil_recipe/weapons/baxe
	name = "Battle Axe (2)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/battle

/datum/anvil_recipe/weapons/billhook
	name = "Billhook (+w)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/spear/billhook

/datum/anvil_recipe/weapons/cleaver
	name = "Cleaver"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/huntingknife/cleaver

/datum/anvil_recipe/weapons/xbow
	name = "Crossbow (+w) (+f)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/small, /obj/item/natural/fibers)
	created_item = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow

/datum/anvil_recipe/weapons/scutlass
	name = "Cutlass"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/cutlass

/datum/anvil_recipe/weapons/sdagger
	name = "Dagger"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = list(/obj/item/rogueweapon/huntingknife/idagger/steel,
	/obj/item/rogueweapon/huntingknife/idagger/steel)

/datum/anvil_recipe/weapons/decsword
	name = "Decorated sword (+g)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/gold)
	created_item = /obj/item/rogueweapon/sword/decorated

/datum/anvil_recipe/weapons/decsaber
	name = "Decorated sabre (+g)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/gold)
	created_item = /obj/item/rogueweapon/sword/sabre/dec

/datum/anvil_recipe/weapons/decrapier
	name = "Decorated rapier (+g)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/gold)
	created_item = /obj/item/rogueweapon/sword/rapier/dec

/datum/anvil_recipe/weapons/eaglebeak
	name = "Eagle's Beak (2) (+w)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/eaglebeak

/datum/anvil_recipe/weapons/sflail
	name = "Flail"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/flail/sflail

/datum/anvil_recipe/weapons/grandmace
	name = "Grand Mace (+w)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/mace/goden/steel

/datum/anvil_recipe/weapons/greatsword
	name = "Greatsword (3)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/greatsword

/datum/anvil_recipe/weapons/halbert
	name = "Halberd (2) (+w)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/halberd

/datum/anvil_recipe/weapons/hknife
	name = "Hunting knife"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/huntingknife

/datum/anvil_recipe/weapons/steelshield
	name = "Kite Shield (2) (+h)"
	appro_skill = /datum/skill/craft/armorsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/natural/hide)
	created_item = /obj/item/rogueweapon/shield/tower/metal

/datum/anvil_recipe/weapons/tsword
	name = "Longsword (2)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/sword/long

/datum/anvil_recipe/weapons/lucerne
	name = "Lucerne (2) (+w)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron,/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/eaglebeak/lucerne

/datum/anvil_recipe/weapons/smace
	name = "Mace (2)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/mace/steel

/datum/anvil_recipe/weapons/srapier
	name = "Rapier"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/rapier

/datum/anvil_recipe/weapons/ssaber
	name = "Sabre"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/sabre

/datum/anvil_recipe/weapons/sswordshort
	name = "Shortsword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/short

/datum/anvil_recipe/weapons/ssword
	name = "Sword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword

/datum/anvil_recipe/weapons/polemace
	name = "Warclub (+w)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/mace/goden

