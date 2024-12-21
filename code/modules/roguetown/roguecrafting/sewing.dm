/datum/crafting_recipe/roguetown/sewing
	tools = list(/obj/item/needle)
	skillcraft = /datum/skill/misc/sewing
	subtype_reqs = TRUE // so you can use any subtype of fur
	craftdiff = 0

/*.............. recipes requiring no skill..............*/

/datum/crafting_recipe/roguetown/sewing/rags
	name = "rags"
	result = list(/obj/item/clothing/suit/roguetown/shirt/rags)
	reqs = list(/obj/item/natural/cloth = 2)

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
	name = "cloth half cloak"
	result = list(/obj/item/clothing/cloak/half)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)

/datum/crafting_recipe/roguetown/sewing/apron
	name = "cloth apron"
	result = list(/obj/item/clothing/cloak/apron)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)

/datum/crafting_recipe/roguetown/sewing/clothgloves
	name = "cloth gloves"
	result = list(/obj/item/clothing/gloves/roguetown/fingerless)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)

/datum/crafting_recipe/roguetown/sewing/shortshirt
	name = "cloth short shirt"
	result = list(/obj/item/clothing/suit/roguetown/shirt/shortshirt/uncolored)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)

/datum/crafting_recipe/roguetown/sewing/clothshirt
	name = "cloth shirt"
	result = list(/obj/item/clothing/suit/roguetown/shirt/undershirt/uncolored)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)

/datum/crafting_recipe/roguetown/sewing/stripedtunic
	name = "striped tunic"
	result = list(/obj/item/clothing/suit/roguetown/armor/gambeson/light/striped)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)

/datum/crafting_recipe/roguetown/sewing/clothtights
	name = "cloth tights"
	result = list(/obj/item/clothing/under/roguetown/tights/uncolored)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)

/datum/crafting_recipe/roguetown/sewing/headband
	name = "headband"
	result = list(/obj/item/clothing/head/roguetown/headband)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)

/datum/crafting_recipe/roguetown/sewing/strawhat
	name = "crude straw hat"
	result = list(/obj/item/clothing/head/roguetown/strawhat)
	reqs = list(/obj/item/natural/fibers = 3)

/datum/crafting_recipe/roguetown/sewing/knitcap
	name = "knit cap"
	result = list(/obj/item/clothing/head/roguetown/knitcap)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)

/datum/crafting_recipe/roguetown/sewing/cmask
	name = "cloth mask"
	result = list(/obj/item/clothing/mask/rogue/shepherd/clothmask)
	reqs = list(/obj/item/natural/fibers = 1, /obj/item/natural/cloth = 1)
	tools = list(/obj/item/needle)

/datum/crafting_recipe/roguetown/sewing/linedanklet
	name = "cloth anklet"
	result = list(/obj/item/clothing/shoes/roguetown/boots/clothlinedanklets)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 2)

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
	name = "straw fisher hat"
	result = list(/obj/item/clothing/head/roguetown/fisherhat)
	reqs = list(/obj/item/natural/fibers = 3)
	craftdiff = 1

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
	name = "jupon"
	result = list(/obj/item/clothing/cloak/stabard/surcoat)
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/clothtrou
	name = "cloth trousers"
	result = list(/obj/item/clothing/under/roguetown/trou)
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/lgambeson
	name = "light gambeson"
	result = list(/obj/item/clothing/suit/roguetown/armor/gambeson/light)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

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
	name = "gambeson"
	result = /obj/item/clothing/suit/roguetown/armor/gambeson
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 1)
	tools = list(/obj/item/needle)
	craftdiff = 2

/datum/crafting_recipe/roguetown/sewing/tabard
	name = "tabard"
	result = list(/obj/item/clothing/cloak/tabard)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/sewing/stabard
	name = "surcoat"
	result = list(/obj/item/clothing/cloak/stabard)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/sewing/bedsheet
	name = "bedsheet"
	result = list(/obj/item/bedsheet/rogue/cloth)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/sewing/bedsheetpelt
	name = "leather bedsheet"
	result = list(/obj/item/bedsheet/rogue/pelt)
	reqs = list(/obj/item/natural/hide/cured = 2,
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
	name = "robes"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/plain)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/cape
	name = "cape"
	result = list(/obj/item/clothing/cloak/cape)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3


/* .............. recipes requiring skill 4 ..............*/

/datum/crafting_recipe/roguetown/sewing/fancyhat
	name = "fancy hat"
	result = list(/obj/item/clothing/head/roguetown/fancyhat)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/sewing/fancyhat
	name = "fancy hat"
	result = list(/obj/item/clothing/head/roguetown/fancyhat)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/sewing/bardhat
	name = "bard hat"
	result = list(/obj/item/clothing/head/roguetown/bardhat)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 4


/*.............. recipes requiring skill 5 ..............*/

/datum/crafting_recipe/roguetown/sewing/lordcloak
	name = "lordly cloak"
	result = list(/obj/item/clothing/cloak/lordcloak)
	reqs = list(/obj/item/natural/fur = 2,
				/obj/item/natural/hide/cured = 4)
	craftdiff = 4

/datum/crafting_recipe/roguetown/sewing/tribalrags
	name = "tribal rags"
	result = /obj/item/clothing/suit/roguetown/shirt/tribalrag
	reqs = list(/obj/item/natural/hide = 1,
				/obj/item/natural/fibers = 1)
	sellprice = 6
	craftdiff = 0


/datum/crafting_recipe/roguetown/sewing/belt
	name = "leather belt"
	result = /obj/item/storage/belt/rogue/leather
	reqs = list(/obj/item/natural/hide/cured = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/sewing/hood
	name = "leather hood"
	result = /obj/item/clothing/head/roguetown/roguehood
	reqs = list(/obj/item/natural/hide/cured = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/sewing/cloak
	name = "leather cloak"
	result = /obj/item/clothing/cloak/raincloak
	reqs = list(/obj/item/natural/hide/cured = 2)
	craftdiff = 2

/datum/crafting_recipe/roguetown/sewing/vest
	name = "leather vest"
	result = /obj/item/clothing/suit/roguetown/armor/leather/vest
	reqs = list(/obj/item/natural/hide/cured = 2)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/hidearmor
	name = "hide armor"
	result = /obj/item/clothing/suit/roguetown/armor/leather/hide
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fur = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/heavygloves
	name = "hide gloves"
	result = /obj/item/clothing/gloves/roguetown/angle
	reqs = list(/obj/item/natural/fur = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/cloakfur
	name = "fur cloak"
	result = /obj/item/clothing/cloak/raincloak/furcloak/crafted
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fur = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/shoes
	name = "simple shoes"
	result = list(/obj/item/clothing/shoes/roguetown/simpleshoes)
	reqs = list(/obj/item/natural/hide/cured = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/pouch
	name = "leather pouch"
	result = list(/obj/item/storage/belt/rogue/pouch)
	reqs = list(/obj/item/natural/hide/cured = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/sewing/satchel
	name = "leather satchel"
	result = list(/obj/item/storage/backpack/rogue/satchel)
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/backpack
	name = "leather backpack"
	result = /obj/item/storage/backpack/rogue/backpack
	reqs = list(/obj/item/natural/hide/cured = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 4

/// ADVANCED LEATHER

/datum/crafting_recipe/roguetown/sewing/leather/boots
	name = "hardened leather boots"
	result = /obj/item/clothing/shoes/roguetown/boots/leather/advanced
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/sewing/leather/gloves
	name = "hardened leather gloves"
	result = /obj/item/clothing/gloves/roguetown/leather/advanced
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/sewing/leather/coat
	name = "hardened leather coat"
	result = /obj/item/clothing/suit/roguetown/armor/leather/advanced
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/sewing/leather/hood
	name = "hardened leather hooded helmet"
	result = /obj/item/clothing/head/roguetown/helmet/leather/advanced
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/sewing/leather/chausses
	name = "hardened leather chausses"
	result = /obj/item/clothing/under/roguetown/trou/leather/advanced
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 4

/// MASTERWORK

/datum/crafting_recipe/roguetown/sewing/leather/boots/masterwork
	name = "masterwork leather boots"
	result = /obj/item/clothing/shoes/roguetown/boots/leather/masterwork
	reqs = list(/obj/item/clothing/shoes/roguetown/boots/leather = 1,
				/obj/item/natural/cured/essence = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 5

/datum/crafting_recipe/roguetown/sewing/leather/gloves/masterwork
	name = "masterwork leather gloves"
	result = /obj/item/clothing/gloves/roguetown/leather/masterwork
	reqs = list(/obj/item/clothing/gloves/roguetown/leather = 1,
				/obj/item/natural/cured/essence = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 5

/datum/crafting_recipe/roguetown/sewing/leather/bracers/masterwork
	name = "masterwork leather bracers"
	result = /obj/item/clothing/wrists/roguetown/bracers/leather/masterwork
	reqs = list(/obj/item/clothing/wrists/roguetown/bracers/leather = 1,
				/obj/item/natural/cured/essence = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 5

/datum/crafting_recipe/roguetown/sewing/leather/coat/masterwork
	name = "masterwork leather coat"
	result = /obj/item/clothing/suit/roguetown/armor/leather/masterwork
	reqs = list(/obj/item/clothing/suit/roguetown/armor/leather = 1,
				/obj/item/natural/cured/essence = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 5

/datum/crafting_recipe/roguetown/sewing/leather/helmet/masterwork
	name = "masterwork leather helmet"
	result = /obj/item/clothing/head/roguetown/helmet/leather/masterwork
	reqs = list(/obj/item/clothing/head/roguetown/helmet/leather = 1,
				/obj/item/natural/cured/essence = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 5

/datum/crafting_recipe/roguetown/sewing/leather/chausses/masterwork
	name = "masterwork leather chausses"
	result = /obj/item/clothing/under/roguetown/trou/leather/masterwork
	reqs = list(/obj/item/clothing/under/roguetown/trou/leather = 1,
				/obj/item/natural/cured/essence = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 5

/// SILKS

/* craftdif of 1 = NOVICE */

/datum/crafting_recipe/roguetown/sewing/shepardmask
	name = "half-mask (cloth, silk; LOOM, NOVICE)"
	result = list(/obj/item/clothing/mask/rogue/shepherd)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/silk = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/rags
	name = "shirt (webbed) - (silk; LOOM, NOVICE)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/undershirt/webs)
	reqs = list(/obj/item/natural/silk = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/webbing
	name = "trousers (webbed) - (2 silks; LOOM, NOVICE)"
	result = list(/obj/item/clothing/under/roguetown/webs)
	reqs = list(/obj/item/natural/silk = 2)
	craftdiff = 1

/* craftdif of 2 = APPRENTICE */

/* craftdif of 3 = JOURNEYMAN */

/datum/crafting_recipe/roguetown/sewing/cloak
	name = "cloak (half, silk) - (cloth, silk; LOOM, JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/half)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/silk = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/nochood
	name = "hood (moon/Noc) - (2 cloths, silk; LOOM, JOURNEYMAN)"
	result = list(/obj/item/clothing/head/roguetown/roguehood/nochood)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/silk = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/necrahood
	name = "hood (Necra) - (2 cloths, silk; LOOM, JOURNEYMAN)"
	result = list(/obj/item/clothing/head/roguetown/padded/deathshroud)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/silk = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/astratahood
	name = "hood (solar/Astrata) - (2 cloths, silk; LOOM, JOURNEYMAN)"
	result = list(/obj/item/clothing/head/roguetown/roguehood/astrata)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/silk = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/shirt
	name = "shirt (formal silks) - (5 silks; LOOM, JOURNEYMAN)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/undershirt/puritan)
	reqs = list(/obj/item/natural/silk = 5)
	craftdiff = 3

/* craftdif of 4 = EXPERT */

/datum/crafting_recipe/roguetown/sewing/astratarobe
	name = "robes (Astrata) - (3 cloths, silk; LOOM, EXPERT)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/astrata)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/silk = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/sewing/dendorrobe
	name = "robes (Dendor) - (3 cloths, silk; LOOM, EXPERT)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/dendor)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/silk = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/sewing/necrarobe
	name = "robes (Necra) - (3 cloths, silk; LOOM, EXPERT)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/necra)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/silk = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/sewing/nocrobe
	name = "robes (Noc) - (3 cloths, silk; LOOM, EXPERT)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/noc)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/silk = 1)
	craftdiff = 4

/* craftdif of 5 = MASTER */

/datum/crafting_recipe/roguetown/sewing/silkcoat
	name = "coat (silk) - (cloth, 2 furs, 3 silks; LOOM, MASTER)"
	result = list(/obj/item/clothing/suit/roguetown/armor/leather/jacket/silk_coat)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/silk = 3,
				/obj/item/natural/fur = 2)
	craftdiff = 5
	sellprice = 60

/datum/crafting_recipe/roguetown/sewing/barkeep
	name = "dress (bar, silk) - (2 cloths, 2 silks; LOOM, MASTER)"
	result = list (/obj/item/clothing/suit/roguetown/shirt/dress)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/silk = 2)
	craftdiff = 5

/datum/crafting_recipe/roguetown/sewing/silkdress
	name = "dress (chemise, silk) - (2 fibers, 3 silks; LOOM, MASTER)"
	result = list (/obj/item/clothing/suit/roguetown/shirt/dress/silkdress/random)
	reqs = list(/obj/item/natural/fibers = 2,
				/obj/item/natural/silk = 3)
	craftdiff = 5
