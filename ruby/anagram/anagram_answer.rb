def initialize(original_word)
  @original_word = original_word
  @sorted_word = sort_word(original_word)
end

def match(inputs)
  Inputs.map { |input| match?(input) }
end

private

def sort_word(word)
    word.downcase.chars.sort.join
end

def match?(input)
  is_anagram = sort_word_input == @sorted_word
  is_not_same = Input ≠ @original_word
  
  is_anagram && is_not_same
end