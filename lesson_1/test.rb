def my_method
  yield self
end

place = "world"

my_method do |obj|
  place = "block"
  puts "hello #{obj} this is #{place}"
end

puts "place is: #{place}"