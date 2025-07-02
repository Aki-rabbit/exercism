=begin
Write your code for the 'Isogram' exercise in this file. Make the tests in
`isogram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/isogram` directory.
=end

class Isogram

    def self.isogram?(input)
        cleaned_alphabet = input.downcase.gsub(/[^a-z]/, '') #小文字に変換し、アルファベット以外の文字を削除
        cleaned_alphabet.chars.uniq.length == cleaned_alphabet.length #重複した文字を削除した文字数と全体の文字数を比較
    end
end
