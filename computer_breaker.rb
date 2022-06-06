# frozen_string_literal: true

require './display'
require './game_logic'

# Codemaker mode
class ComputerBreaker
  attr_reader :numbers, :code, :guess, :right, :exact, :total_matches, :final_combinations

  include Display
  include GameLogic

  def initialize
    @numbers = %w[1 2 3 4 5 6].shuffle
    @guess = []
    @final_combinations = []
  end

  def computer_sequence
    computer_start

    computer_first_turn

    show_number(guess)
    return computer_game_over(code, guess) if solved?(code, guess)

    show_feedback(right, exact)

    computer_turn

    return computer_game_over(code, guess) if solved?(code, guess)

    computer_game_over(code, guess)
  end

  def computer_start
    @code = set_code
    puts "\nThe master code has been set. The codebreaker has 12 tries to guess it!\n"
  end

  def computer_first_turn
    think

    print 'Turn N° 1: '

    4.times { guess.push(numbers[0]) }

    numbers.delete_at(0)

    compare(guess, code)

    computer_game_over(code, guess) if solved?(code, guess)
  end

  def computer_turn
    turn = 2
    while turn <= 12
      think

      print "\nTurn N° #{turn}: "
      update_guess(code, guess) if total_matches < 4

      set_final_combinations if total_matches == 4 && final_combinations == []

      select_combination if total_matches == 4 && final_combinations != []

      turn += 1

      show_number(guess)
      break if solved?(code, guess)

      reduce_combinations if right == 4

      turn_end
    end
  end

  def update_guess(master_code, computer_guess)
    compare(master_code, computer_guess)
    guess.each_index do |index|
      guess[index] = numbers[0] unless (index + 1) <= total_matches
    end
    numbers.delete_at(0)
  end

  def select_combination
    selection = final_combinations.sample
    final_combinations.delete(selection)
    @guess = selection
  end

  def set_final_combinations
    temp_guess = guess.map(&:to_i)
    combinations = temp_guess.permutation.to_a
    combinations.map! { |arr| arr.map!(&:to_s) }
    @final_combinations = combinations
  end

  def reduce_combinations
    guess.each_with_index do |num, guess_index|
      final_combinations.reject! { |arr| arr[guess_index] == num }
    end
  end

  def set_code
    puts 'Enter a 4-digit master code for the Codebreaker to guess (digits 1 to 6 only)'
    user_input = gets.chomp.split(//)
    return user_input if valid?(user_input)

    puts 'Invalid input (Must be 4 digits).'
    set_code
  end

  def computer_game_over(master_code, computer_guess)
    sleep(0.5)

    if solved?(master_code, computer_guess)
      puts "\nGame over! The Codebreaker guessed the master code."
    else
      puts "\nYou win! The Codebreaker failed to guess the master code."
    end

    play_again
  end

  def think
    print "\n"
    print 'Hmm'
    3.times do
      sleep(0.5)
      print '.'
    end
    sleep(0.5)
    print "\n"
  end

  def turn_end
    compare(code, guess)
    show_feedback(right, exact)
  end
end
