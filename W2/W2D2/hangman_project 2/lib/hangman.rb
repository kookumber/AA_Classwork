class Hangman
    DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

    def self.random_word
      return DICTIONARY.sample
    end

    attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

    def initialize
      @secret_word = Hangman.random_word
      @guess_word = Array.new(@secret_word.length, "_")
      @attempted_chars = []
      @remaining_incorrect_guesses = 5
    end

    def already_attempted?(char)
      if attempted_chars.include?(char)
        true
      else
        false
      end
    end
    
    def get_matching_indices(char)
      matching_arr = []
      @secret_word.each_char.with_index {|c, i| matching_arr << i if c == char }
      return matching_arr
    end

    def fill_indices(char, arr)
      arr.each {|i| @guess_word[i] = char}
    end

    def try_guess(char)
      if get_matching_indices(char) == []
        @remaining_incorrect_guesses -= 1
      else
        fill_indices(char, get_matching_indices(char))
      end

      if self.already_attempted?(char)
        puts "that has already been attempted"
        return false
      else
        @attempted_chars << char
        return true
      end
    end

    def ask_user_for_guess
      puts "Enter a char:"
      input = gets.chomp
      try_guess(input)
    end

    def win?
      if @guess_word.join("") == @secret_word
        puts 'WIN'
        return true
      else
        return false
      end
    end

    def lose?
      if @remaining_incorrect_guesses == 0
        puts "LOSE"
        return true
      else
        return false
      end
    end

    def game_over?
      if win? == true || lose? == true
        puts @secret_word
        return true
      else
        return false
      end
    end
end
