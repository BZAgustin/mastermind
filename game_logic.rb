# frozen_string_literal: true

module GameLogic
  def compare(code, guess)
    temp_code = code.clone
    temp_guess = guess.clone
    @right = right_numbers(temp_code, temp_guess)
    @exact = exact_matches(temp_code, temp_guess)
    @total_matches = right + exact
  end

  def right_numbers(code, guess)
    count = 0

    guess.each_with_index do |num, index|
      next unless !num.nil? && code.include?(num) && code[index] != num

      remove_index = code.index(num)

      next if code[remove_index] == guess[remove_index]

      count += 1
      guess[index] = nil
      code[remove_index] = nil
    end
    count
  end

  def exact_matches(code, guess)
    count = 0

    guess.each_with_index do |num, index|
      next unless !num.nil? && guess[index] == code[index]

      count += 1
      guess[index] = nil
      code[index] = nil
    end
    count
  end

  def solved?(code, guess)
    code == guess
  end

  def play_again
    puts "\nDo you want to play again? (Press Y to play, or any other key to quit)"
    again = gets.chomp
    puts 'See ya!' if again.downcase != 'y'
    Game.new.play if again.downcase == 'y'
  end
end
