
/obj/item/roguekey
	name = "old key"
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

/obj/item/lockpick
	name = "lockpick"
	desc = "A small, sharp piece of metal to aid opening locks in the absence of a key."
	icon_state = "lockpick"
	icon = 'icons/roguetown/items/keys.dmi'
	lefthand_file = 'icons/mob/inhands/misc/food_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/food_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	dropshrink = 0.75
	throwforce = 0
	max_integrity = 10
	picklvl = 1
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_MOUTH|ITEM_SLOT_NECK
	destroy_sound = 'sound/items/pickbreak.ogg'

/obj/item/roguekey/lord
	name = "master key"
	desc = "The Lord's key."
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

/obj/item/roguekey/lord/pre_attack_right(target, user, params)
	. = ..()
	if(istype(target, /obj/structure/closet))
		var/obj/structure/closet/C = target
		if(C.masterkey)
			lockhash = C.lockhash
	if(istype(target, /obj/structure/mineral_door))
		var/obj/structure/mineral_door/D = target
		if(D.masterkey)
			lockhash = D.lockhash

/obj/item/roguekey/lord/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	lockhash = GLOB.lockids[lockid]

/obj/item/roguekey/manor
	name = "manor key"
	desc = "This key will open any manor doors."
	icon_state = "mazekey"
	lockid = "manor"

/obj/item/roguekey/guest
	name = "guest key"
	desc = "The key to the manor's guest room. Given to visiting nobles."
	icon_state = "greenkey"
	lockid = "guest"

/obj/item/roguekey/butler // intended for chests, crates, cellar doors, NOT kitchen access
	name = "servants key"
	desc = "The key to the pantrys and cellars of the manor."
	icon_state = "mazekey"
	lockid = "butler"

/obj/item/roguekey/bandit // use the old key name for various old keys for dungeons etc, less dumb than bandit keys having a label on it saying bandit key
	icon_state = "mazekey"
	lockid = "banditcamp"

/obj/item/roguekey/queen
	name = "lady key"
	desc = "The Lady's key."
	icon_state = "mazekey"
	lockid = "lord"

/obj/item/roguekey/garrison
	name = "town watch key"
	desc = "This key belongs to the Garrison."
	icon_state = "spikekey"
	lockid = "garrison"

/obj/item/roguekey/forrestgarrison
	name = "forrest garrison key"
	desc = "This key belongs to the Forrest Garrison."
	icon_state = "spikekey"
	lockid = "forrestgarrison"

/obj/item/roguekey/dungeon
	name = "dungeon key"
	desc = "This key should unlock the rusty bars and doors of the dungeon."
	icon_state = "rustkey"
	lockid = "dungeon"

/obj/item/roguekey/soilson
	name = "Soilson Key"
	desc = "This key is used by the soilsons."
	icon_state = "rustkey"
	lockid = "soilson"

/obj/item/roguekey/warehouse
	name = "Warehouse Key"
	desc = "This key opens the Steward's warehouse."
	icon_state = "rustkey"
	lockid = "warehouse"

/obj/item/roguekey/vault
	name = "vault key"
	desc = "This key opens the mighty Vault."
	icon_state = "cheesekey"
	lockid = "vault"

/obj/item/roguekey/captain
	name = "captain's key"
	desc = "This key belongs to the Captain of the Guard."
	icon_state = "cheesekey"
	lockid = "sheriff"

/obj/item/roguekey/merchant
	name = "merchant's key"
	desc = "A key used by the Merchant's Guild."
	icon_state = "cheesekey"
	lockid = "merchant"

/obj/item/roguekey/shop
	name = "shop key"
	desc = "This key opens and closes a shop door."
	icon_state = "ekey"
	lockid = "shop"

/obj/item/roguekey/tavern
	name = "tavern key"
	desc = "This key should open and close any Inn door."
	icon_state = "hornkey"
	lockid = "tavern"

/obj/item/roguekey/roomi
	name = "room I key"
	desc = "The key to the first room."
	icon_state = "brownkey"
	lockid = "roomi"

/obj/item/roguekey/roomii
	name = "room II key"
	desc = "The key to the second room."
	icon_state = "brownkey"
	lockid = "roomii"

/obj/item/roguekey/roomiii
	name = "room III key"
	desc = "The key to the third room."
	icon_state = "brownkey"
	lockid = "roomiii"

/obj/item/roguekey/roomiv
	name = "room IV key"
	desc = "The key to the fourth room."
	icon_state = "brownkey"
	lockid = "roomiv"

/obj/item/roguekey/roomv
	name = "room V key"
	desc = "The key to the fifth room."
	icon_state = "brownkey"
	lockid = "roomv"

/obj/item/roguekey/roomvi
	name = "room VI key"
	desc = "The key to the sixth room."
	icon_state = "brownkey"
	lockid = "roomvi"

/obj/item/roguekey/medroomi
	name = "medium room I key"
	desc = "The key to the first medium room."
	icon_state = "brownkey"
	lockid = "medroomi"

/obj/item/roguekey/medroomii
	name = "medium room II key"
	desc = "The key to the second medium room."
	icon_state = "brownkey"
	lockid = "medroomii"

/obj/item/roguekey/medroomiii
	name = "medium room III key"
	desc = "The key to the third medium room."
	icon_state = "brownkey"
	lockid = "medroomiii"

/obj/item/roguekey/medroomiv
	name = "medium room IV key"
	desc = "The key to the fourth medium room."
	icon_state = "brownkey"
	lockid = "medroomiv"

/obj/item/roguekey/medroomv
	name = "medium room V key"
	desc = "The key to the fifth medium room."
	icon_state = "brownkey"
	lockid = "medroomv"

/obj/item/roguekey/medroomvi
	name = "medium room VI key"
	desc = "The key to the sixth medium room."
	icon_state = "brownkey"
	lockid = "medroomvi"

/obj/item/roguekey/luxroomi
	name = "luxury room I key"
	desc = "The key to the first luxury room."
	icon_state = "brownkey"
	lockid = "luxroomi"

/obj/item/roguekey/luxroomii
	name = "luxury room II key"
	desc = "The key to the second luxury room."
	icon_state = "brownkey"
	lockid = "luxroomii"

/obj/item/roguekey/luxroomiii
	name = "luxury room III key"
	desc = "The key to the third luxury room."
	icon_state = "brownkey"
	lockid = "luxroomiii"

/obj/item/roguekey/luxroomiv
	name = "luxury room IV key"
	desc = "The key to the fourth luxury room."
	icon_state = "brownkey"
	lockid = "luxroomiv"

/obj/item/roguekey/luxroomv
	name = "luxury room V key"
	desc = "The key to the fifth luxury room."
	icon_state = "brownkey"
	lockid = "luxroomv"

/obj/item/roguekey/luxroomiv
	name = "luxury room VI key"
	desc = "The key to the sixth luxury room."
	icon_state = "brownkey"
	lockid = "luxroomvi"

/obj/item/roguekey/roomhunt
	name = "room HUNT key"
	desc = "The key to the most luxurious Inn room."
	icon_state = "brownkey"
	lockid = "roomhunt"

//vampire mansion//
/obj/item/roguekey/vampire
	desc = "This key is awfully pink and weirdly shaped."
	icon_state = "vampkey"
	lockid = "mansionvampire"


/obj/item/roguekey/blacksmith
	name = "blacksmith key"
	desc = "This key opens a blacksmith's workshop."
	icon_state = "brownkey"
	lockid = "blacksmith"

/obj/item/roguekey/butcher
	name = "butcher key"
	desc = "There's some dried blood on this key, it's probably the butchers."
	icon_state = "rustkey"
	lockid = "butcher"

/obj/item/roguekey/walls
	desc = "This is a rusty key for the walls."
	icon_state = "rustkey"
	lockid = "walls"

/obj/item/roguekey/church
	name = "church key"
	desc = "This bronze key should open almost all doors in the church."
	icon_state = "brownkey"
	lockid = "priest"

/obj/item/roguekey/priest
	name = "priest's key"
	desc = "This is the master key of the church."
	icon_state = "cheesekey"
	lockid = "hpriest"

/obj/item/roguekey/tower
	name = "tower key"
	desc = "This key should open anything within the tower."
	icon_state = "greenkey"
	lockid = "tower"

/obj/item/roguekey/mage
	name = "magicians's key"
	desc = "This is the Court Magician's key. It watches you..."
	icon_state = "eyekey"
	lockid = "mage"

/obj/item/roguekey/graveyard
	desc = "This rusty key belongs to the Gravekeepers."
	icon_state = "rustkey"
	lockid = "graveyard"

/obj/item/roguekey/artificer
	name = "artificer's key"
	desc = "This bronze key should open the Artificer's guild."
	icon_state = "brownkey"
	lockid = "artificer"

/obj/item/roguekey/niteman
	name = "apothecary's key"
	desc = "The master key of Eora's House."
	icon_state = "greenkey"
	lockid = "nightman"

/obj/item/roguekey/nitemaiden
	name = "bathhouse key"
	desc = "This brownish key opens a few doors within the pleasure house."
	icon_state = "brownkey"
	lockid = "nightmaiden"

/obj/item/roguekey/mercenary
	name = "mercenary key"
	desc = "Why, a mercenary would not kick doors down."
	icon_state = "greenkey"
	lockid = "mercenary"

/obj/item/roguekey/inquisition
	name = "inquisition key"
	desc = "This is an intricate key."
	icon_state = "mazekey"
	lockid = "puritan"

/obj/item/roguekey/confession
	name = "confessional key"
	desc = "This key opens the doors of the confessional."
	icon_state = "brownkey"
	lockid = "confession"

/obj/item/roguekey/hand
	name = "hand's key"
	desc = "This regal key belongs to the King's Right Hand."
	icon_state = "cheesekey"
	lockid = "hand"

/obj/item/roguekey/steward
	name = "steward's key"
	desc = "This key belongs to the King's greedy Steward."
	icon_state = "cheesekey"
	lockid = "steward"

/obj/item/roguekey/archive
	name = "archive key"
	desc = "This key looks barely used."
	icon_state = "ekey"
	lockid = "archive"

/obj/item/roguekey/doctor
	name = "doctor's key"
	desc = "This key is used by the Physickers."
	icon_state = "birdkey"
	lockid = "doctor"

//grenchensnacker
/obj/item/roguekey/porta
	name = "strange key"
	desc = "Was this key enchanted by a locksmith..?"
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
	name = "house I key"
	icon_state = "brownkey"
	lockid = "house1"

/obj/item/roguekey/houses/house2
	name = "house II key"
	icon_state = "brownkey"
	lockid = "house2"

/obj/item/roguekey/houses/house3
	name = "house III key"
	icon_state = "brownkey"
	lockid = "house3"

/obj/item/roguekey/houses/house4
	name = "house IV key"
	icon_state = "brownkey"
	lockid = "house4"

/obj/item/roguekey/houses/house5
	name = "house V key"
	icon_state = "brownkey"
	lockid = "house5"

/obj/item/roguekey/houses/house6
	name = "house VI key"
	icon_state = "brownkey"
	lockid = "house6"

/obj/item/roguekey/houses/house7
	name = "house VII key"
	icon_state = "brownkey"
	lockid = "house7"

/obj/item/roguekey/houses/house8 //Not currently in use on Dun_Manor
	name = "house VIII key"
	icon_state = "brownkey"
	lockid = "house8"

/obj/item/roguekey/houses/house9
	name = "house IX key"
	icon_state = "brownkey"
	lockid = "house9"

/obj/item/roguekey/houses/waterfront1
	name = "I waterfront street key"
	icon_state = "brownkey"
	lockid = "1waterfront"

/obj/item/roguekey/houses/waterfront2
	name = "II waterfront street key"
	icon_state = "brownkey"
	lockid = "2waterfront"

/obj/item/roguekey/houses/waterfront3
	name = "III waterfront street key"
	icon_state = "brownkey"
	lockid = "3waterfront"

/obj/item/roguekey/houses/waterfront4
	name = "IV waterfront street key"
	icon_state = "brownkey"
	lockid = "4waterfront"

/obj/item/roguekey/houses/waterfront5
	name = "V waterfront street key"
	icon_state = "brownkey"
	lockid = "5waterfront"

/obj/item/roguekey/apartments
	name = ""
	icon_state = ""
	lockid = ""

/obj/item/roguekey/apartments/slums1
	name = "slums I key"
	icon_state = "brownkey"
	lockid = "slums1"

/obj/item/roguekey/apartments/slums2
	name = "slums II key"
	icon_state = "brownkey"
	lockid = "slums2"

/obj/item/roguekey/apartments/slums3
	name = "slums III key"
	icon_state = "brownkey"
	lockid = "slums3"

/obj/item/roguekey/apartments/slums4
	name = "slums IV key"
	icon_state = "brownkey"
	lockid = "slums4"

/obj/item/roguekey/apartments/slums5
	name = "slums V key"
	icon_state = "brownkey"
	lockid = "slums5"

/obj/item/roguekey/apartments/slums6
	name = "slums VI key"
	icon_state = "brownkey"
	lockid = "slums6"

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

/obj/item/roguekey/apartments/apartment10
	name = "apartment x key"
	icon_state = "brownkey"
	lockid = "apartment10"

/obj/item/roguekey/apartments/apartment11
	name = "apartment xi key"
	icon_state = "brownkey"
	lockid = "apartment11"

/obj/item/roguekey/apartments/apartment12
	name = "apartment xii key"
	icon_state = "brownkey"
	lockid = "apartment12"

/obj/item/roguekey/apartments/apartment13
	name = "apartment xiii key"
	icon_state = "brownkey"
	lockid = "apartment13"

/obj/item/roguekey/apartments/apartment14
	name = "apartment xiv key"
	icon_state = "brownkey"
	lockid = "apartment14"

/obj/item/roguekey/apartments/apartment15
	name = "apartment xv key"
	icon_state = "brownkey"
	lockid = "apartment15"

/obj/item/roguekey/apartments/apartment16
	name = "apartment xvi key"
	icon_state = "brownkey"
	lockid = "apartment16"

/obj/item/roguekey/apartments/apartment17
	name = "apartment xvii key"
	icon_state = "brownkey"
	lockid = "apartment17"

/obj/item/roguekey/apartments/apartment18
	name = "apartment xviii key"
	icon_state = "brownkey"
	lockid = "apartment18"

/obj/item/roguekey/apartments/apartment19
	name = "apartment xix key"
	icon_state = "brownkey"
	lockid = "apartment19"

/obj/item/roguekey/apartments/apartment20
	name = "apartment xx key"
	icon_state = "brownkey"
	lockid = "apartment20"

/obj/item/roguekey/apartments/apartment21
	name = "apartment xxi key"
	icon_state = "brownkey"
	lockid = "apartment21"

/obj/item/roguekey/apartments/apartment22
	name = "apartment xxii key"
	icon_state = "brownkey"
	lockid = "apartment22"

/obj/item/roguekey/apartments/apartment23
	name = "apartment xxiii key"
	icon_state = "brownkey"
	lockid = "apartment23"

/obj/item/roguekey/apartments/apartment24
	name = "apartment xxiv key"
	icon_state = "brownkey"
	lockid = "apartment24"

/obj/item/roguekey/apartments/apartment25
	name = "apartment xxv key"
	icon_state = "brownkey"
	lockid = "apartment25"

/obj/item/roguekey/apartments/penthouse1
	name = "penthouse i key"
	icon_state = "brownkey"
	lockid = "penthouse1"

/obj/item/roguekey/apartments/penthouse2
	name = "penthouse ii key"
	icon_state = "brownkey"
	lockid = "penthouse2"

/obj/item/roguekey/shops
	name = ""
	icon_state = ""
	lockid = ""

/obj/item/roguekey/shops/shop1
	name = "shop I key"
	icon_state = "rustkey"
	lockid = "shop1"

/obj/item/roguekey/shops/shopwarehouse1
	name = "shop I warehouse key"
	icon_state = "rustkey"
	lockid = "shop1ware"

/obj/item/roguekey/shops/shop2
	name = "shop II key"
	icon_state = "rustkey"
	lockid = "shop2"

/obj/item/roguekey/shops/shopwarehouse2
	name = "shop II warehouse key"
	icon_state = "rustkey"
	lockid = "shop2ware"

/obj/item/roguekey/shops/shop3
	name = "shop III key"
	icon_state = "rustkey"
	lockid = "shop3"

/obj/item/roguekey/shops/shopwarehouse3
	name = "shop III warehouse key"
	icon_state = "rustkey"
	lockid = "shop3ware"

/obj/item/roguekey/shops/shop4
	name = "shop IV key"
	icon_state = "rustkey"
	lockid = "shop4"

/obj/item/roguekey/shops/shopwarehouse4
	name = "shop IV warehouse key"
	icon_state = "rustkey"
	lockid = "shop4ware"

/obj/item/roguekey/shops/shop5
	name = "shop V key"
	icon_state = "rustkey"
	lockid = "shop5"

/obj/item/roguekey/shops/shopwarehouse5
	name = "shop V warehouse key"
	icon_state = "rustkey"
	lockid = "shop5ware"

/obj/item/roguekey/shops/shop6
	name = "shop VI key"
	icon_state = "rustkey"
	lockid = "shop6"

/obj/item/roguekey/shops/shopwarehouse6
	name = "shop VI warehouse key"
	icon_state = "rustkey"
	lockid = "shop6ware"

/obj/item/roguekey/shops/shop7
	name = "shop VII key"
	icon_state = "rustkey"
	lockid = "shop7"

/obj/item/roguekey/shops/shopwarehouse7
	name = "shop VII warehouse key"
	icon_state = "rustkey"
	lockid = "shop7ware"

/obj/item/roguekey/shops/shop8
	name = "shop VIII key"
	icon_state = "rustkey"
	lockid = "shop8"

/obj/item/roguekey/shops/shopwarehouse8
	name = "shop VIII warehouse key"
	icon_state = "rustkey"
	lockid = "shop8ware"

/obj/item/roguekey/shops/shop9
	name = "shop IX key"
	icon_state = "rustkey"
	lockid = "shop9"

/obj/item/roguekey/shops/shopwarehouse9
	name = "shop IX warehouse key"
	icon_state = "rustkey"
	lockid = "shop9ware"

/obj/item/roguekey/theatre
	name = "theatre key"
	icon_state = "mazekey"
	lockid = "theatre"

/obj/item/roguekey/butcher
	name = "butcher's key"
	icon_state = "rustkey"
	lockid = "butcher"

/obj/item/roguekey/elder
	name = "mayor's key"
	icon_state = "rustkey"
	lockid = "elder"

/obj/item/roguekey/veteran
	name = "veteran's key"
	icon_state = "rustkey"
	lockid = "veteran"

/obj/item/roguekey/apothecary
	name = "apothecary's key"
	icon_state = "rustkey"
	lockid = "apothecary"

/obj/item/roguekey/weaponsmith
	name = "weaponsmith's key"
	icon_state = "rustkey"
	lockid = "weaponsmith"

/obj/item/roguekey/armorsmith
	name = "armorsmith's key"
	icon_state = "rustkey"
	lockid = "armorsmith"

//custom key
/obj/item/roguekey/custom
	name = "custom key"
	desc = "A custom key designed by a blacksmith."
	icon_state = "brownkey"

/obj/item/roguekey/custom/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/rogueweapon/hammer))
		var/input = (input(user, "What would you name this key?", "", "") as text)
		if(input)
			name = name + " key"
			to_chat(user, "<span class='notice'>You rename the key to [name].</span>")

//custom key blank
/obj/item/customblank //i'd prefer not to make a seperate item for this honestly
	name = "blank custom key"
	desc = "A key without its teeth carved in. Endless possibilities..."
	icon = 'icons/roguetown/items/keys.dmi'
	icon_state = "brownkey"
	w_class = WEIGHT_CLASS_TINY
	dropshrink = 0.75
	var/lockhash = 0

/obj/item/customblank/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/rogueweapon/hammer))
		var/input = input(user, "What would you like to set the key ID to?", "", 0) as num
		input = max(0, input)
		to_chat(user, "<span class='notice'>You set the key ID to [input].</span>")
		lockhash = 10000 + input //having custom lock ids start at 10000 leaves it outside the range that opens normal doors, so you can't make a key that randomly unlocks existing key ids like the church

/obj/item/customblank/attack_right(mob/user)
	if(istype(user.get_active_held_item(), /obj/item/roguekey))
		var/obj/item/roguekey/held = user.get_active_held_item()
		src.lockhash = held.lockhash
		to_chat(user, "<span class='notice'>You trace the teeth from [held] to [src].</span>")
	else if(istype(user.get_active_held_item(), /obj/item/customlock))
		var/obj/item/customlock/held = user.get_active_held_item()
		src.lockhash = held.lockhash
		to_chat(user, "<span class='notice'>You fine-tune [src] to the lock's internals.</span>")
	else if(istype(user.get_active_held_item(), /obj/item/rogueweapon/hammer) && src.lockhash != 0)
		var/obj/item/roguekey/custom/F = new (get_turf(src))
		F.lockhash = src.lockhash
		to_chat(user, "<span class='notice'>You finish [F].</span>")
		qdel(src)


//custom lock unfinished
/obj/item/customlock
	name = "unfinished lock"
	desc = "A lock without its pins set. Endless possibilities..."
	icon = 'icons/roguetown/items/keys.dmi'
	icon_state = "lock"
	w_class = WEIGHT_CLASS_SMALL
	dropshrink = 0.75
	var/lockhash = 0

/obj/item/customlock/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/rogueweapon/hammer))
		var/input = input(user, "What would you like to set the lock ID to?", "", 0) as num
		input = max(0, input)
		to_chat(user, "<span class='notice'>You set the lock ID to [input].</span>")
		lockhash = 10000 + input //same deal as the customkey
	else if(istype(I, /obj/item/roguekey))
		var/obj/item/roguekey/ID = I
		if(ID.lockhash == src.lockhash)
			to_chat(user, "<span class='notice'>[I] twists cleanly in [src].</span>")
		else
			to_chat(user, "<span class='warning'>[I] jams in [src],</span>")
	else if(istype(I, /obj/item/customblank))
		var/obj/item/customblank/ID = I
		if(ID.lockhash == src.lockhash)
			to_chat(user, "<span class='notice'>[I] twists cleanly in [src].</span>") //this makes no sense since the teeth aren't formed yet but i want people to be able to check whether the locks theyre making actually fit
		else
			to_chat(user, "<span class='warning'>[I] jams in [src].</span>")

/obj/item/customlock/attack_right(mob/user)
	if(istype(user.get_active_held_item(), /obj/item/roguekey))//i need to figure out how to avoid these massive if/then trees, this sucks
		var/obj/item/roguekey/held = user.get_active_held_item()
		src.lockhash = held.lockhash
		to_chat(user, "<span class='notice'>You align the lock's internals to [held].</span>") //locks for non-custom keys
	else if(istype(user.get_active_held_item(), /obj/item/customblank))
		var/obj/item/customblank/held = user.get_active_held_item()
		src.lockhash = held.lockhash
		to_chat(user, "<span class='notice'>You align the lock's internals to [held].</span>")
	else if(istype(user.get_active_held_item(), /obj/item/rogueweapon/hammer) && src.lockhash != 0)
		var/obj/item/customlock/finished/F = new (get_turf(src))
		F.lockhash = src.lockhash
		to_chat(user, "<span class='notice'>You finish [F].</span>")
		qdel(src)

//finished lock
/obj/item/customlock/finished
	name = "lock"
	desc = "A customized iron lock that is used by keys."
	var/holdname = ""

/obj/item/customlock/finished/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/rogueweapon/hammer))
		src.holdname = input(user, "What would you like to name this?", "", "") as text
		if(holdname)
			to_chat(user, "<span class='notice'>You label the [name] with [holdname].</span>")
	else
		..()

/obj/item/customlock/finished/attack_right(mob/user)//does nothing. probably better ways to do this but whatever

/obj/item/customlock/finished/attack_obj(obj/structure/K, mob/living/user)
	if(istype(K, /obj/structure/closet))
		var/obj/structure/closet/KE = K
		if(KE.keylock == TRUE)
			to_chat(user, "<span class='warning'>[K] already has a lock.</span>")
		else
			KE.keylock = TRUE
			KE.lockhash = src.lockhash
			if(src.holdname)
				KE.name = (src.holdname + " " + KE.name)
			to_chat(user, "<span class='notice'>You add [src] to [K].</span>")
			qdel(src)
	if(istype(K, /obj/structure/mineral_door))
		var/obj/structure/mineral_door/KE = K
		if(KE.can_add_lock)
			if(KE.keylock == TRUE)
				to_chat(user, span_warning("[K] already has a lock."))
			else
				KE.keylock = TRUE
				KE.lockhash = src.lockhash
				if(src.holdname)
					KE.name = src.holdname
				to_chat(user, span_notice("You add [src] to [K]."))
				qdel(src)
		else
			to_chat(user, span_warning("A lock can't be added to [K]."))
