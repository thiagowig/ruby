for number in (1..5)
  puts "For: #{number}"
end

number = 0
while number <= 5
  puts "While: #{number}"
  number += 1
end

number = 0
until number == 5
  puts "Until: #{number}"
  number += 1
end

special_string = %{"Testing {a}
                special 'string
                '"}
puts special_string

=begin
  puts "Thiago"
=end

numbers = [1, 2, 3]

p numbers
p numbers.class
p numbers[0]
p numbers[2]
p numbers.first
p numbers.last
numbers << "Thiago"
p numbers

words = %w{hello world}
p words


require File.expand_path("book_store/routes")

library = []
design_and_test = Book.new "Thiago Fonseca", "123", 10, 12, :tests
reponsive_web_design = Book.new "Simone Borges", "321", 10, 12, :web_design
library << design_and_test
library << reponsive_web_design
p library

library = Library.new
library.add_book design_and_test
library.add_book reponsive_web_design
p library.books

for book in library.books
  p "THE BOOK: #{book.price}"
end

library.books.each { |book|
  p "THE BOOK: #{book.price}"
}

hash = {
  design_and_test.isbn => design_and_test,
  reponsive_web_design.isbn => reponsive_web_design
}

p hash[design_and_test.isbn]
p hash[reponsive_web_design.isbn]