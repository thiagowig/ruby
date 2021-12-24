
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
design_and_test = Book.new "Design and Test", "Thiago Fonseca", "123", 10, 100, :tests
reponsive_web_design = Book.new "Responsive web design", "Simone Borges", "321", 10, 10, :web_design
library << design_and_test
library << reponsive_web_design
p library

library = EasySale::Set.new
#library.add_book design_and_test
#library.add_book reponsive_web_design
#p library.books

for book in library.books
  p "THE BOOK: #{book.price}"
end

library.books.each { |book|
  p "THE BOOK: #{book.price}"
}
#
# hash = {
#   design_and_test.isbn => design_and_test,
#   reponsive_web_design.isbn => reponsive_web_design
# }

# p hash[design_and_test.isbn]
# p hash[reponsive_web_design.isbn]

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
#
# library.filter_by_category :web_design do |book|
#   p book.author
# end
# library.filter_by_category :tests

report = Report.new library
p report.total
p report.titles

print_method_proc = Proc.new do |book|
  p book.author
end
#
# library.filter_by_category02 :web_design, &print_method_proc

print_method_lambda = lambda do |book|
  p "LAMBDA: #{book.author}"
end

# library.filter_by_category03 :web_design, print_method_lambda

##### FILES
test_file = File.new("/home/thiago/dev/repo/ruby/hello_world/test.txt")
p test_file.size
test_file.each { |line| p line }

File.open("/home/thiago/dev/repo/ruby/hello_world/test.txt", "a") do |test_file|
  test_file.puts "Adding some cool content"
end

require "yaml"
serialized_object = YAML.dump design_and_test
p serialized_object
design_and_test_again = YAML.load serialized_object
p design_and_test_again

#database = Database.new
#database.save design_and_test
#database.save reponsive_web_design


p library.filter_by_category04(":web")

p Book.superclass
p Book.methods
p Book.superclass.methods


matrix_dvd = DVD.new "Matrix", 100, :action

p design_and_test.price_with_discount
p matrix_dvd.price_with_discount

p design_and_test.format_value
p matrix_dvd.extend CurrencyFormatter
p matrix_dvd.format_value

p library.books
p library.inject(0) { |total, book| total += book.price }

begin
  library.raise_error
rescue MySystemException => error
  p "An error was raised: #{error}"
ensure
  p "Finally"
end


library.named_parameters second: 20, first: 10

p DVD.ancestors

require 'rubygems'
require 'brnumeros'