require './game'
require './codemaker'
require './codebreaker'

game = Game.new
maker = Codemaker.new
breaker = Codebreaker.new

game.welcome

game.play(maker, breaker)
