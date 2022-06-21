class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  
  def DICTIONARY
    array 
  end 

  def self.random_word
    DICTIONARY.sample
  end 

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end 
  
  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    newarray = []
    @secret_word.each_char.with_index do |char1, idx|
      if char == char1
        newarray << idx
      end 
    end
    newarray
  end 

  def fill_indices(char, idx_array)
    idx_array.each {|num| @guess_word[num] = char}
     @guess_word
  end 

  def try_guess(char)
     if self.get_matching_indices(char).empty?
      @remaining_incorrect_guesses -= 1
    else 
        self.fill_indices(char, self.get_matching_indices(char))
    end 

    if self.already_attempted?(char)
      p "that has already been attempted" 
      return false 
    else 
      @attempted_chars << char 
       return true 
    end 
  end 

  def ask_user_for_guess
    puts "Enter a char:"
    r = gets.chomp
    self.try_guess(r)
  end

  def win?
    if @guess_word.join("") == @secret_word
      p "WIN"
      return true 
    else 
      return false 
    end
  end 

  def lose?
    if @remaining_incorrect_guesses == 0 
      p "LOSE"
      return true 
    else
      return false
    end 
  end 

  def game_over?
    if self.win? || self.lose?
      p @secret_word
      return true
    else 
      return false 
    end 
  end 





end
