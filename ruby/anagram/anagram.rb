=begin
Write your code for the 'Anagram' exercise in this file. Make the tests in
`anagram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/anagram` directory.
=end

class Anagram
    def initialize(input_word)
        @target_word = input_word
        @sorted_word = sort_word(input_word)
    end

    def sort_word(input_word)
        # @param input_word [String] ソートしたい単語
        # @return [String] ソートされた単語
        input_word.downcase.chars.sort.join
    end
    
    def match(possible_anagrams)
        # @param possible_anagrams [Array<String>] アナグラムの候補リスト 
        # @return [Array<String>] アナグラムのリスト
        possible_anagrams.select do |word|
            is_anagram = sort_word(word) == @sorted_word
            not_same_word = @target_word.downcase != word.downcase

            is_anagram && not_same_word
        end
    end
end
