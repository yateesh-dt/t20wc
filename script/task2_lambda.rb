custom_lambda = lambda { |n| n > 1 ? n * custom_lambda.call(n-1) : 1}

puts "Enter a number"
n = gets.to_i
puts custom_lambda.call(n) 