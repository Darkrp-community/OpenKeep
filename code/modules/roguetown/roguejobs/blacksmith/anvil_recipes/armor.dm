/datum/anvil_recipe/armor
	appro_skill = /datum/skill/craft/armorsmithing

// --------- COPPER -----------
/datum/anvil_recipe/armor/ichainmail
	name = "chainmail"
	req_bar = /obj/item/ingot/iron
	created_item = list(/obj/item/clothing/suit/roguetown/armor/chainmail/iron,
						/obj/item/clothing/suit/roguetown/armor/chainmail/iron)

/datum/anvil_recipe/armor/ichaincoif
	name = "chain coif"
	req_bar = /obj/item/ingot/iron
	created_item = list(/obj/item/clothing/neck/roguetown/chaincoif/iron,
	/obj/item/clothing/neck/roguetown/chaincoif/iron)

/datum/anvil_recipe/armor/gorget
	name = "iron gorget"
	req_bar = /obj/item/ingot/iron
	created_item = list(/obj/item/clothing/neck/roguetown/gorget,
						/obj/item/clothing/neck/roguetown/gorget)

/datum/anvil_recipe/armor/ichainglove
	name = "chain gauntlets"
	req_bar = /obj/item/ingot/iron
	created_item = list(/obj/item/clothing/gloves/roguetown/chain/iron,
						/obj/item/clothing/gloves/roguetown/chain/iron)

/datum/anvil_recipe/armor/ichainleg
	name = "chain chausses"
	req_bar = /obj/item/ingot/iron
	created_item = list(/obj/item/clothing/under/roguetown/chainlegs/iron,
						/obj/item/clothing/under/roguetown/chainlegs/iron)

/datum/anvil_recipe/armor/platemask
	name = "iron mask"
	req_bar = /obj/item/ingot/iron
	created_item = list(/obj/item/clothing/mask/rogue/facemask,
					/obj/item/clothing/mask/rogue/facemask)

/datum/anvil_recipe/armor/skullcap
	name = "iron skullcap"
	req_bar = /obj/item/ingot/iron
	created_item = list(/obj/item/clothing/head/roguetown/helmet/skullcap,
						/obj/item/clothing/head/roguetown/helmet/skullcap)

/datum/anvil_recipe/armor/studdedleather
	name = "studded leather (2h)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/natural/hide, /obj/item/natural/hide)
	created_item = /obj/item/clothing/suit/roguetown/armor/leather/studded

/datum/anvil_recipe/armor/platebootlight
    name = "light plate boots"
    req_bar = /obj/item/ingot/iron
    created_item = list(/obj/item/clothing/shoes/roguetown/boots/armor/light,
						/obj/item/clothing/shoes/roguetown/boots/armor/light)

// --------- STEEL -----------

/datum/anvil_recipe/armor/haubergeon
	name = "haubergeon"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail

/datum/anvil_recipe/armor/hauberk
	name = "hauberk (2)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk

/datum/anvil_recipe/armor/chaincoif
	name = "chain coif"
	req_bar = /obj/item/ingot/steel
	created_item = list(/obj/item/clothing/neck/roguetown/chaincoif,
						/obj/item/clothing/neck/roguetown/chaincoif)

/datum/anvil_recipe/armor/chainglove
	name = "chain gauntlets"
	req_bar = /obj/item/ingot/steel
	created_item = list(/obj/item/clothing/gloves/roguetown/chain,
						/obj/item/clothing/gloves/roguetown/chain,)

/datum/anvil_recipe/armor/plateglove
	name = "plate gauntlets"
	req_bar = /obj/item/ingot/steel
	created_item = list(/obj/item/clothing/gloves/roguetown/plate)

/datum/anvil_recipe/armor/chainleg
	name = "chain chausses"
	req_bar = /obj/item/ingot/steel
	created_item = list(/obj/item/clothing/under/roguetown/chainlegs,
						/obj/item/clothing/under/roguetown/chainlegs)

/datum/anvil_recipe/armor/plateleg
	name = "plate chausses"
	req_bar = /obj/item/ingot/steel
	created_item = list(/obj/item/clothing/under/roguetown/platelegs)

/datum/anvil_recipe/armor/plate
	name = "munition plate armor (3)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate

/datum/anvil_recipe/armor/platefull
	name = "full-plate armor (4)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/ingot/steel,/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/full

/datum/anvil_recipe/armor/hplate
	name = "breastplate"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/half

/datum/anvil_recipe/armor/brigadine
	name = "brigadine (3s 1c)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel, /obj/item/natural/cloth)
	created_item = /obj/item/clothing/suit/roguetown/armor/brigandine

/datum/anvil_recipe/armor/scalemail
	name = "scalemail"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/scale

/datum/anvil_recipe/armor/platebracer
	name = "plate bracers"
	req_bar = /obj/item/ingot/steel
	created_item = list(/obj/item/clothing/wrists/roguetown/bracers,
					/obj/item/clothing/wrists/roguetown/bracers)

/datum/anvil_recipe/armor/helmetnasal
	name = "nasal helmet"
	req_bar = /obj/item/ingot/steel
	created_item = list(/obj/item/clothing/head/roguetown/helmet,
						/obj/item/clothing/head/roguetown/helmet)

/datum/anvil_recipe/armor/helmetkettle
	name = "kettle helmet"
	req_bar = /obj/item/ingot/steel
	created_item = list(/obj/item/clothing/head/roguetown/helmet/kettle,
						/obj/item/clothing/head/roguetown/helmet/kettle)

/datum/anvil_recipe/armor/bervor
	name = "steel bervor"
	req_bar = /obj/item/ingot/steel
	created_item = list(/obj/item/clothing/neck/roguetown/bervor)

/datum/anvil_recipe/armor/helmetsall
	name = "sallet"
	req_bar = /obj/item/ingot/steel
	created_item = list(/obj/item/clothing/head/roguetown/helmet/sallet)

/datum/anvil_recipe/armor/helmetsallv
	name = "visored sallet (2)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = (/obj/item/clothing/head/roguetown/helmet/sallet/visored)

/datum/anvil_recipe/armor/helmetbuc
	name = "bucket helmet (2)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = (/obj/item/clothing/head/roguetown/helmet/heavy/bucket)

/datum/anvil_recipe/armor/helmetpig
	name = "pigface helmet (2)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = (/obj/item/clothing/head/roguetown/helmet/heavy/pigface)

/datum/anvil_recipe/armor/helmetknight
	name = "knight's helmet (2)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = (/obj/item/clothing/head/roguetown/helmet/heavy/knight)

/datum/anvil_recipe/armor/plateboot
    name = "plated boots"
    req_bar = /obj/item/ingot/steel
    created_item = list(/obj/item/clothing/shoes/roguetown/boots/armor)

/datum/anvil_recipe/armor/platemask/steel
	name = "steel mask"
	req_bar = /obj/item/ingot/steel
	created_item = (/obj/item/clothing/mask/rogue/facemask/steel)
