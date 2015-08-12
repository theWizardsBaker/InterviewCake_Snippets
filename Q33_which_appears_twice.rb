=begin
	
	Question 33: Which appears twice

	I have an array where every number in the range 1...n
	appears once except for one number which appears twice.

	Write a function for finding the number that appears twice.

=end

# becasue we have a range, we know the elements are in order
def find_duplicate(arr)
    # compare the last and next elements until they match
    dupe = arr.inject do |last, nxt|
        # return the match
        return last if last == nxt
        # otherwise return the next elem
        nxt
    end
end

puts find_duplicate(%w( 1 2 2 3 4 5 6 7 7 8 9 10 11))
puts find_duplicate(%w( 1 2 3 4 5 6 7 8 9 10 11 11))