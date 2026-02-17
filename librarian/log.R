books <- read.csv('books.csv')
print(writer <- subset(books, author == 'Mia Morgan')$title)
print(musician <- subset(books, topic == 'Music' & year == 1613)$title)
print(traveler <- subset(books, (author == 'Lysandra Silverleaf' | author == 'Elena Petrova') & year == 1775)$title)
print(painter <- subset(books, topic == 'Art' & (pages >= 200 & pages <= 300) & (year == 1990 | year == 1992))$title)
print(scientist <- subset(books, grepl('Quantum Mechanics', title)))$title

authors <- read.csv('authors.csv')
print(teacher <- subset(books, topic == 'Education' & (year >= 1700 & year <= 1799) & author %in% subset(authors, hometown == 'Zenthia')$author)$title)
