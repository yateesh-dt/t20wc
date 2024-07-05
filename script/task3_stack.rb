class Stack
  def initialize
    @store = Array.new
    @peek = -1
  end
  
  def pop
    if @peek == -1
        puts "Stack is empty"
        nil
    else
      popped = @store[@peek]
      puts "Popped #{popped}"
      @store[@peek] = nil
      @peek = @peek -1
      popped
    end
  end
  
  def push(element)
    @peek = @peek + 1
    @store[@peek] = element
    puts "Pushed #{@store[@peek]}"
    self
  end
  
  def peek 
    puts "Stack height is #{@peek}"
  end
  
  def peek_element
    puts "Peek element in stack is #{@store[@peek]}"
  end

end

#sample operations
stack = Stack.new
stack.push(1)
stack.push(2)
stack.push(3)
stack.peek
stack.peek_element
stack.pop