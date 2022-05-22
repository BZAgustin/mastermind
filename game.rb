require 'colorize'

class Game
  def initialize
    @colors = [' 1 '.black.on_red,
               ' 2 '.black.on_green,
               ' 3 '.black.on_blue,
               ' 4 '.black.on_light_red,
               ' 5 '.black.on_light_green,
               ' 6 '.black.on_light_blue]
  end

  def welcome
    puts "\n                  /// Welcome to Mastermind! ///".green
    puts "\n- In this game, you play as the Codebreaker. You have 12 tries to guess
    the secret code, which consists of a combination of 4 random colors
    chosen by the Codemaker. Bear in mind that duplicates are allowed.\n
- For each guess you make (if not correct) the Codemaker will give you feedback
  on how close or far your guess was.

    # If a color you guessed is present in the code, but not in the right place
    it will be represented with a '○'\n
    # Otherwise if a color is both present and in the right place, you will see
    a '●'

- You win if you guess the secret code in 12 tries or less!"
  end

  def player_continues?
    puts "\nPress any key to play, or 'q' to quit\n".yellow
    user_key = gets.chomp
    user_key != 'q'
  end

  def play(cmaker, cbreaker)
    welcome

    return unless player_continues?

    loop do
      cmaker.generate_code
      cbreaker.reset_lives

      while cbreaker.tries_left?
        cbreaker.set_guess

        return win if cmaker.guess_correct?(cbreaker)

        cmaker.update_feedback(cbreaker)

        puts "Guess: #{print_guess(cbreaker)} | Hint: #{cmaker.show_feedback} | CODE: #{cmaker.read_code}"
      end

      lose(cmaker)

      break unless play_again?
    end
  end

  def print_guess(cbreaker)
    colored_guess = []

    cbreaker.guess.each { |num| colored_guess.push(@colors[num - 1]) }

    "#{colored_guess[0]} #{colored_guess[1]} #{colored_guess[2]} #{colored_guess[3]}"
  end

  def win
    puts 'You broke the code!'
  end

  def lose(cmaker)
    puts "No more tries left! The code was #{cmaker.code.join('')}"
  end

  def play_again?
    puts 'Type any key if you\'d like to play again, or \'q\' to quit'
    user_key = gets.chomp
    user_key != 'q'
  end
end
