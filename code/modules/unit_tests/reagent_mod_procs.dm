/datum/unit_test/reagent_mob_procs/Run()
	var/mob/living/carbon/human/human = allocate(/mob/living/carbon/human)
	var/obj/item/reagent_containers/food/snacks/produce/apple/fooditem = allocate(/obj/item/reagent_containers/food/snacks/produce/apple)

	TEST_ASSERT_EQUAL(human.reagents.has_reagent(/datum/reagent/consumable/nutriment), FALSE, "Human somehow has ketchup before eating")

	fooditem.attack(human, human)
	human.reagents.add_reagent(/datum/reagent/medicine/epinephrine, 5)

	TEST_ASSERT(human.reagents.has_reagent(/datum/reagent/consumable/nutriment), "Human doesn't have ketchup after eating")
