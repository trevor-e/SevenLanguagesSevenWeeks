class BoggleBoard
	attr_accessor :board

	MAX_WORD_LENGTH = 6

	def initialize()
		@board = [
			['A', 'A', 'B', 'A', 'A', 'A'], 
			['A', 'A', 'O', 'A', 'A', 'A'], 
			['A', 'A', 'G', 'A', 'A', 'A'], 
			['A', 'A', 'G', 'A', 'A', 'A'], 
			['A', 'A', 'L', 'A', 'A', 'A'], 
			['A', 'A', 'E', 'A', 'A', 'A'], 
		]

		permutate_board
	end

	def permutate_board
		@board.each_with_index {|x, x_index| 
			x.each_with_index {|y, y_index|
				permutate x_index,y_index,1,y
			}
		}
	end

	def permutate(x, y, size, word)
		if size <= MAX_WORD_LENGTH then
			if x+1 < MAX_WORD_LENGTH then
				permutate(x+1, y, size+1, word+@board[x+1][y])
			end
			if x-1 >= 0 then
				permutate(x-1, y, size+1, word+@board[x-1][y])
			end
			if y+1 < MAX_WORD_LENGTH then
				permutate(x, y+1, size+1, word+@board[x][y+1])
			end
			if y-1 >= 0 then
				permutate(x, y-1, size+1, word+@board[x][y-1])
			end

			if word.eql? "BOGGLE" then
				puts word
			end
		end
	end

end

board = BoggleBoard.new