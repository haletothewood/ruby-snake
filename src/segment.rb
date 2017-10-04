class Segment

	attr_reader :x, :y, :position
	attr_writer :x, :y

	def initialize(snake, window, position)
		@window = window
		@x = position[0]
		@y = position[1]
	end

	def draw
		@window.draw_quad(@x, @y,           Gosu::Color::GREEN,
                      @x + 10, @y,      Gosu::Color::GREEN,
                      @x, @y + 10,      Gosu::Color::GREEN,
                      @x + 10, @y + 10, Gosu::Color::GREEN
                     )
	end

end
