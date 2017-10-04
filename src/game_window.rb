require_relative 'snake'
require_relative 'segment'
require_relative 'apple'

require 'gosu'

class GameWindow < Gosu::Window

  # what does a game of snake always have?
	def initialize
		super 640, 480
		self.caption = "🐍"
		@snake = Snake.new(self)
		@apple = Apple.new(self, @snake)
		@score = 0
		@text_object = Gosu::Font.new(self, 'Ubuntu Sans', 32)
	end

	def update

		# Change directions, but don't allow doubling back
		if (button_down? Gosu::KbLeft) && (@snake.direction != "right")
			@snake.direction = "left"
		end

		if (button_down? Gosu::KbRight) && @snake.direction != "left"
			@snake.direction = "right"
		end

		if (button_down? Gosu::KbUp) && @snake.direction != "down"
			@snake.direction = "up"
		end

		if (button_down? Gosu::KbDown) && @snake.direction != "up"
			@snake.direction = "down"
		end

		if button_down? Gosu::KbEscape
			self.close
		end

		if @snake.ate_apple?(@apple)

			@apple = Apple.new(self, @snake) # generates a new apple
			@score += 10               # add 10 points to the score
 			@snake.length += 10        # increase the snake's length

 			# 11 because we subtract one at the end of the method anyway
 			@snake.ticker += 11
			if @score % 100 == 0 # increase speed each time score increases by 100
				@snake.speed += 1.5
			end
    end

		if @snake.hit_self?
			@new_game = Gosu::Font.new(self, 'Ubuntu Sans', 32)
		end

		if @snake.outside_bounds?
			@new_game = Gosu::Font.new(self, 'Ubuntu Sans', 32)
		end

		if @new_game && (button_down? Gosu::KbReturn)
			@new_game = nil
			@score = 0
			@snake = Snake.new(self)
			@apple = Apple.new(self, @snake)
		end

		@snake.ticker -= 1 if @snake.ticker > 0
	end

	def draw

		if @new_game
			@new_game.draw("Your Score was #{@score}", 5, 200, 100)
			@new_game.draw("Press Return to Try Again", 5, 250, 100)
			@new_game.draw("Or Escape to Close", 5, 300, 100)
		else
			@snake.update_position
			@snake.draw
			@apple.draw
			@text_object.draw("Score: #{@score}",5,5,0)
		end

	end
end
