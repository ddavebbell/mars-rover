class Rover
	attr_accessor :orientation, :x, :y

	def initialize
		@orientation = :north
		@x = 0
		@y = 0
	end

	def orientation_map
		{
			north: {
				new_y: @y + 1,
				new_x: @x
			},
			south: {
				new_y: @y - 1,
				new_x: @x
			},
			east: {
				new_y: @y,
				new_x: @x + 1
			},
			west: {
				new_y: @y,
				new_x: @x - 1
			}
		}
	end

	def forward
		map = orientation_map[@orientation]
		@x = map[:new_x]
		@y = map[:new_y]

		current_coordinates
	end

	def current_coordinates
		puts "I am currently at coordinates (#{@x}, #{@y}) Commander"
	end
end
