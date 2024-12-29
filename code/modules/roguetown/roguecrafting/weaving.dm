/* WEAVING	-	sewing skill
==========================================================*/
// The only ingridients these recipes can require is SILK and CLOTH
// They all require a loom

/datum/crafting_recipe/roguetown/weaving
	structurecraft = /obj/machinery/loom
	skillcraft = /datum/skill/misc/sewing
	subtype_reqs = TRUE // so you can use any subtype of fur
	reqs = list(/obj/item/natural/silk = 2)
	craftdiff = 1

/*========= SKILL LEVEL: 1 REQUIRED ==========*/

/datum/crafting_recipe/roguetown/weaving/rags
	name = "webbed shirt"
	result = list(/obj/item/clothing/suit/roguetown/shirt/undershirt/webs)

/datum/crafting_recipe/roguetown/weaving/webbing
	name = "webbed leggings"
	result = list(/obj/item/clothing/under/roguetown/webs)

/datum/crafting_recipe/roguetown/weaving/shepardmask
	name = "silk half-mask"
	result = list(/obj/item/clothing/mask/rogue/shepherd)
	reqs = list(/obj/item/natural/silk = 1)
	sellprice = 30

/*========= SKILL LEVEL: 2 REQUIRED ==========*/

/datum/crafting_recipe/roguetown/weaving/stockings_white_silk
	name = "white silk stockings"
	result = list(/obj/item/clothing/under/roguetown/tights/stockings/silk/white)
	reqs = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/weaving/stockings_black_silk
	name = "black silk stockings"
	result = list(/obj/item/clothing/under/roguetown/tights/stockings/silk/black)
	reqs = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/weaving/stockings_blue_silk
	name = "blue silk stockings"
	result = list(/obj/item/clothing/under/roguetown/tights/stockings/silk/blue)
	reqs = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/weaving/stockings_red_silk
	name = "red silk stockings"
	result = list(/obj/item/clothing/under/roguetown/tights/stockings/silk/red)
	reqs = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/weaving/stockings_purple_silk
	name = "purple silk stockings"
	result = list(/obj/item/clothing/under/roguetown/tights/stockings/silk/purple)
	reqs = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/weaving/cloak
	name = "silk half cloak"
	result = list(/obj/item/clothing/cloak/half)
	craftdiff = 2
	sellprice = 19

/datum/crafting_recipe/roguetown/weaving/bathrobe
	name = "bathrobe"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/bath)
	reqs = list(/obj/item/natural/silk = 2,
				/obj/item/natural/fur = 1)
	craftdiff = 2
	sellprice = 10

/datum/crafting_recipe/roguetown/weaving/mundies
	name = "masculine smallclothes"
	result = list(/obj/item/undies)
	craftdiff = 2
	sellprice = 20

/datum/crafting_recipe/roguetown/weaving/fundies
	name = "feminine smallclothes"
	result = list(/obj/item/undies/f)
	craftdiff = 2
	sellprice = 20


/*========= SKILL LEVEL: 3 REQUIRED ==========*/

/datum/crafting_recipe/roguetown/weaving/paddedgambeson
	name = "padded gambeson"
	result = list(/obj/item/clothing/suit/roguetown/armor/gambeson/heavy)
	reqs = list(/obj/item/natural/cloth = 8)
	craftdiff = 3

/datum/crafting_recipe/roguetown/weaving/shirt
	name = "formal silks"
	result = list(/obj/item/clothing/suit/roguetown/shirt/undershirt/puritan)
	craftdiff = 3
	sellprice = 35

/datum/crafting_recipe/roguetown/weaving/silkdress
	name = "chemise"
	result = list (/obj/item/clothing/suit/roguetown/shirt/dress/silkdress/random)
	craftdiff = 3
	sellprice = 30

/datum/crafting_recipe/roguetown/weaving/barmaid
	name = "bar dress"
	result = list (/obj/item/clothing/suit/roguetown/shirt/dress)
	craftdiff = 3
	sellprice = 27

/datum/crafting_recipe/roguetown/weaving/valorian
	name = "valorian dress"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress/valorian)
	craftdiff = 3
	sellprice = 20

/datum/crafting_recipe/roguetown/weaving/silkpantaloons
	name = "silk pantaloons"
	result = list (/obj/item/clothing/under/roguetown/pantaloons/random)
	craftdiff = 3
	sellprice = 20

/datum/crafting_recipe/roguetown/weaving/cape_silk
	name = "silk cape"
	result = list(/obj/item/clothing/cloak/cape/silk/random)
	reqs = list(/obj/item/natural/silk = 3)
	craftdiff = 3
	sellprice = 40


/*========= SKILL LEVEL: 4 REQUIRED ==========*/

/datum/crafting_recipe/roguetown/weaving/silkcoat
	name = "silk coat"
	result = list (/obj/item/clothing/suit/roguetown/armor/leather/jacket/silk_coat)
	reqs = list(/obj/item/natural/silk = 4,
				/obj/item/natural/cloth = 1)
	craftdiff = 4
	sellprice = 60

/datum/crafting_recipe/roguetown/weaving/armordress
	name = "padded dress"
	result = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/dress
	reqs = list(/obj/item/natural/silk = 4,
				/obj/item/natural/cloth = 1)
	craftdiff = 4
	sellprice = 80

/datum/crafting_recipe/roguetown/weaving/nunhood
	name = "nun hood"
	result = list(/obj/item/clothing/head/roguetown/nun)
	reqs = list(/obj/item/natural/cloth = 2)
	craftdiff = 4
	sellprice = 20

/datum/crafting_recipe/roguetown/weaving/nunrobe
	name = "nun robe"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/nun)
	reqs = list(/obj/item/natural/cloth = 4)
	craftdiff = 4
	sellprice = 20

/datum/crafting_recipe/roguetown/weaving/astratarobe
	name = "astrata robes"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/astrata)
	reqs = list(/obj/item/natural/cloth = 4)
	craftdiff = 4
	sellprice = 25

/datum/crafting_recipe/roguetown/weaving/astratahood
	name = "solar hood"
	result = list(/obj/item/clothing/head/roguetown/roguehood/astrata)
	reqs = list(/obj/item/natural/cloth = 2)
	craftdiff = 4
	sellprice = 25

/datum/crafting_recipe/roguetown/weaving/nocrobe
	name = "noc robes"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/noc)
	reqs = list(/obj/item/natural/cloth = 4)
	craftdiff = 4
	sellprice = 25

/datum/crafting_recipe/roguetown/weaving/nochood
	name = "moon hood"
	result = list(/obj/item/clothing/head/roguetown/roguehood/nochood)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/ingot/silver = 1,)
	craftdiff = 4
	sellprice = 25

/datum/crafting_recipe/roguetown/weaving/dendorrobe
	name = "dendor robes"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/dendor)
	reqs = list(/obj/item/natural/cloth = 4)
	craftdiff = 4
	sellprice = 25

/datum/crafting_recipe/roguetown/weaving/necrarobe
	name = "necra robes"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/necra)
	reqs = list(/obj/item/natural/cloth = 4)
	craftdiff = 4
	sellprice = 25

/datum/crafting_recipe/roguetown/weaving/necrahood
	name = "necra hood"
	result = list(/obj/item/clothing/head/roguetown/padded/deathshroud)
	reqs = list(/obj/item/natural/cloth = 2)
	craftdiff = 4
	sellprice = 20

/datum/crafting_recipe/roguetown/weaving/eoramask // should not be a weaving recipe, does not follow the rules. TO DO
	name = "eora hood"
	result = list(/obj/item/clothing/head/roguetown/roguehood/eora)
	reqs = list(/obj/item/ingot/silver = 1,
				/obj/item/natural/cloth = 2)
	craftdiff = 4
	sellprice = 20

/datum/crafting_recipe/roguetown/weaving/eorarobes
	name = "eora robes"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/eora)
	reqs = list(/obj/item/natural/cloth = 3)
	craftdiff = 4
	sellprice = 20

/datum/crafting_recipe/roguetown/weaving/eorastraps
	name = "eora straps"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/eora/alt)
	reqs = list(/obj/item/natural/silk = 3)
	craftdiff = 4
	sellprice = 50

/datum/crafting_recipe/roguetown/weaving/malumrobe
	name = "malum robe"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/malum)
	reqs = list(/obj/item/natural/cloth = 3)
	craftdiff = 4
	sellprice = 50

/*========= SKILL LEVEL: 5 REQUIRED ==========*/

/datum/crafting_recipe/roguetown/weaving/lordcloak
	name = "lordly cloak"
	result = list(/obj/item/clothing/cloak/lordcloak)
	reqs = list(/obj/item/natural/fur = 2,
				/obj/item/natural/silk = 4)
	craftdiff = 5


