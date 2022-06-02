# frozen_string_literal: true

# welcome message and instructions
module Welcome
  def welcome
    <<-HEREDOC
    Welcome to Mastermind!

    - In this game you can play as the CODEBREAKER or the CODEMAKER

    - The Codebreaker's task is to guess the master code provided
      by the Codemaker

    - The master code consists of a 4-digit combination of numbers
      picked from 1 to 6 (Example: 3245)

    - With each guess (if not correct) the Codemaker will show hints
      about how close or far it was

    - As a Codemaker, you will need to provide the master code yourself
      and the computer will play as the Codebreaker

    - You win if you guess the master code in 12 tries or less as a Codebreaker,
      or if the computer fails to guess your code as a Codemaker

    Type '1' to play as the CODEBREAKER
    Type '2' to play as the CODEMAKER

    HEREDOC
  end
end
