require './game'
require './codemaker'

game = Game.new
maker = Codemaker.new

game.welcome

maker.generate_code

maker.print_code