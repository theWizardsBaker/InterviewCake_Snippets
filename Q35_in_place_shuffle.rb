=begin
	Question 35:

	Write a function for doing an in-place shuffle of an array.
	The shuffle must be "uniform," meaning each item in the original array 
	must have the same probability of ending up in each spot in the final array.
=end

# print ['a', 'b', 'c', 'd', 'e', 'f'].shuffle!
# just kidding...

def shuffle(arr)
    arr.each_with_index do |item, pos|
        new_pos = rand(0...arr.size)
        arr[pos] = arr[new_pos]
        arr[new_pos] = item
    end
    return arr
end

print shuffle(%w(a b c d e f g h))