# frozen_string_literal: true

require './welcome'
require './human_breaker'

# holds the main methods to play the game
class Game
  include Welcome

  def play
    puts welcome
    mode = mode_selection
    select_breaker if mode == '1'
    select_maker if mode == '2'
  end

  def mode_selection
    user_input = gets.chomp
    return user_input if valid_mode?(user_input)

    puts "Invalid choice.\nType '1' to play as the Codebreaker\nType '2' to play as the Codemaker"
    mode_selection
  end

  def valid_mode?(selection)
    %w[1 2].include?(selection)
  end

  def select_breaker
    breaker = HumanBreaker.new
    breaker.turn_sequence
  end

  def select_maker; end
end
