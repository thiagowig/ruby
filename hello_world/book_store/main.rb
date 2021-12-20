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
design_and_test = Book.new "Thiago Fonseca", "123", 10, 12, :tests, "TDD"
reponsive_web_design = Book.new "Simone Borges", "321", 10, 10, :web_design, "Design Responsivo"
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

age = nil
age = 27 unless age
p age
age = 35 unless age
p age

age = nil
age ||= 27
p age
age ||= 35
p age

require 'set'
without_repetition = Set.new [1,2,3,1,2,3]
p without_repetition

p age.eql? age
p design_and_test.eql? reponsive_web_design

name = "Thiago"
p name.upcase
p name
p name.upcase!
p name

value = nil
number = "two"
if number == "one" then
  value = 1
elsif number == "two" then
  value = 2
else
  value = 3
end
p value

a = b = c = d = 0
p a, b, c, d

numbers = [1, 2, 3, 4]
new_numbers = for n in numbers
                n * 2
end
p new_numbers

numbers.each {|number| p number}
modified_numbers = numbers.collect { |number| number ** 2 }
p modified_numbers

library.filter_by_category :web_design do |book|
  p book.author
end
library.filter_by_category :tests

report = Report.new library
p report.total
p report.titles




