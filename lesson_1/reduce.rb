def reduce(array, default=0)
  counter = 0
  accumlator = default 

  while counter < array.size 
    accumlator = yield(accumlator, array[counter])
    counter += 1 
  end 

  accumlator 
end 


array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass


p ([1, 2].reduce do |acc, num|
  acc + num if num.odd?
end)     #nil .... this is unexpected 



### Further exploration 

def reduce(array, default=array[0])
  counter = 0
  counter = 1 if default == array[0]
  accumlator = default 

  while counter < array.size 
    accumlator = yield(accumlator, array[counter])
    counter += 1 
  end 

  accumlator 
end 


p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']