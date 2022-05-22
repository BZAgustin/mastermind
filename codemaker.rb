# frozen_string_literal: true

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

  def read_code
    @code
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
    temp_code = Marshal.load(Marshal.dump(read_code))

    cbreaker.guess.each_with_index do |num, index|
      if temp_code.any?(num)
        if temp_code[index] == num
          @feedback.unshift('●')
          temp_code[index] = nil
        else
          next if temp_code[index + 1..].any?(num)

          @feedback.push('○')
          temp_code[temp_code.index(num)] = nil
        end
      end
    end
  end

  def show_feedback
    @feedback.join(' ')
  end
end
