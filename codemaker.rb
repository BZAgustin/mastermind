require 'colorize'

class Codemaker
  attr_reader :code, :feedback
  @@COLORS = ['1'.magenta, '2'.light_blue, '3'.yellow, '4'.light_green, '5'.red, '6'.light_yellow]

  def initialize
    @code = []
    @feedback = []
  end

  def generate_code
    @code = []

    for i in 1..4 do
      rng = @@COLORS[Random.new.rand(0..5)]
      @code.push(rng)
    end
  end

  def print_code
    puts @code.join(' ')
  end
end
