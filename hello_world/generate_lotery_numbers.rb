def generate_lotery_numbers(amount, max)
  values = []
  
  amount.times do 
    random_number = rand(1..max)
    values << random_number if not values.include? random_number
  end
  
  p values.sort
end

generate_lotery_numbers 6, 60


