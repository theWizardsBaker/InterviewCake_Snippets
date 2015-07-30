=begin

Question 20:

You've implemented a Stack class, 
but you want to be able to access the largest element in a stack. 

Use your Stack class to implement a new class MaxStack with a function get_max() 
that returns the largest element in the stack. get_max() should not remove the item.

Your stacks will contain only integers. 

=end

class Stack

	attr_reader :items, :max

	# initialize an empty list
	def initialize
	    @items, @max = [], []
	end

	# push a new item to the last index
	def push(item)
	    @items.push(item)
	    # add to the maximum if the maximum is empty 
	    # or the newest item is greater than the old maximum
	    @max.push(item) if @max.empty? || item >= @max.last
	end
	# remove the last item
	def pop
	    item = @items.pop()
	    # if the popped item is the highest, remove it from the max
	     @max.pop() if item == @max.last
	    item
	end
	# see what the last item is
	def peek
		@items.last
	end
	# see what the highest item is
	def get_max
		@max.last
	end
end


stack = Stack.new()
# random 8 nums
8.times { stack.push(rand(20)) }
# show the set
print  "set: " + stack.items.to_s + "\n"
# show the top and max
8.times do 
	puts "Top : #{stack.peek()}, Max : #{stack.get_max()}"
	stack.pop()
end



