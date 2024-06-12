
/obj/item/roguekey
	name = "key"
	desc = "A simple key of simple uses."
	icon_state = "iron"
	icon = 'icons/roguetown/items/keys.dmi'
	lefthand_file = 'icons/mob/inhands/misc/food_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/food_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	dropshrink = 0.75
	throwforce = 0
	var/lockhash = 0
	var/lockid = null
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_MOUTH|ITEM_SLOT_NECK

/obj/item/roguekey/Initialize()
	. = ..()
	if(lockid)
		if(GLOB.lockids[lockid])
			lockhash = GLOB.lockids[lockid]
		else
			lockhash = rand(100,999)
			while(lockhash in GLOB.lockhashes)
				lockhash = rand(100,999)
			GLOB.lockhashes += lockhash
			GLOB.lockids[lockid] = lockhash
	else if(!lockhash)
		qdel(src)

/obj/item/roguekey/lord
	name = "master key"
	icon_state = "bosskey"
	lockid = "lord"

/obj/item/roguekey/lord/pre_attack(target, user, params)
	. = ..()
	if(istype(target, /obj/structure/closet))
		var/obj/structure/closet/C = target
		if(C.masterkey)
			lockhash = C.lockhash
	if(istype(target, /obj/structure/mineral_door))
		var/obj/structure/mineral_door/D = target
		if(D.masterkey)
			lockhash = D.lockhash


/obj/item/roguekey/manor
	name = "manor key"
	icon_state = "mazekey"
	lockid = "manor"

/obj/item/roguekey/queen
	name = "lord key"
	icon_state = "mazekey"
	lockid = "lord"

/obj/item/roguekey/garrison
	name = "town watch key"
	icon_state = "spikekey"
	lockid = "garrison"

/obj/item/roguekey/dungeon
	name = "dungeon key"
	icon_state = "rustkey"
	lockid = "dungeon"

/obj/item/roguekey/soilson
	name = "Soilson Key"
	icon_state = "rustkey"
	lockid = "woodsm"

/obj/item/roguekey/warehouse
	name = "Warehouse Key"
	icon_state = "rustkey"
	lockid = "warehouse"

/obj/item/roguekey/vault
	name = "vault key"
	icon_state = "cheesekey"
	lockid = "vault"

/obj/item/roguekey/captain
	name = "captain's key"
	icon_state = "cheesekey"
	lockid = "sheriff"

/obj/item/roguekey/merchant
	name = "merchant's key"
	icon_state = "cheesekey"
	lockid = "merchant"

/obj/item/roguekey/shop
	name = "shop key"
	icon_state = "ekey"
	lockid = "shop"

/obj/item/roguekey/tavern
	name = "tavern key"
	icon_state = "hornkey"
	lockid = "tavern"

/obj/item/roguekey/roomi
	name = "room I key"
	icon_state = "brownkey"
	lockid = "roomi"

/obj/item/roguekey/roomii
	name = "room II key"
	icon_state = "brownkey"
	lockid = "roomii"

/obj/item/roguekey/roomiii
	name = "room III key"
	icon_state = "brownkey"
	lockid = "roomiii"

/obj/item/roguekey/roomiv
	name = "room IV key"
	icon_state = "brownkey"
	lockid = "roomiv"

/obj/item/roguekey/roomv
	name = "room V key"
	icon_state = "brownkey"
	lockid = "roomv"

/obj/item/roguekey/roomvi
	name = "room VI key"
	icon_state = "brownkey"
	lockid = "roomvi"

/obj/item/roguekey/roomhunt
	name = "room HUNT key"
	icon_state = "brownkey"
	lockid = "roomhunt"

//vampire mansion//
/obj/item/roguekey/vampire
	name = "mansion key"
	icon_state = "vampkey"
	lockid = "mansionvampire"
//

/obj/item/roguekey/blacksmith
	name = "blacksmith key"
	icon_state = "brownkey"
	lockid = "blacksmith"

/obj/item/roguekey/butcher
	name = "butcher key"
	icon_state = "rustkey"
	lockid = "butcher"

/obj/item/roguekey/walls
	name = "walls key"
	icon_state = "rustkey"
	lockid = "walls"

/obj/item/roguekey/church
	name = "church key"
	icon_state = "brownkey"
	lockid = "priest"

/obj/item/roguekey/priest
	name = "priest's key"
	icon_state = "cheesekey"
	lockid = "hpriest"

/obj/item/roguekey/tower
	name = "tower key"
	icon_state = "greenkey"
	lockid = "tower"

/obj/item/roguekey/mage
	name = "magicians's key"
	icon_state = "eyekey"
	lockid = "mage"

/obj/item/roguekey/graveyard
	name = "crypt key"
	icon_state = "rustkey"
	lockid = "graveyard"

/obj/item/roguekey/mason
	name = "mason's key"
	icon_state = "brownkey"
	lockid = "mason"

/obj/item/roguekey/nightman
	name = "nightmaster's key"
	icon_state = "greenkey"
	lockid = "nightman"

/obj/item/roguekey/nightmaiden
	name = "nightmaiden's key"
	icon_state = "brownkey"
	lockid = "nightmaiden"

/obj/item/roguekey/mercenary
	name = "mercenary key"
	icon_state = "greenkey"
	lockid = "mercenary"

/obj/item/roguekey/puritan
	name = "puritan's key"
	icon_state = "mazekey"
	lockid = "puritan"

/obj/item/roguekey/confession
	name = "confessional key"
	icon_state = "brownkey"
	lockid = "confession"

/obj/item/roguekey/hand
	name = "hand's key"
	icon_state = "cheesekey"
	lockid = "hand"

/obj/item/roguekey/steward
	name = "steward's key"
	icon_state = "cheesekey"
	lockid = "steward"

/obj/item/roguekey/archive
	name = "archive key"
	icon_state = "ekey"
	lockid = "archive"
//grenchensnacker
/obj/item/roguekey/porta
	name = "strange key"
	icon_state = "eyekey"
	lockid = "porta"

// Dakkatown Keys
/obj/item/roguekey/monastery
	name = "monastery key"
	icon_state = "greenkey"
	lockid = "monastery"

/obj/item/roguekey/houses
	name = ""
	icon_state = ""
	lockid = ""

/obj/item/roguekey/houses/house1
	name = "house i key"
	icon_state = "brownkey"
	lockid = "house1"

/obj/item/roguekey/houses/house2
	name = "house ii key"
	icon_state = "brownkey"
	lockid = "house2"

/obj/item/roguekey/houses/house3
	name = "house iii key"
	icon_state = "brownkey"
	lockid = "house3"

/obj/item/roguekey/houses/house4
	name = "house iv key"
	icon_state = "brownkey"
	lockid = "house4"

/obj/item/roguekey/houses/house5
	name = "house v key"
	icon_state = "brownkey"
	lockid = "house5"

/obj/item/roguekey/houses/house6
	name = "house vi key"
	icon_state = "brownkey"
	lockid = "house6"

/obj/item/roguekey/houses/house7
	name = "house vii key"
	icon_state = "brownkey"
	lockid = "house7"

/obj/item/roguekey/houses/house8
	name = "house viii key"
	icon_state = "brownkey"
	lockid = "house8"

/obj/item/roguekey/houses/house9
	name = "house ix key"
	icon_state = "brownkey"
	lockid = "house9"

/obj/item/roguekey/apartments
	name = ""
	icon_state = ""
	lockid = ""

/obj/item/roguekey/apartments/apartment1
	name = "apartment i key"
	icon_state = "brownkey"
	lockid = "apartment1"

/obj/item/roguekey/apartments/apartment2
	name = "apartment ii key"
	icon_state = "brownkey"
	lockid = "apartment2"

/obj/item/roguekey/apartments/apartment3
	name = "apartment iii key"
	icon_state = "brownkey"
	lockid = "apartment3"

/obj/item/roguekey/apartments/apartment4
	name = "apartment iv key"
	icon_state = "brownkey"
	lockid = "apartment4"

/obj/item/roguekey/apartments/apartment5
	name = "apartment v key"
	icon_state = "brownkey"
	lockid = "apartment5"

/obj/item/roguekey/apartments/apartment6
	name = "apartment vi key"
	icon_state = "brownkey"
	lockid = "apartment6"

/obj/item/roguekey/apartments/apartment7
	name = "apartment vii key"
	icon_state = "brownkey"
	lockid = "apartment7"

/obj/item/roguekey/apartments/apartment8
	name = "apartment viii key"
	icon_state = "brownkey"
	lockid = "apartment8"

/obj/item/roguekey/apartments/apartment9
	name = "apartment ix key"
	icon_state = "brownkey"
	lockid = "apartment9"

/obj/item/roguekey/shops
	name = ""
	icon_state = ""
	lockid = ""

/obj/item/roguekey/shops/shop1
	name = "shop i key"
	icon_state = "rustkey"
	lockid = "shop1"

/obj/item/roguekey/shops/shop2
	name = "shop ii key"
	icon_state = "rustkey"
	lockid = "shop2"

/obj/item/roguekey/shops/shop3
	name = "shop iii key"
	icon_state = "rustkey"
	lockid = "shop3"

/obj/item/roguekey/shops/shop4
	name = "shop iv key"
	icon_state = "rustkey"
	lockid = "shop4"

/obj/item/roguekey/shops/shop5
	name = "shop v key"
	icon_state = "rustkey"
	lockid = "shop5"

/obj/item/roguekey/shops/shop6
	name = "shop vi key"
	icon_state = "rustkey"
	lockid = "shop6"

/obj/item/roguekey/shops/shop7
	name = "shop vii key"
	icon_state = "rustkey"
	lockid = "shop7"

/obj/item/roguekey/shops/shop8
	name = "shop viii key"
	icon_state = "rustkey"
	lockid = "shop8"

/obj/item/roguekey/shops/shop9
	name = "shop ix key"
	icon_state = "rustkey"
	lockid = "shop9"

/obj/item/roguekey/theatre
	name = "theatre key"
	icon_state = "mazekey"
	lockid = "theatre"

/obj/item/roguekey/butcher
	name = "butcher's key"
	icon_state = "rustkey"
	lockid = "butcher"

/obj/item/roguekey/farmer
	name = "farmer's key"
	icon_state = "rustkey"
	lockid = "farm"

obj/item/roguekey/elder
	name = "elder's key"
	icon_state = "rustkey"
	lockid = "elder"

obj/item/roguekey/apothecary
	name = "apothecary's key"
	icon_state = "rustkey"
	lockid = "apothecary"

obj/item/roguekey/weaponsmith
	name = "weaponsmith's key"
	icon_state = "rustkey"
	lockid = "weaponsmith"

obj/item/roguekey/armorsmith
	name = "armorsmith's key"
	icon_state = "rustkey"
	lockid = "armorsmith"
