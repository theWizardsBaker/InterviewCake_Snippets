=begin
	Question 15:

	Write a function fib() that a takes an integer n
	and returns the nth fibonacci number.
=end

# This is the first solution that came to mind. it's O(n), so that satisfies the requirement.
# I'm sure there's a more efficient way to do it....

def fib (iter)
	# start with 0 and 1
	a, b, c = 0, 1, 0
	# walk iterator to calulate fibonacci 
	iter.times do
		c = a + b
		b = a
		a = c
	end
	c
end

# find the 9th fib num
puts fib 9