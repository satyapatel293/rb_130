def select 
  todos.select do |todo|
    yield select 
  end 
end 


def select
  result = []

  each do |todo| 
    result << todo if yield todo 
  end 

  result 
end 


def select
  result = TodoList.new('holder')

  each do |todo| 
    result << todo if yield todo 
  end 


  result 
end 