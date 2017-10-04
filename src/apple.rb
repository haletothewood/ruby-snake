class Apple

attr_reader :x, :y, :snake

	def initialize(window, snake)
		@window = window
		@snake = snake
		@x = rand(10..630)
		@y = rand(50..470)
		while @x == snake.x && @y == snake.y do
			@x = rand(10..630)
			@y = rand(50..470)
		end
	end

	def draw
		@window.draw_quad(@x, @y,           Gosu::Color::RED,
                      @x, @y + 10,      Gosu::Color::RED,
                      @x + 10, @y,      Gosu::Color::RED,
                      @x + 10, @y + 10, Gosu::Color::RED
                     )
	end
end
