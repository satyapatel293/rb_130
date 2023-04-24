# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  # rest of class needs implementation

  def add(obj)
    raise TypeError, 'Can only add Todo objects' unless obj.instance_of? Todo 
    
    todos << obj 
  end 
  alias_method :<<, :add 

  def size 
    todos.size
  end 

  def first
    todos.first
  end 

  def last
    todos.last 
  end 

  def to_a
    todos
  end 

  def done?
    todos.select {|item| item.done?}
  end 

  def item_at(index)
    todos.fetch(index)
  end 
  
  def mark_done_at(index)
    item_at(index).done!
  end 
  
  def mark_undone_at(index)
    item_at(index).undone!
  end

  def done!
    todos.each {|item| item.done!}
  end 

  def shift
    todos.shift
  end 

  def pop
    todos.pop
  end 

  def remove_at(index)
    todos.delete(item_at(index))
  end 


  def each  
    todos.each do |todo| 
      yield todo 
    end 
    self
  end

  def select
    list = TodoList.new(title)
    each do |todo| 
      list << todo if yield todo 
    end 
    list 
  end 

  def to_s 
    <<~MESSAGE
    ---- Today's Todos ----
    #{todos.map(&:to_s).join("\n")}
    MESSAGE
  end 

  private 
  attr_reader :todos
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

results = list.select { |todo| todo.done? }    # you need to implement this method

puts results.inspect