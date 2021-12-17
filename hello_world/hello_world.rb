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

