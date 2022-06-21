class GuessingGame
    def initialize(min, max)
        @min = min
        @max = max 
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false 
    end 

    def num_attempts
        @num_attempts
    end 

    def game_over?
        @game_over
    end 

    def check_num(num)
        if num == @secret_num  
             @num_attempts += 1
             @game_over = true 
             p "you win"
        elsif num > @secret_num
           p "too big"
            @num_attempts += 1
        elsif num < @secret_num
           p "too small"
            @num_attempts += 1
        end 
    end 

    def ask_user
            print "enter a number"
            response = gets.chomp.to_i 
            check_num(response)
    end 
end

