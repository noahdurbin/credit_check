class CreditCheck
    attr_reader: card_number, :limit
    
    def initialize (card_number, limit)
        @card_number = card_number
        @limit = limit
    end

    #make the array of strings into an array of 
    def nums
        card_number.split('').map(&:to_i)
    end

    #double all the even numbers
    def times_two 
        nums.map.with_index do |num,i| 
        if i.even? 
            num * 2
        else num
        end
    end

    #split the digits above ten and add them together
    def sum_digits_above_9
        times_two.map do |num|
            if num > 9
                split_num = num.to_s.chars.map {|num| num.to_i}
                split_num[0] + split_num[1]
            else num
            end
        end
    end

    #add total of all digits
    def sum_of_digits
        sum_digits_above_9.reduce(0) {|sum, num| sum + num}
    end

    #return as valid if the total is divisible by 10
    def is_valid?
        return true if sum_of_digits % 10 == 0
        false
    end
end

    # Output

    print luhn(card_number)

    ## If it is valid, print "The number [card number] is valid!"
    ## If it is invalid, print "The number [card number] is invalid!"