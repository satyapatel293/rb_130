def each  
  current = 0 

  while current < size 
    yield todos[current]
    current += 1 
  end 

  todos 
end

### OR 

def each  
  todos.each do |todo| 
    yield todo 
  end 
end

# How can we return the orginal `TodoList` object like we do with `Array#each`

def each  
  todos.each do |todo| 
    yield todo 
  end
  self
end