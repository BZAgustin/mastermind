# frozen_string_literal: true

require 'colorize'

module Display
  def digit_colors(digit)
    { '1' => "\e[0;30;41m 1 \e[0m ",
      '2' => "\e[0;30;42m 2 \e[0m ",
      '3' => "\e[0;30;44m 3 \e[0m ",
      '4' => "\e[0;30;43m 4 \e[0m ",
      '5' => "\e[0;30;47m 5 \e[0m ",
      '6' => "\e[0;30;45m 6 \e[0m " }[digit]
  end

  def show_number(num)
    num.each { |digit| print digit_colors(digit) }
  end

  def show_feedback(right_numbers, exact_matches)
    feedback = []
    right_numbers.times { feedback.push('○') }
    exact_matches.times { feedback.unshift('●') }
    puts " | Hint: #{feedback.join(' ')}"
  end
end
