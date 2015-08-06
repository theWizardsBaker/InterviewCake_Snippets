=begin
	
	Question: 32

	You rank players in the game from highest to lowest score. 
	So far you're using an algorithm that sorts in O(nlgn)O(n\lg{n})O(nlgn) time, 
	but players are complaining that their rankings aren't updated fast enough. 
	You need a faster sorting algorithm.

	Write a function that takes:

	    1) a list of unsorted_scores
	    2) the highest_possible_score in the game

	and returns a sorted list of scores in less than O(nlgn)O(n\lg{n})O(nlgn) time. 

=end

# count sort is O(n), so lets try that...
def sort(unsorted, highest)
	# create a hash for each unsorted score
    scores_occurances = {}
    # result array
    sorted_scores = []
    # walk over the unsorted array and add 1 to our hash for each occurance
    unsorted.each do |score| 
    	if(scores_occurances.has_key?(score))
	    	scores_occurances[score] += 1
	    else
	    	scores_occurances[score] = 1 
	    end
    end

    (1..highest).each do |int|
     	if(scores_occurances.has_key?(int))
            scores_occurances[int].times { sorted_scores.push(int) }
        end
    end
    
    sorted_scores
end

high_score = 20

unsorted_scores = []
high_score.times { unsorted_scores.push(rand(high_score)) }

print unsorted_scores
puts " "
print sort(unsorted_scores, high_score)