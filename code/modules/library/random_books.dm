/obj/structure/bookcase/random
	var/category = null
	var/book_count = 10
	anchored = TRUE
	state = 2
	based = "a"

/obj/structure/bookcase/random/Initialize(mapload)
	. = ..()
	based = pick("a","b","c","d","e","f","g","h")
	state = 2
	anchored = TRUE
	book_count = rand(5,10) // Set book_count between 5 and 10
	return INITIALIZE_HINT_LATELOAD

/obj/structure/bookcase/random/LateInitialize()
	src.create_random_books(book_count)
	src.update_icon()
	return ..()

/obj/structure/bookcase/random/proc/create_random_books(amount = 2)
	. = list()
	if (!isnum(amount) || amount < 1)
		return

	// First, get the total number of available books in the category
	var/datum/DBQuery/query_count_books = SSdbcore.NewQuery({"
		SELECT COUNT(*) FROM library
		WHERE deleted <> 1 AND approved = 1 AND (:category IS NULL OR category = :category)
	"}, list("category" = src.category))

	var/total_books = 0
	if (query_count_books && query_count_books.Execute() && query_count_books.NextRow())
		total_books = text2num(query_count_books.item[1])
	if(query_count_books)
		qdel(query_count_books)

	if(total_books == 0)
		return

	// Adjust amount to be the minimum of requested amount and total available books
	amount = min(amount, total_books)

	// Now fetch random books without duplicates
	var/datum/DBQuery/query_get_random_books = SSdbcore.NewQuery({"
		SELECT author, title, content, category, select_icon
		FROM library
		WHERE isnull(deleted) AND approved = 1 AND (:category IS NULL OR category = :category)
		ORDER BY RAND() LIMIT :limit
	"}, list("category" = src.category, "limit" = amount * 2)) // Fetch extra in case of duplicates

	if (query_get_random_books && query_get_random_books.Execute())
		var/list/added_titles = list()
		while (query_get_random_books.NextRow())
			var/title = query_get_random_books.item[2]
			// Check if we have already added this book (by title)
			if(title in added_titles)
				continue // Skip duplicate
			var/author = query_get_random_books.item[1]
			var/content = query_get_random_books.item[3]
			var/category_db = query_get_random_books.item[4]
			var/select_icon = query_get_random_books.item[5]

			// Check if the bookcase has space
			if(length(src.contents) >= 15)
				break // Bookcase is full

			var/obj/item/book/rogue/B = new()
			B.author = author
			B.title = title
			B.pages = list("<b3><h3>Title: [B.title]<br>Author: [B.author]</b><h3>[content]")
			B.name = B.title
			B.category = category_db
			if (select_icon)
				B.icon_state = "[select_icon]_0"
				B.base_icon_state = select_icon
			else
				B.icon_state = "book[rand(1,8)]"

			// Place the book into the bookcase's contents
			B.loc = src

			. += B
			added_titles += title

			if(length(src.contents) >= amount)
				break // Reached desired amount of books
	if(query_get_random_books)
		qdel(query_get_random_books)

/obj/structure/bookcase/random/update_icon()
	if((length(contents) >= 1) && (length(contents) <= 15))
		icon_state = "[based][length(contents)]"
	else
		icon_state = "bookcase"

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

/obj/structure/bookcase/random/archive // Deprecated subtype, used in the old code. Swap these out for one of the types above whenever possible.
	name = "bookcase (Random)"
	category = "Eoratica"
	desc = "This is an improper bookcase. Please exit the game and inform your local mapper where this is and to replace it."

/obj/item/book/rogue/random_book
	var/book_category = null
	random_cover = TRUE

/obj/item/book/rogue/random_book/Initialize()
	if(!..())
		return FALSE
	return INITIALIZE_HINT_LATELOAD // Indicate that LateInitialize() should be called

/obj/item/book/rogue/random_book/LateInitialize()
	src.get_random_book_from_database(book_category)
	return ..()

/obj/item/book/rogue/random_book/proc/get_random_book_from_database(book_category)
	var/datum/DBQuery/query_get_random_book = SSdbcore.NewQuery({"
		SELECT author, title, content, category, select_icon
		FROM library
		WHERE deleted <> 1 AND approved = 1 AND category = :category
		ORDER BY RAND() LIMIT 1
	"}, list("category" = book_category))

	if (query_get_random_book && query_get_random_book.Execute())
		if (query_get_random_book.NextRow())
			src.author = query_get_random_book.item[1]
			src.title = query_get_random_book.item[2]
			var/content = query_get_random_book.item[3]
			src.category = query_get_random_book.item[4]
			var/select_icon = query_get_random_book.item[5]

			src.pages = list("<b3><h3>Title: [src.title]<br>Author: [src.author]</b><h3>[content]")
			src.name = src.title
			if (select_icon)
				src.icon_state = "[select_icon]_0"
				src.base_icon_state = select_icon
			else
				src.icon_state = "book[rand(1,8)]"
		else
			// No books found; delete the book object
			qdel(src)
	else
		// Query failed; delete the book object
		qdel(src)

	if(query_get_random_book)
		qdel(query_get_random_book)

/obj/item/book/rogue/random_book/apocrypha
	book_category = "Apocrypha & Grimoires"
	name = "Book (Apocrypha & Grimoires)"

/obj/item/book/rogue/random_book/myths
	book_category = "Myths & Tales"
	name = "Book (Myths & Tales)"

/obj/item/book/rogue/random_book/legends
	book_category = "Legends & Accounts"
	name = "Book (Legends & Accounts)"

/obj/item/book/rogue/random_book/thesis
	book_category = "Thesis"
	name = "Book (Thesis)"

/obj/item/book/rogue/random_book/eoratica
	book_category = "Eoratica"
	name = "Book (Eoratica)"

/obj/item/book/random // Deprecated subtype
	name = "Book (improper)"
	desc = "Inform your local coder/mapper to have this removed."
