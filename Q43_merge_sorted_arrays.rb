=begin
	
	Question 43: 

	In order to win the prize for most cookies sold, 
	my friend Alice and I are going to merge our Girl Scout Cookies orders and enter as one unit.

	Each order is represented by an "order id" (an integer).

	We have our lists of orders sorted numerically already, in arrays. 
	Write a function to merge our arrays of orders into one sorted array. 

=end

# the easy way...
#print (my_array + alices_array).sort


# O(n), just walking through the largest array
def merge_arrays(arr1, arr2)
    len = arr1.length + arr2.length
    newArr = Array.new()
    # keep walking over each array until we have a new array 
    # with the same size as both of our old arrays
    begin
    	# get each array's values
        arr1_val = arr1.at(0)
        arr2_val = arr2.at(0)
        # if the arrays are uneven, just pusn the values
        if arr1_val.nil? 
            newArr.push(arr2_val)
            arr2.slice!(0)
            next
        end
        if arr2_val.nil?
            newArr.push(arr1_val)
            arr1.slice!(0)
            next
        end
        # otherwise compare and select the lowest value, 
        # removing it from the array
   		if arr1_val <= arr2_val
            newArr.push(arr1_val)
            arr1.slice!(0)
        else
            newArr.push(arr2_val)
            arr2.slice!(0)
        end
    end until newArr.length == len

    newArr
end

my_array     = [3, 4, 6, 10, 15, 18]
alices_array = [1, 3, 5, 8, 12, 14, 19, 20, 21, 33, 34]

print merge_arrays(my_array, alices_array)

puts ""

my_array     = [3, 4, 6, 10, 11, 15]
alices_array = [1, 5, 8, 12, 14, 19]

print merge_arrays(my_array, alices_array)
