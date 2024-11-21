/obj/machinery/vending/boozeomat
	name = "\improper Booze-O-Mat"
	desc = ""
	icon_state = "boozeomat"
	icon_deny = "boozeomat-deny"
	products = list(
		/obj/item/reagent_containers/food/drinks/drinkingglass = 30,
	)
	contraband = list(
		/obj/item/reagent_containers/food/drinks/mug/tea = 12,
	)
	premium = list(
		/obj/item/reagent_containers/glass/bottle/ethanol = 4,
	)

	product_slogans = "I hope nobody asks me for a bloody cup o' tea...;Alcohol is humanity's friend. Would you abandon a friend?;Quite delighted to serve you!;Is nobody thirsty on this station?"
	product_ads = "Drink up!;Booze is good for you!;Alcohol is humanity's best friend.;Quite delighted to serve you!;Care for a nice, cold beer?;Nothing cures you like booze!;Have a sip!;Have a drink!;Have a beer!;Beer is good for you!;Only the finest alcohol!;Best quality booze since 2053!;Award-winning wine!;Maximum alcohol!;Man loves beer.;A toast for progress!"
	req_access = list(ACCESS_BAR)
	refill_canister = /obj/item/vending_refill/boozeomat
	default_price = 20
	extra_price = 50
	payment_department = ACCOUNT_SRV

/obj/machinery/vending/boozeomat/all_access
	desc = ""
	req_access = null

/obj/machinery/vending/boozeomat/pubby_maint //abandoned bar on Pubbystation
	products = list(
			/obj/item/reagent_containers/food/drinks/ice = 3,
			/obj/item/reagent_containers/food/drinks/drinkingglass/shotglass = 6,
			/obj/item/reagent_containers/food/drinks/flask = 1)
	req_access = null

/obj/machinery/vending/boozeomat/pubby_captain //Captain's quarters on Pubbystation
	products = list(
					/obj/item/reagent_containers/food/drinks/drinkingglass/shotglass = 4);
	req_access = list(ACCESS_CAPTAIN)

/obj/machinery/vending/boozeomat/syndicate_access
	req_access = list(ACCESS_SYNDICATE)

/obj/item/vending_refill/boozeomat
	machine_name = "Booze-O-Mat"
	icon_state = "refill_booze"
