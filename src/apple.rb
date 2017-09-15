class Apple

attr_reader :xpos, :ypos

	def initialize(window)
		@window = window         # to tell the program the window in which the apple is being placed
		@xpos = rand(10..630)
		@ypos = rand(50..470)    # 50 so it doesn't overlap the score
	end

	def draw
		@window.draw_quad(@xpos, @ypos,           Gosu::Color::RED, 
                      @xpos, @ypos + 10,      Gosu::Color::RED,
                      @xpos + 10, @ypos,      Gosu::Color::RED,
                      @xpos + 10, @ypos + 10, Gosu::Color::RED
                     )
	end
end
