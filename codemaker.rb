require 'colorize'

class Codemaker
  attr_reader :code, :feedback

  def initialize
    @code = []
    @feedback = []
  end

  def generate_code
    @code = []

    4.times do
      rng = Random.new.rand(1..6)
      @code.push(rng)
    end
  end

  def guess_correct?(cbreaker)
    cbreaker.guess == @code
  end

  def any_match?(cbreaker)
    cbreaker.guess.each do |num|
      next unless @code.any?(num)

      return true
    end
    false
  end

  def update_feedback(cbreaker)
    @feedback = []

    cbreaker.guess.each_with_index do |num, index|
      if @code.any?(num)
        if @code[index] == num
          @feedback.unshift('●')
        else
          @feedback.push('○')
        end
      end
    end
  end

  def show_feedback
    puts "Feedback: <#{@feedback.join(' ')}>"
  end
end
