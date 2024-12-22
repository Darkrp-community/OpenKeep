/* SKINCRAFT	-	skincraft skill
==========================================================*/
// The only ingridients these recipes can require is HIDE and FUR
// They all require a needle and a drying rack

/datum/crafting_recipe/roguetown/leather
	tools = list(/obj/item/needle)
	structurecraft = /obj/structure/fluff/dryingrack
	skillcraft = /datum/skill/craft/tanning
	craftdiff = 0
	subtype_reqs = TRUE // so you can use any subtype of fur
	reqs = list(/obj/item/natural/hide = 1)



/*========= NO SKILL LEVEL REQUIRED ==========*/
/datum/crafting_recipe/roguetown/leather/belt
	name = "leather belt"
	result = list(/obj/item/storage/belt/rogue/leather)

/datum/crafting_recipe/roguetown/leather/pouch
	name = "leather pouch"
	result = list(/obj/item/storage/belt/rogue/pouch)

/datum/crafting_recipe/roguetown/leather/gloves
	name = "leather gloves {ip}"
	result = /obj/item/clothing/gloves/roguetown/leather


/datum/crafting_recipe/roguetown/leather/bracers
	name = "leather bracers {ip}"
	result = /obj/item/clothing/wrists/roguetown/bracers/leather
	req_antikaizoku = TRUE


/datum/crafting_recipe/roguetown/leather/pants
	name = "leather pants {ip}"
	result = list(/obj/item/clothing/under/roguetown/trou/leather)
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/leather/shoes
	name = "leather shoes {ip}"
	result = /obj/item/clothing/shoes/roguetown/simpleshoes
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/leather/boots
	name = "leather boots {ip}"
	result = /obj/item/clothing/shoes/roguetown/boots/leather
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/leather/sandals
	name = "sandals {ip}"
	result = /obj/item/clothing/shoes/roguetown/sandals
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/leather/gladiator
	name = "gladiator sandals {ip}"
	result = /obj/item/clothing/shoes/roguetown/gladiator
	reqs = list(/obj/item/natural/hide = 2)
	sellprice = 17
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/leather/hood
	name = "leather hood {ip}"
	result = /obj/item/clothing/head/roguetown/roguehood/brown
	reqs = list(/obj/item/natural/fur = 1)

/datum/crafting_recipe/roguetown/leather/papakha
	name = "papakha hat"
	result = /obj/item/clothing/head/roguetown/papakha
	reqs = list(/obj/item/natural/fur = 1)

/datum/crafting_recipe/roguetown/leather/cloak
	name = "leather cloak"
	result = /obj/item/clothing/cloak/raincloak/brown

/datum/crafting_recipe/roguetown/leather/cloakfur
	name = "fur cloak"
	result = /obj/item/clothing/cloak/raincloak/furcloak
	reqs = list(/obj/item/natural/fur = 1)

/datum/crafting_recipe/roguetown/leather/quiver
	name = "quiver"
	result = /obj/item/quiver
	reqs = list(/obj/item/natural/hide = 2)

/datum/crafting_recipe/roguetown/leather/tribal_cloak
	name = "tribal pelt"
	result = /obj/item/clothing/cloak/tribal

/datum/crafting_recipe/roguetown/leather/tribal_shoes
	name = "tribal shoes"
	result = list(/obj/item/clothing/shoes/roguetown/tribal)

/datum/crafting_recipe/roguetown/leather/furlinedanklets
	name = "fur lined anklets"
	reqs = list(/obj/item/natural/fur = 1)
	result = /obj/item/clothing/shoes/roguetown/boots/furlinedanklets

/datum/crafting_recipe/roguetown/leather/brimmedhat
	name = "brimmed hat"
	result = /obj/item/clothing/head/roguetown/brimmed

/datum/crafting_recipe/roguetown/leather/waterskin
	name = "waterskin"
	result = /obj/item/reagent_containers/glass/bottle/waterskin

/datum/crafting_recipe/roguetown/leather/leatherjacket
	name = "leather jacket"
	result = list(/obj/item/clothing/suit/roguetown/armor/leather/jacket/toggle)
	reqs = list(/obj/item/natural/hide = 2)

/datum/crafting_recipe/roguetown/leather/pants
	name = "leather pants"
	result = /obj/item/clothing/under/roguetown/trou/leather
	reqs = list(/obj/item/natural/hide = 2)

/*========= SKILL LEVEL: 1 REQUIRED ==========*/
/datum/crafting_recipe/roguetown/leather/saddle
	name = "leather saddle"
	result = /obj/item/natural/saddle
	reqs = list(/obj/item/natural/hide = 2)
	craftdiff = 1

/datum/crafting_recipe/roguetown/leather/satchel
	name = "leather satchel"
	result = /obj/item/storage/backpack/rogue/satchel
	reqs = list(/obj/item/natural/hide = 3)
	craftdiff = 1

/datum/crafting_recipe/roguetown/leather/meatbag
	name = "game satchel"
	result = /obj/item/storage/meatbag
	reqs = list(/obj/item/natural/hide = 3)
	craftdiff = 1

/datum/crafting_recipe/roguetown/leather/heavygloves
	name = "fur-lined gloves {ip}"
	result = /obj/item/clothing/gloves/roguetown/angle
	reqs = list(/obj/item/natural/hide = 1,
				/obj/item/natural/fur = 1)
	craftdiff = 1
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/leather/helmet
	name = "leather helmet {ip}"
	result = /obj/item/clothing/head/roguetown/helmet/leather
	reqs = list(/obj/item/natural/hide = 2)
	craftdiff = 1
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/leather/antlerhood
	name = "antler hood"
	result = /obj/item/clothing/head/roguetown/antlerhood
	reqs = list(/obj/item/natural/hide = 1,
	/obj/item/natural/head/saiga = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/leather/armor
	name = "leather armor {ip}"
	result = /obj/item/clothing/suit/roguetown/armor/leather
	reqs = list(/obj/item/natural/hide = 2)
	craftdiff = 1
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/leather/whip
	name = "leather whip"
	result = /obj/item/rogueweapon/whip
	reqs = list(/obj/item/natural/hide = 2)
	craftdiff = 1

/datum/crafting_recipe/roguetown/leather/furlinedboots
	name = "fur lined boots"
	result = /obj/item/clothing/shoes/roguetown/boots/furlinedboots
	reqs = 	list(/obj/item/natural/hide = 2,
				/obj/item/natural/fur = 2)
	craftdiff = 1


/*========= SKILL LEVEL: 2 REQUIRED ==========*/

/datum/crafting_recipe/roguetown/leather/backpack
	name = "leather backpack"
	result = /obj/item/storage/backpack/rogue/backpack
	reqs = list(/obj/item/natural/hide = 4)
	craftdiff = 2

/datum/crafting_recipe/roguetown/leather/hidearmor
	name = "fur-lined armor {ip}"
	result = /obj/item/clothing/suit/roguetown/armor/leather/hide
	reqs = list(/obj/item/natural/hide = 2,
				/obj/item/natural/fur = 1)
	craftdiff = 2
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/leather/coif
	name = "leather coif"
	result = /obj/item/clothing/neck/roguetown/coif
	reqs = list(/obj/item/natural/hide = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/leather/leatherjacket
	name = "leather jacket {ip}"
	result = list(/obj/item/clothing/suit/roguetown/armor/leather/jacket)
	reqs = list(/obj/item/natural/hide = 1)
	craftdiff = 1
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/leather/brimmedhat
	name = "brimmed hat x2 {ip}"
	result = list(/obj/item/clothing/head/roguetown/brimmed)
	reqs = list(/obj/item/natural/hide = 1)
	craftdiff = 1
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/leather/volfmantle
	name = "volf mantle"
	result = /obj/item/clothing/cloak/volfmantle
	reqs = list(/obj/item/natural/fur/volf = 1,
	/obj/item/natural/head/volf = 1)
	craftdiff = 2



//////////////////////////////////////////
// Fogislander Cultured Crafting Area,  //
//////////////////////////////////////////


/datum/crafting_recipe/roguetown/leather/abyssalgloves
	name = "abyssal leather gloves (x2){fl}"
	result = list(/obj/item/clothing/gloves/roguetown/leather/abyssal,
	/obj/item/clothing/gloves/roguetown/leather/abyssal)
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/leather/khudagach
	name = "archery bracers (x2){fl}"
	result = list(/obj/item/clothing/wrists/roguetown/bracers/leather/khudagach,
			/obj/item/clothing/wrists/roguetown/bracers/leather/khudagach)
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/leather/furtobi
	name = "leather pants {fl}"
	result = list(/obj/item/clothing/under/roguetown/tobi/fur)
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/leather/jikatabi
	name = "jikatabi (x2){fl}"
	result = list(/obj/item/clothing/shoes/roguetown/kaizoku/jikatabi,
				/obj/item/clothing/shoes/roguetown/kaizoku/jikatabi)
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/leather/cloudhead
	name = "cloudhead shoes {fl}"
	result = /obj/item/clothing/shoes/roguetown/shortboots/cloudhead
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/leather/geta
	name = "geta sandals {fl}"
	result = /obj/item/clothing/shoes/roguetown/sandals/geta
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/leather/haori
	name = "haori jacket {fl}"
	result = list(/obj/item/clothing/suit/roguetown/armor/leather/jacket/haori)
	reqs = list(/obj/item/natural/hide = 2)
	req_kaizoku = TRUE

/*.............. recipes requiring skill 1 ..............*/

/datum/crafting_recipe/roguetown/leather/falcon
	name = "falconry heavy gloves {fl}"
	result = /obj/item/clothing/gloves/roguetown/angle/falcon
	reqs = list(/obj/item/natural/hide = 1,
				/obj/item/natural/fur = 1)
	craftdiff = 1
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/leather/malgai
	name = "malgai helmet {fl}"
	result = /obj/item/clothing/head/roguetown/helmet/leather/malgai
	reqs = list(/obj/item/natural/hide = 2)
	craftdiff = 1
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/leather/kaizokuhat
	name = "heartfeltean hat {fl}"
	result = /obj/item/clothing/head/roguetown/helmet/leather/malgai/kaizoku
	reqs = list(/obj/item/natural/hide = 2)
	craftdiff = 1
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/leather/kaizokuhat/female
	name = "female heartfeltean hat {fl}"
	result = /obj/item/clothing/head/roguetown/helmet/leather/malgai/kaizoku/female
	reqs = list(/obj/item/natural/hide = 2)
	craftdiff = 1
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/leather/abyssalarmor
	name = "leather lamellar armor {fl}"
	result = /obj/item/clothing/suit/roguetown/armor/leather/abyssal
	reqs = list(/obj/item/natural/hide = 2)
	craftdiff = 1
	req_kaizoku = TRUE

/*.............. recipes requiring skill 2 ..............*/

/datum/crafting_recipe/roguetown/leather/dustwalker
	name = "light cavalry armor {fl}"
	result = /obj/item/clothing/suit/roguetown/armor/leather/hide/dustwalker
	reqs = list(/obj/item/natural/hide = 2,
				/obj/item/natural/fur = 1)
	craftdiff = 2
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/leather/shozoku
	name = "stealthy body armor {fl}"
	result = /obj/item/clothing/suit/roguetown/armor/leather/hide/shozoku
	reqs = list(/obj/item/natural/hide = 2,
				/obj/item/natural/fur = 1)
	craftdiff = 2
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/leather/kaizoku
	name = "heartfeltean vest {fl}"
	result = /obj/item/clothing/suit/roguetown/armor/leather/vest/kaizoku
	reqs = list(/obj/item/natural/hide = 2)
	craftdiff = 2
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/leather/arisan
	name = "cavalry light headgear {fl}"
	reqs = list(/obj/item/natural/hide = 2,
				/obj/item/natural/fur = 1)
	craftdiff = 2
	req_kaizoku = TRUE
