require 'colorize'

class Codebreaker
  attr_reader :guess, :lives

  def initialize
    @guess = []
    @lives = 12
  end

  def ask_guess
    puts "\nEnter your guess below (#{@lives} tries left):"
    @guess = gets.chomp.split('')
    @guess
  end

  def guess_valid?(input)
    input.each do |item|
      return false if item.to_i < 1 || item.to_i > 6 ||
                      item.nil? || input.length < 4 ||
                      input.length > 4
    end
    true
  end

  def set_guess
    puts 'Invalid input, try again! (Must be 4 digits)' until guess_valid?(ask_guess)

    @guess = @guess.map(&:to_i)

    substract_try
  end

  def read_guess
    @guess
  end

  def substract_try
    @lives -= 1
  end

  def tries_left?
    @lives.positive?
  end
end
