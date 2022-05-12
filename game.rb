require 'colorize'

class Game

  def initialize; end

  def welcome
    puts "\n\n/// Welcome to Mastermind! ///".green
    puts "\n- In this game, you play as the Codebreaker. You have 12 tries to guess
    the secret code, which consists of a combination of 4 random colors
    chosen by the Codemaker. Bear in mind that duplicates are allowed.\n
- For each guess you make (if not correct) the Codemaker will give you feedback
  on how close or far your guess was.
  
    # If a color you guessed is present in the code, but not in the right place
    it will be represented with a '○'\n
    # Otherwise if a color is both correct and in the right place, you will see
    a '●'
  
- You win if you guess the secret code in 12 tries or less!"
  end

  def player_start?()
    puts "\nPress any key to play, or 'q' to quit\n\n".yellow
    user_key = gets.chomp
    user_key != 'q'
  end

end