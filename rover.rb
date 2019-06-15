class Rover
	attr_accessor :orientation, :x, :y
	CARDINAL_DIRECTIONS = %i[north east south west].freeze
	MAX_ORIENTATION_VALUE = CARDINAL_DIRECTIONS.length - 1
	MIN_ORIENTATION_VALUE = 0

	def initialize
		@orientation = 0
		@x = 0
		@y = 0
	end

	def backward
		move(:backward)
	end

	def forward
		move(:forward)
	end

	def spin_left
		change_orientation(-1)
	end

	def spin_right
		change_orientation(1)
	end

	private

	def change_orientation(value)
		@orientation += value
		correct_orientation
		current_coordinates
	end

	def current_coordinates
		puts "I am currently at coordinates (#{@x}, #{@y}), facing #{current_direction.to_s} Commander"
	end

	def orientation_map
		{
			forward: {
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
			},
			backward: {
				north: {
					new_y: @y - 1,
					new_x: @x
				},
				south: {
					new_y: @y + 1,
					new_x: @x
				},
				east: {
					new_y: @y,
					new_x: @x - 1
				},
				west: {
					new_y: @y,
					new_x: @x + 1
				}
			}
		}
	end

	def correct_orientation
		@orientation = MIN_ORIENTATION_VALUE if @orientation > MAX_ORIENTATION_VALUE
		@orientation = MAX_ORIENTATION_VALUE if @orientation < MIN_ORIENTATION_VALUE
	end

	def current_direction
		CARDINAL_DIRECTIONS[@orientation]
	end

	def move(direction)
		map = orientation_map[direction][current_direction]
		@x = map[:new_x]
		@y = map[:new_y]

		current_coordinates
	end
end
