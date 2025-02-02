//////////////////////////////////////////
//			Leatherworking area			//
//////////////////////////////////////////


/datum/crafting_recipe/roguetown/leather/abyssalgloves
	name = "abyssal leather gloves (x2){fl}"
	result = list(/obj/item/clothing/gloves/roguetown/leather/abyssal,
	/obj/item/clothing/gloves/roguetown/leather/abyssal)
	req_islander = TRUE

/datum/crafting_recipe/roguetown/leather/khudagach
	name = "archery bracers (x2){fl}"
	result = list(/obj/item/clothing/wrists/roguetown/bracers/leather/khudagach,
			/obj/item/clothing/wrists/roguetown/bracers/leather/khudagach)
	req_islander = TRUE

/datum/crafting_recipe/roguetown/leather/furtobi
	name = "leather pants {fl}"
	result = list(/obj/item/clothing/under/roguetown/trou/leather/fur)
	req_islander = TRUE

/datum/crafting_recipe/roguetown/leather/jikatabi
	name = "jikatabi (x2){fl}"
	result = list(/obj/item/clothing/shoes/roguetown/boots/jikatabi,
				/obj/item/clothing/shoes/roguetown/boots/jikatabi)
	req_islander = TRUE

/datum/crafting_recipe/roguetown/leather/cloudhead
	name = "cloudhead shoes {fl}"
	result = /obj/item/clothing/shoes/roguetown/shortboots/cloudhead
	req_islander = TRUE

/datum/crafting_recipe/roguetown/leather/geta
	name = "geta sandals {fl}"
	result = /obj/item/clothing/shoes/roguetown/sandals/geta
	req_islander = TRUE

/datum/crafting_recipe/roguetown/leather/haori
	name = "haori jacket {fl}"
	result = list(/obj/item/clothing/suit/roguetown/armor/leather/jacket/haori)
	reqs = list(/obj/item/natural/hide = 2)
	req_islander = TRUE

/*.............. recipes requiring skill 1 ..............*/

/datum/crafting_recipe/roguetown/leather/falcon
	name = "falconry heavy gloves {fl}"
	result = /obj/item/clothing/gloves/roguetown/angle/falcon
	reqs = list(/obj/item/natural/hide = 1,
				/obj/item/natural/fur = 1)
	craftdiff = 1
	req_islander = TRUE

/datum/crafting_recipe/roguetown/leather/malgai
	name = "malgai helmet {fl}"
	result = /obj/item/clothing/head/roguetown/helmet/leather/malgai
	reqs = list(/obj/item/natural/hide = 2)
	craftdiff = 1
	req_islander = TRUE

/datum/crafting_recipe/roguetown/leather/kaizokuhat
	name = "heartfeltean hat {fl}"
	result = /obj/item/clothing/head/roguetown/helmet/leather/malgai/kaizoku
	reqs = list(/obj/item/natural/hide = 2)
	craftdiff = 1
	req_islander = TRUE

/datum/crafting_recipe/roguetown/leather/kaizokuhat/female
	name = "female heartfeltean hat {fl}"
	result = /obj/item/clothing/head/roguetown/helmet/leather/malgai/kaizoku/female
	reqs = list(/obj/item/natural/hide = 2)
	craftdiff = 1
	req_islander = TRUE

/datum/crafting_recipe/roguetown/leather/abyssalarmor
	name = "leather lamellar armor {fl}"
	result = /obj/item/clothing/suit/roguetown/armor/leather/abyssal
	reqs = list(/obj/item/natural/hide = 2)
	craftdiff = 1
	req_islander = TRUE

/*.............. recipes requiring skill 2 ..............*/

/datum/crafting_recipe/roguetown/leather/dustwalker
	name = "light cavalry armor {fl}"
	result = /obj/item/clothing/suit/roguetown/armor/leather/hide/dustwalker
	reqs = list(/obj/item/natural/hide = 2,
				/obj/item/natural/fur = 1)
	craftdiff = 2
	req_islander = TRUE

/datum/crafting_recipe/roguetown/leather/shozoku
	name = "stealthy body armor {fl}"
	result = /obj/item/clothing/suit/roguetown/armor/leather/hide/shozoku
	reqs = list(/obj/item/natural/hide = 2,
				/obj/item/natural/fur = 1)
	craftdiff = 2
	req_islander = TRUE

/datum/crafting_recipe/roguetown/leather/kaizoku
	name = "heartfeltean vest {fl}"
	result = /obj/item/clothing/suit/roguetown/armor/leather/vest/kaizoku
	reqs = list(/obj/item/natural/hide = 2)
	craftdiff = 2
	req_islander = TRUE

/datum/crafting_recipe/roguetown/leather/arisan
	name = "cavalry light headgear {fl}"
	reqs = list(/obj/item/natural/hide = 2,
				/obj/item/natural/fur = 1)
	craftdiff = 2
	req_islander = TRUE
//////////////////////////////////////////
// Sewing Crafting Area,				//
//////////////////////////////////////////


/datum/crafting_recipe/roguetown/sewing/yugake
	name = "yugake gloves {fl}"
	result = list(/obj/item/clothing/gloves/roguetown/fingerless/yugake)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	req_islander = TRUE

/datum/crafting_recipe/roguetown/sewing/monkgarb
	name = "monk garbs {fl}"
	result = list(/obj/item/clothing/suit/roguetown/shirt/rags/monkgarb)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	req_islander = TRUE

/datum/crafting_recipe/roguetown/sewing/kimono
	name = "kimono {fl}"
	result = list(/obj/item/clothing/suit/roguetown/shirt/tunic/kimono)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	req_islander = TRUE

/datum/crafting_recipe/roguetown/sewing/kamishimo
	name = "kamishimo upperside {fl}"
	result = list(/obj/item/clothing/suit/roguetown/shirt/tunic/kamishimo)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	req_islander = TRUE

/datum/crafting_recipe/roguetown/sewing/hakama
	name = "hakama {fl}"
	result = list(/obj/item/clothing/under/roguetown/tights/hakama)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	req_islander = TRUE

/datum/crafting_recipe/roguetown/sewing/takuhatsugasa
	name = "takuhatsugasa hat {fl}"
	result = list(/obj/item/clothing/head/roguetown/takuhatsugasa)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	req_islander = TRUE

/datum/crafting_recipe/roguetown/sewing/torioigasa
	name = "torioigasa hat {fl}"
	result = list(/obj/item/clothing/head/roguetown/tengai/torioigasa)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 2)
	req_islander = TRUE

/datum/crafting_recipe/roguetown/sewing/gasa
	name = "gasa hat {fl}"
	result = list(/obj/item/clothing/head/roguetown/tengai/gasa)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	req_islander = TRUE

/datum/crafting_recipe/roguetown/sewing/lillys
	name = "small lilly {fl}"
	result = list(/obj/item/clothing/head/roguetown/lilly)
	reqs = list(/obj/item/natural/fibers = 3)
	req_islander = TRUE

/datum/crafting_recipe/roguetown/sewing/lillym
	name = "medium lilly {fl}"
	result = list(/obj/item/clothing/head/roguetown/lilly/medium)
	reqs = list(/obj/item/natural/fibers = 4)
	req_islander = TRUE

/datum/crafting_recipe/roguetown/sewing/lillyb
	name = "big lilly {fl}"
	result = list(/obj/item/clothing/head/roguetown/lilly/big)
	reqs = list(/obj/item/natural/fibers = 5)
	req_islander = TRUE

/datum/crafting_recipe/roguetown/sewing/eyeband
	name = "eyeband"
	result = list(/obj/item/clothing/mask/rogue/kaizoku/eyeband)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)

/datum/crafting_recipe/roguetown/sewing/tribal
	name = "tribal garb {fl}"
	result = list(/obj/item/clothing/under/roguetown/kaizoku/tribal)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	req_islander = TRUE

/*.............. recipes requiring skill 1 ..............*/

/datum/crafting_recipe/roguetown/sewing/tengai
	name = "tengai hat {fl}"
	result = list(/obj/item/clothing/head/roguetown/tengai)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 3)
	craftdiff = 1
	req_islander = TRUE

/datum/crafting_recipe/roguetown/sewing/roningasa
	name = "roningasa hat {fl}"
	result = list(/obj/item/clothing/head/roguetown/tengai/roningasa)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 2)
	craftdiff = 1
	req_islander = TRUE

/datum/crafting_recipe/roguetown/sewing/soheicloth
	name = "sohei headcovering {fl}"
	result = list(/obj/item/clothing/head/roguetown/soheicloth)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 2)
	craftdiff = 1
	req_islander = TRUE

/datum/crafting_recipe/roguetown/sewing/sandogasa
	name = "sandogasa hat {fl}"
	result = list(/obj/item/clothing/head/roguetown/tengai/sandogasa)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 3)
	craftdiff = 1
	req_islander = TRUE

/datum/crafting_recipe/roguetown/sewing/mino
	name = "mino cloak {fl}"
	result = list(/obj/item/clothing/cloak/raincloak/mino)
	reqs = list(/obj/item/natural/fibers = 8,
				/obj/item/natural/fibers = 2)
	craftdiff = 1
	req_islander = TRUE

/datum/crafting_recipe/roguetown/sewing/tobi
	name = "tobi trousers {fl}"
	result = list(/obj/item/clothing/under/roguetown/trou/tobi)
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 1)
	craftdiff = 1
	req_islander = TRUE

/datum/crafting_recipe/roguetown/sewing/hitatare
	name = "light hitatare {fl}"
	result = list(/obj/item/clothing/suit/roguetown/armor/gambeson/light/hitatare)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 1
	req_islander = TRUE

/*.............. recipes requiring skill 2 ..............*/

/datum/crafting_recipe/roguetown/sewing/ruankai
	name = "ruankai jacque {fl}"
	result = /obj/item/clothing/suit/roguetown/armor/gambeson/ruankai
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 1)
	tools = list(/obj/item/needle)
	craftdiff = 2
	req_islander = TRUE

/datum/crafting_recipe/roguetown/sewing/jinbaori
	name = "jinbaori {fl}"
	result = list(/obj/item/clothing/cloak/stabard/haramaki/jinbaori)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 2
	req_islander = TRUE

/datum/crafting_recipe/roguetown/sewing/zukin
	name = "stealthy hood {fl}"
	result = list(/obj/item/clothing/head/roguetown/shinobi_zukin)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 2
	req_islander = TRUE

/datum/crafting_recipe/roguetown/sewing/zubon
	name = "stealthy trousers {fl}"
	result = list(/obj/item/clothing/under/roguetown/trou/leather/shinobizubon)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 2)
	craftdiff = 2
	req_islander = TRUE

/*.............. recipes requiring skill 3 ..............*/

/datum/crafting_recipe/roguetown/sewing/onmyojigood
	name = "war onmyoji hat {fl}"
	result = list(/obj/item/clothing/head/roguetown/wizhat/onmyoji)
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 3)
	craftdiff = 3
	req_islander = TRUE

/datum/crafting_recipe/roguetown/sewing/onmyojigoofy
	name = "onmyoji hat {fl}"
	result = list(/obj/item/clothing/head/roguetown/wizhat/onmyoji/eboshi)
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 3)
	craftdiff = 3
	req_islander = TRUE

/datum/crafting_recipe/roguetown/sewing/guardiancape
	name = "guardianship cape {fl}"
	result = list(/obj/item/clothing/cloak/raincloak/guardiancloak)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3
	req_islander = TRUE

/datum/crafting_recipe/roguetown/sewing/onmyojigoofy
	name = "haramaki bellyband {fl}"
	result = list(/obj/item/clothing/cloak/stabard/haramaki)
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 3)
	craftdiff = 3
	req_islander = TRUE

/* .............. recipes requiring skill 4 ..............*/

/datum/crafting_recipe/roguetown/sewing/heartfelthat
	name = "heartfelt hat {fl}"
	result = list(/obj/item/clothing/head/roguetown/bardhat/bloodhunter)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 4
	req_islander = TRUE

/datum/crafting_recipe/roguetown/sewing/odoshi
	name = "odoshi bodylacing {fl}"
	result = list(/obj/item/clothing/cloak/stabard/haramaki/odoshi)
	reqs = list(/obj/item/natural/cloth = 5,
				/obj/item/natural/fibers = 3)
	craftdiff = 4
	req_islander = TRUE

//Weaving area

/datum/crafting_recipe/roguetown/weaving/shrinekeeper
	name = "shrinekeeper robes"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/shrinekeeper)
	reqs = list(/obj/item/natural/cloth = 4)
	craftdiff = 4
	sellprice = 25

/datum/crafting_recipe/roguetown/weaving/shrinekabuto
	name = "shrinekeeper kabuto"
	result = list(/obj/item/clothing/head/roguetown/padded/shrinekeeper)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/reagent_containers/food/snacks/fish = 1)
	craftdiff = 4
	sellprice = 35

/datum/crafting_recipe/roguetown/weaving/purificator
	name = "purificators fistguard"
	result = list(/obj/item/clothing/wrists/roguetown/shrinekeeper)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/reagent_containers/food/snacks/fish = 1)
	craftdiff = 4
	sellprice = 35
