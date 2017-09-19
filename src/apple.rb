class Apple

attr_reader :x, :y

	def initialize(window)
		@window = window         # to tell the program the window in which the apple is being placed
		@x = rand(10..630)
		@y = rand(50..470)    # 50 so it doesn't overlap the score
	end

	def draw
		@window.draw_quad(@x, @y,           Gosu::Color::RED, 
                      @x, @y + 10,      Gosu::Color::RED,
                      @x + 10, @y,      Gosu::Color::RED,
                      @x + 10, @y + 10, Gosu::Color::RED
                     )
	end
end
