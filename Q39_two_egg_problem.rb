=begin
	
	Question 39:
	
	A building has 100 floors. One of the floors is the highest floor 
	an egg can be dropped from without breaking.

	If an egg is dropped from above that floor, it will break. 
	If it is dropped from that floor or below, it will be completely undamaged 
	and you can drop the egg again.

	Given two eggs, find the highest floor an egg can be dropped from without breaking, 
	with as few drops as possible.

=end


class EggDrop

    attr_reader :eggs_broken

	# randomize the floor
	def initialize(max_floors)
		@breakpoint = rand(1...max_floors)
		@floors = Array.new(max_floors) { |x| x > @breakpoint }
        @eggs_broken = 0
	end

	# drop the egg from a floor
	def is_broken?(floor)
		broken = @floors[floor]
		@eggs_broken += 1 if broken
		broken
	end

end

MAX_FLOORS = 100
MAX_EGGS = 2
# create a new egg
egg = EggDrop.new(MAX_FLOORS)

#approximate an even stepping, it's not a perfict triangular number, but it works.
floor = steps = Math.sqrt(MAX_FLOORS).round

#find the first broken egg by stepping large section
# so that we can continue using a binary search
until egg.eggs_broken == MAX_EGGS || floor > MAX_FLOORS
	puts "dropping from floor #{floor}"
	if egg.is_broken?(floor)
		puts "SPLAT!"
		# start back at the last safe landing
		floor = floor - steps
		# step only by 1 to find the last floor
		steps = 1
	end
	# steps up x number of floors
	floor += steps
end

# step down one floor to find the last safe floor
puts "Floor #{floor - steps} is as high as we can go"
