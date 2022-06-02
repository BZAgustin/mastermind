# frozen_string_literal: true

require './display'
require './game_logic'

# codebreaker mode
class HumanBreaker
  attr_reader :code, :guess, :right, :exact

  include Display
  include GameLogic

  def initialize
    random_digits = [Random.new.rand(1..6), Random.new.rand(1..6), Random.new.rand(1..6), Random.new.rand(1..6)]
    @code = random_digits.map(&:to_s)
  end

  def turn_sequence
    puts 'A master code has been generated. You have 12 tries to break it, good luck!'
    player_turn
    player_game_over(code, guess)
  end

  def player_turn
    turn = 1
    while turn <= 12
      puts 'Enter your guess (Must be a 4-digit number):'
      @guess = set_guess
      turn += 1

      break if guess[0].downcase == 'q'

      show_number(guess)
      break if solved?(code, guess)

      end_turn
    end
  end

  def set_guess
    guess = gets.chomp.split('')
    return guess if guess_valid?(guess)

    puts 'Invalid input. Try again!'
    set_guess
  end

  def guess_valid?(input)
    input.each do |item|
      return false if item.to_i < 1 || item.to_i > 6 ||
                      item.nil? || input.length < 4 ||
                      input.length > 4
    end
    true
  end

  def end_turn
    compare(code, guess)
    show_feedback(right, exact)
  end

  def player_game_over(maker_code, my_guess)
    if solved?(maker_code, my_guess)
      puts "\nCongratulations, you broke the code!"
    else
      print "\nGame over! You have no more tries left. The code was "
      show_number(code)
    end
    play_again
  end
end
