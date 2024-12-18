/datum/crafting_recipe/roguetown/sewing
	tools = list(/obj/item/needle)
	skillcraft = /datum/skill/misc/sewing
	subtype_reqs = TRUE // so you can use any subtype of fur
	craftdiff = 0

/*.............. recipes requiring no skill..............*/

/datum/crafting_recipe/roguetown/sewing/rags
	name = "rags {ip}"
	result = list(/obj/item/clothing/suit/roguetown/shirt/rags)
	reqs = list(/obj/item/natural/cloth = 2)
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/burial_shroud
	name = "winding sheet"
	result = list(/obj/item/burial_shroud)
	reqs = list(/obj/item/natural/cloth = 2)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/loincloth
	name = "loincloth"
	result = list(/obj/item/clothing/under/roguetown/loincloth)
	reqs = list(/obj/item/natural/cloth = 1)

/datum/crafting_recipe/roguetown/sewing/halfcloak
	name = "cloth half cloak {ip}"
	result = list(/obj/item/clothing/cloak/half)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/apron
	name = "cloth apron {ip}"
	result = list(/obj/item/clothing/cloak/apron)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/clothgloves
	name = "cloth gloves {ip}"
	result = list(/obj/item/clothing/gloves/roguetown/fingerless)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/shortshirt
	name = "cloth short shirt {ip}"
	result = list(/obj/item/clothing/suit/roguetown/shirt/shortshirt)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/clothshirt
	name = "cloth shirt {ip}"
	result = list(/obj/item/clothing/suit/roguetown/shirt/undershirt)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/stripedtunic
	name = "striped tunic {ip}"
	result = list(/obj/item/clothing/suit/roguetown/armor/gambeson/light/striped)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/clothtights
	name = "cloth tights {ip}"
	result = list(/obj/item/clothing/under/roguetown/tights)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/headband
	name = "headband"
	result = list(/obj/item/clothing/head/roguetown/headband)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)

/datum/crafting_recipe/roguetown/sewing/strawhat
	name = "crude straw hat {ip}"
	result = list(/obj/item/clothing/head/roguetown/strawhat)
	reqs = list(/obj/item/natural/fibers = 3)
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/knitcap
	name = "knit cap {ip}"
	result = list(/obj/item/clothing/head/roguetown/knitcap)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/cmask
	name = "cloth mask {ip}"
	result = list(/obj/item/clothing/mask/rogue/shepherd/clothmask)
	reqs = list(/obj/item/natural/fibers = 1, /obj/item/natural/cloth = 1)
	tools = list(/obj/item/needle)
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/zigbox
	name = "zigbox"
	result = list(/obj/item/storage/fancy/cigarettes/zig/empty)
	reqs = list(/obj/item/paper = 1,
				/obj/item/natural/fibers = 1)


/*.............. recipes requiring skill 1 ..............*/

/datum/crafting_recipe/roguetown/sewing/Reyepatch
	name = "right eye patch"
	result = list(/obj/item/clothing/mask/rogue/eyepatch)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/Leyepatch
	name = "left eye patch"
	result = list(/obj/item/clothing/mask/rogue/eyepatch/left)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/fisherhat
	name = "straw fisher hat {ip}"
	result = list(/obj/item/clothing/head/roguetown/fisherhat)
	reqs = list(/obj/item/natural/fibers = 3)
	craftdiff = 1
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/sack
	name = "sack hood"
	result = list(/obj/item/clothing/head/roguetown/menacing)
	reqs = list(/obj/item/natural/cloth = 3,)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/pcoif
	name = "cloth coif"
	result = list(/obj/item/clothing/neck/roguetown/coif/cloth)
	reqs = list(/obj/item/natural/fibers = 1, /obj/item/natural/cloth = 2)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/jupon
	name = "jupon {ip}"
	result = list(/obj/item/clothing/cloak/stabard/surcoat)
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 1)
	craftdiff = 1
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/clothtrou
	name = "cloth trousers {ip}"
	result = list(/obj/item/clothing/under/roguetown/trou)
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 1)
	craftdiff = 1
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/lgambeson
	name = "light gambeson {ip}"
	result = list(/obj/item/clothing/suit/roguetown/armor/gambeson/light)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 1
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/sleepingbag
	name = "sleepcloth"
	result = list(/obj/item/sleepingbag)
	reqs =  list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/armingcap
	name = "arming cap"
	result = list(/obj/item/clothing/head/roguetown/armingcap)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 1


/*.............. recipes requiring skill 2 ..............*/

/datum/crafting_recipe/roguetown/sewing/gambeson
	name = "gambeson {ip}"
	result = /obj/item/clothing/suit/roguetown/armor/gambeson
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 1)
	tools = list(/obj/item/needle)
	craftdiff = 2
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/tabard
	name = "tabard {ip}"
	result = list(/obj/item/clothing/cloak/tabard)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 2
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/stabard
	name = "surcoat {ip}"
	result = list(/obj/item/clothing/cloak/stabard)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 2
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/bedsheet
	name = "bedsheet"
	result = list(/obj/item/bedsheet/rogue/cloth)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/sewing/bedsheetpelt
	name = "leather bedsheet"
	result = list(/obj/item/bedsheet/rogue/pelt)
	reqs = list(/obj/item/natural/hide = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/sewing/Bladress
	name = "black dress"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress/gen/black)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/sewing/Bludress
	name = "blue dress"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress/gen/blue)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/sewing/Purdress
	name = "purple dress"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress/gen/purple)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 2


/*.............. recipes requiring skill 3 ..............*/

/datum/crafting_recipe/roguetown/sewing/robe
	name = "robes {ip}"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/plain)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/cape
	name = "cape {ip}"
	result = list(/obj/item/clothing/cloak/cape)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3
	req_antikaizoku = TRUE


/* .............. recipes requiring skill 4 ..............*/

/datum/crafting_recipe/roguetown/sewing/fancyhat
	name = "fancy hat {ip}"
	result = list(/obj/item/clothing/head/roguetown/fancyhat)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 4
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/fancyhat
	name = "fancy hat {ip}"
	result = list(/obj/item/clothing/head/roguetown/fancyhat)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 4
	req_antikaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/bardhat
	name = "bard hat {ip}"
	result = list(/obj/item/clothing/head/roguetown/bardhat)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 4
	req_antikaizoku = TRUE


/*.............. recipes requiring skill 5 ..............*/

/datum/crafting_recipe/roguetown/sewing/lordcloak
	name = "lordly cloak {ip}"
	result = list(/obj/item/clothing/cloak/lordcloak)
	reqs = list(/obj/item/natural/fur = 2,
				/obj/item/natural/hide = 4)
	craftdiff = 4
	req_antikaizoku = TRUE

//////////////////////////////////////////
// Fogislander Cultured Crafting Area,  //
//////////////////////////////////////////


/datum/crafting_recipe/roguetown/sewing/yugake
	name = "yugake gloves {fl}"
	result = list(/obj/item/clothing/gloves/roguetown/fingerless/yugake)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/monkgarb
	name = "monk garbs {fl}"
	result = list(/obj/item/clothing/suit/roguetown/shirt/kaizoku/monkgarb)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/kimono
	name = "kimono {fl}"
	result = list(/obj/item/clothing/suit/roguetown/shirt/kaizoku/kimono)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/kamishimo
	name = "kamishimo upperside {fl}"
	result = list(/obj/item/clothing/suit/roguetown/shirt/kaizoku/kamishimo)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/hakama
	name = "hakama {fl}"
	result = list(/obj/item/clothing/under/roguetown/tobi/hakama)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/takuhatsugasa
	name = "takuhatsugasa hat {fl}"
	result = list(/obj/item/clothing/head/roguetown/takuhatsugasa)
	reqs = list(/obj/item/natural/fibers = 3)
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/torioigasa
	name = "torioigasa hat {fl}"
	result = list(/obj/item/clothing/head/roguetown/tengai/torioigasa)
	reqs = list(/obj/item/natural/fibers = 4)
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/gasa
	name = "gasa hat {fl}"
	result = list(/obj/item/clothing/head/roguetown/tengai/gasa)
	reqs = list(/obj/item/natural/fibers = 3)
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/lillys
	name = "small lilly {fl}"
	result = list(/obj/item/clothing/head/roguetown/lilly/small)
	reqs = list(/obj/item/natural/fibers = 3)
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/lillym
	name = "medium lilly {fl}"
	result = list(/obj/item/clothing/head/roguetown/lilly/medium)
	reqs = list(/obj/item/natural/fibers = 4)
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/lillyb
	name = "big lilly {fl}"
	result = list(/obj/item/clothing/head/roguetown/lilly/big)
	reqs = list(/obj/item/natural/fibers = 5)
	req_kaizoku = TRUE

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
	req_kaizoku = TRUE

/*.............. recipes requiring skill 1 ..............*/

/datum/crafting_recipe/roguetown/sewing/tengai
	name = "tengai hat {fl}"
	result = list(/obj/item/clothing/head/roguetown/tengai)
	reqs = list(/obj/item/natural/fibers = 5)
	craftdiff = 1
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/roningasa
	name = "roningasa hat {fl}"
	result = list(/obj/item/clothing/head/roguetown/tengai/roningasa)
	reqs = list(/obj/item/natural/fibers = 5)
	craftdiff = 1
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/soheicloth
	name = "sohei headcovering {fl}"
	result = list(/obj/item/clothing/head/roguetown/soheicloth)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 2)
	craftdiff = 1
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/sandogasa
	name = "sandogasa hat {fl}"
	result = list(/obj/item/clothing/head/roguetown/tengai/sandogasa)
	reqs = list(/obj/item/natural/fibers = 5)
	craftdiff = 1
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/mino
	name = "mino cloak {fl}"
	result = list(/obj/item/clothing/cloak/raincloak/mino)
	reqs = list(/obj/item/natural/fibers = 8,
				/obj/item/natural/fibers = 2)
	craftdiff = 1
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/tobi
	name = "tobi trousers {fl}"
	result = list(/obj/item/clothing/under/roguetown/tobi)
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 1)
	craftdiff = 1
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/hitatare
	name = "light hitatare {fl}"
	result = list(/obj/item/clothing/suit/roguetown/armor/gambeson/light/hitatare)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 1
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/haori
	name = "haori jacket {fl}"
	result = list(/obj/item/clothing/suit/roguetown/armor/kaizoku/haori)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 1
	req_kaizoku = TRUE

/*.............. recipes requiring skill 2 ..............*/

/datum/crafting_recipe/roguetown/sewing/ruankai
	name = "ruankai jacque {fl}"
	result = /obj/item/clothing/suit/roguetown/armor/gambeson/ruankai
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 1)
	tools = list(/obj/item/needle)
	craftdiff = 2
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/jinbaori
	name = "jinbaori {fl}"
	result = list(/obj/item/clothing/cloak/jinbaori)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 2
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/zukin
	name = "stealthy hood {fl}"
	result = list(/obj/item/clothing/head/roguetown/shinobi_zukin)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 2
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/zubon
	name = "stealthy trousers {fl}"
	result = list(/obj/item/clothing/under/roguetown/kaizoku/shinobizubon)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 2)
	craftdiff = 2
	req_kaizoku = TRUE

/*.............. recipes requiring skill 3 ..............*/

/datum/crafting_recipe/roguetown/sewing/onmyojigood
	name = "war onmyoji hat {fl}"
	result = list(/obj/item/clothing/head/roguetown/wizhat/onmyoji)
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 3)
	craftdiff = 3
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/onmyojigoofy
	name = "onmyoji hat {fl}"
	result = list(/obj/item/clothing/head/roguetown/wizhat/onmyoji/eboshi)
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 3)
	craftdiff = 3
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/guardiancape
	name = "guardianship cape {fl}"
	result = list(/obj/item/clothing/cloak/raincloak/guardiancloak)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/onmyojigoofy
	name = "haramaki bellyband {fl}"
	result = list(/obj/item/clothing/cloak/haramaki)
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 3)
	craftdiff = 3
	req_kaizoku = TRUE

/* .............. recipes requiring skill 4 ..............*/

/datum/crafting_recipe/roguetown/sewing/heartfelthat
	name = "heartfelt hat {fl}"
	result = list(/obj/item/clothing/head/roguetown/bardhat/bloodhunter)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 4
	req_kaizoku = TRUE

/datum/crafting_recipe/roguetown/sewing/odoshi
	name = "odoshi bodylacing {fl}"
	result = list(/obj/item/clothing/cloak/haramaki/odoshi)
	reqs = list(/obj/item/natural/cloth = 5,
				/obj/item/natural/fibers = 3)
	craftdiff = 4
	req_kaizoku = TRUE

/*.............. recipes requiring skill 5 ..............*/

/datum/crafting_recipe/roguetown/sewing/heartfeltcloak
	name = "heartfelt lord cloak {fl}"
	result = list(/obj/item/clothing/cloak/newheartfelt)
	reqs = list(/obj/item/natural/fur = 2,
				/obj/item/natural/hide = 4)
	craftdiff = 4
	req_kaizoku = TRUE
