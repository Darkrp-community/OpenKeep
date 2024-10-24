/obj/structure/bookcase/random
	var/category = null
	var/book_count = 10
	icon_state = "bookcase"
	anchored = TRUE
	state = 2

	Initialize(mapload)
		. = ..()
		if(book_count && isnum(book_count))
			book_count += pick(-1, -1, 0, 1, 1)
			. = INITIALIZE_HINT_LATELOAD

	LateInitialize()
		create_random_books(book_count, src, FALSE, category)
		update_icon()

/obj/structure/bookcase/random/apocrypha
	name = "bookcase (Apocrypha & Grimoires)"
	category = "Apocrypha & Grimoires"

/obj/structure/bookcase/random/myths
	name = "bookcase (Myths & Tales)"
	category = "Myths & Tales"

/obj/structure/bookcase/random/legends
	name = "bookcase (Legends & Accounts)"
	category = "Legends & Accounts"

/obj/structure/bookcase/random/thesis
	name = "bookcase (Thesis)"
	category = "Thesis"

/obj/structure/bookcase/random/eoratica
	name = "bookcase (Eoratica)"
	category = "Eoratica"

/proc/create_random_books(amount = 2, location, fail_loud = FALSE, category = null)
	. = list()
	if (!isnum(amount) || amount < 1)
		return
	var/datum/DBQuery/query_get_random_books = SSdbcore.NewQuery({"
		SELECT author, title, content, category, select_icon
		FROM [format_table_name("library")]
		WHERE isnull(deleted) AND (:category IS NULL OR category = :category)
		ORDER BY RAND() LIMIT :limit
	"}, list("category" = category, "limit" = amount))
	if (query_get_random_books.Execute())
		while (query_get_random_books.NextRow())
			var/author = query_get_random_books.item[1]
			var/title = query_get_random_books.item[2]
			var/content = query_get_random_books.item[3]
			var/category_db = query_get_random_books.item[4]
			var/select_icon = query_get_random_books.item[6]

			var/obj/item/book/rogue/B = new(location)
			B.author = author
			B.title = title
			B.pages = list("<b3><h3>Title: [B.title]<br>Author: [B.author]</b><h3>[content]")
			B.name = B.title
			if (select_icon)
				B.icon_state = "[select_icon]_0"
				B.base_icon_state = select_icon
			else
				B.icon_state = "book[rand(1,8)]"
			. += B
	qdel(query_get_random_books)

/obj/item/book/rogue/random_book
	var/book_category = null
	random_cover = TRUE

	Initialize()
		..()
		get_random_book_from_database(book_category)

	proc/get_random_book_from_database(var/book_category)
		var/datum/DBQuery/query_get_random_book = SSdbcore.NewQuery({"
			SELECT author, title, content, category, select_icon
			FROM [format_table_name("library")]
			WHERE isnull(deleted) AND category = :category
			ORDER BY RAND() LIMIT 1
		"}, list("category" = book_category))

		if (query_get_random_book.Execute())
			if (query_get_random_book.NextRow())
				src.author = query_get_random_book.item[1]
				src.title = query_get_random_book.item[2]
				var/content = query_get_random_book.item[3]
				src.category = query_get_random_book.item[4]
				var/select_icon = query_get_random_book.item[6]

				src.pages = list("<b3><h3>Title: [src.title]<br>Author: [src.author]</b><h3>[content]")
				src.name = src.title
				if (select_icon)
					src.icon_state = "[select_icon]_0"
					src.base_icon_state = select_icon
				else
					src.icon_state = "book[rand(1,8)]"
		else
			src.name = "Empty Book"
			src.pages = list("<b3><h3>No books available in this category.</h3></b>")
		qdel(query_get_random_book)

/obj/item/book/rogue/random_apocrypha
	parent_type = /obj/item/book/rogue/random_book
	book_category = "Apocrypha & Grimoires"
	name = "Book (Apocrypha & Grimoires)"

/obj/item/book/rogue/random_myths
	parent_type = /obj/item/book/rogue/random_book
	book_category = "Myths & Tales"
	name = "Book (Myths & Tales)"

/obj/item/book/rogue/random_legends
	parent_type = /obj/item/book/rogue/random_book
	book_category = "Legends & Accounts"
	name = "Book (Legends & Accounts)"

/obj/item/book/rogue/random_thesis
	parent_type = /obj/item/book/rogue/random_book
	book_category = "Thesis"
	name = "Book (Thesis)"

/obj/item/book/rogue/random_eoratica
	parent_type = /obj/item/book/rogue/random_book
	book_category = "Eoratica"
	name = "Book (Eoratica)"