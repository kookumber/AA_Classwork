# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
def all_vowel_pairs(words)
    arr = []
    vowels = "aeiou"
    words.each_with_index do |word1, idx1|
        words.each_with_index do |word2, idx2|
            combo = ""
            if idx2 > idx1
                combo += [word1, word2].join(" ")
            end
            counter = 0
            vowels.each_char {|c| counter += 1 if combo.include?(c)}
            arr << combo if counter == 5
        end
    end
    arr
end

p all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]

# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
def composite?(num)
    (2...num).each {|i| return true if num % i == 0}
    return false
end
# p composite?(9)     # => true
# p composite?(13)    # => false


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
def find_bigrams(str, bigrams)
    arr = []
    bigrams.each {|ram| arr << ram if str.index(ram) != nil}
    arr
end
# p find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# p find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        return self.select {|k, v| k == v} if prc == nil
        return self.select {|k, v| prc.call(k, v)}
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    def substrings(length = nil)
        sub_arr = []
        self.each_char.with_index do |char1, idx1|
            self.each_char.with_index do |char2, idx2|
                if idx2 == idx1
                    sub_arr << self[idx1]
                elsif idx2 > idx1
                    sub_arr << self[idx1..idx2]
                end
            end
        end
        return sub_arr if length == nil
        sub_arr.select {|string| string.length == length}
    end
    
    
    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    def caesar_cipher(num)
        new_string = ""
        alphabet = ("a".."z").select {|c| c}
        self.each_char do |c|
            new_idx = (alphabet.index(c) + num) % 26
            new_string += alphabet[new_idx]
        end
        new_string 
    end
end
# p "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
# p "cats".substrings(2)  # => ["ca", "at", "ts"]

p "apple".caesar_cipher(1)    #=> "bqqmf"
p "bootcamp".caesar_cipher(2) #=> "dqqvecor"
p "zebra".caesar_cipher(4)    #=> "difve"