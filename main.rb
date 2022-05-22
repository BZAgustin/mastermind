# frozen_string_literal: true

require './game'
require './codemaker'
require './codebreaker'

game = Game.new
maker = Codemaker.new
breaker = Codebreaker.new

game.play(maker, breaker)
