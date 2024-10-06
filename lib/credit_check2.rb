require 'pry'
class CreditCheck2
  def initialize(cardnum, limit)
    @card_number = cardnum
    @limit = limit
  end

  def luhn
    num_array = @card_number.split('')
    num_array = num_array.map(&:to_i)

    multiplied = multiply_every_other(num_array)

    final = final_array(multiplied)

    total = final.sum

    if (total % 10).zero?
      'valid credit card number'
    else
      'not a valid credit card number'
    end
  end

  def multiply_every_other(ray)
    multiplied = []
    ray.each_with_index do |num, index|
      if index.odd?
        multiplied << num
      else
        new_num = num * 2
        multiplied << new_num
      end
    end
    multiplied
  end

  def final_array(multiplied_array)
    multiplied_array.map do |num|
      if num >= 10
        num.to_s.split('').map(&:to_i).sum
      else
        num
      end
    end
  end
end

puts CreditCheck2.new('5541808923795240', 15_000).luhn
puts CreditCheck2.new('5541801923795240', 15_000).luhn
