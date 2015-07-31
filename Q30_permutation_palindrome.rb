=begin

Question 30:

Write an efficient function that checks whether any permutation 
of an input string is a palindrome.

Examples:

    "civic" should return True
    "ivicc" should return True
    "civil" should return False
    "livci" should return False

=end

# first thought
# .index might me less than optimal. not sure what overhead it incurs 

def is_palindrome(string)
	# remove case
	string.downcase!
    # remove whitespace
    string.gsub!(/\s/, '')
	# keep a count of all the non-duplicated characters
	character_count = []
	# find easy ones
	return true if string.reverse == string

	string.each_char do |chr|
	    position = character_count.index(chr)
	    if position
	    	# if the character already exists, it's been accounted for
	        character_count.delete_at(position)
	    else
	    	# if the character doesn't exit, add it
	    	character_count << chr
	    end
	end
	#allow one character to not be repeated as it could be the center letter
	print character_count.size <= 1
end

puts is_palindrome "civic"
puts is_palindrome "ivicc"
puts is_palindrome "civil"
puts is_palindrome "livci"


# second thought
# not sure if this is more efficient than above.
def is_still_palindrome(string)
	# remove case
	string.downcase!
    # remove whitespace
    string.gsub!(/\s/, '')
	# find easy ones
	return true if string.reverse == string
	# create a hash of each of the letters, set all to 0
	character_count = Hash[string.split('').map{|chr| [chr, 0]}]
    # count each occurance of a letter
	string.each_char { |chr| character_count[chr] += 1 }
    # count the odd values
    odd = character_count.values.count { |cnt| cnt.odd? }
    #if there is more than 1 odd value, we know it can't be a palindrome...
    odd <= 1
end

puts is_still_palindrome "civic"
puts is_still_palindrome "ivicc"
puts is_still_palindrome "civil"
puts is_still_palindrome "livci"