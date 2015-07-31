=begin
	Question 19:
	
	Implement a queue using 2 stacks. 
	Your queue should have an enqueue and a dequeue function 
	and it should be "first in first out" (FIFO). 

	Optimize for the time cost of mmm function calls on your queue. 
	These can be any mix of enqueue and dequeue calls.

	Assume you already have a stack implementation and it gives O(1)O(1)O(1) time push and pop. 
=end

class Queue
	attr_reader :count
	@stack1 
	@stack2 

	def initialize
		@count = 0
		@stack1, @stack2 = [], []    
	end

	def enqueue(item)
		# add to the count
		@count += 1
		# always add to stack 1
		@stack1.push(item)
	end
	
	def dequeue
		# take the count down by 1
		@count -= 1
	    # if stack2 isn't empty, fill it
	   	reorder() unless @stack2.size > 0
		# pop from 2
		@stack2.pop()
	end

	def reorder
		until @stack1.empty? do
			# pop each element from the first stack
			# and push them onto the second
			@stack2.push(@stack1.pop())
		end 
	end
end

queue = Queue.new()


queue.enqueue("1")
queue.enqueue("2")
queue.enqueue("3")
queue.enqueue("4")
queue.enqueue("5")
queue.enqueue("6")
queue.enqueue("7")

3.times { puts queue.dequeue() }

queue.enqueue("8")
queue.enqueue("9")

2.times { puts queue.dequeue() }

queue.enqueue("10")
queue.enqueue("11")
queue.enqueue("12")
queue.enqueue("13")
queue.enqueue("14")

queue.count.times { puts queue.dequeue() }

