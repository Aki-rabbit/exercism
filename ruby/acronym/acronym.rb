=begin
Write your code for the 'Acronym' exercise in this file. Make the tests in
`acronym_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/acronym` directory.
=end
class Acronym
    def self.abbreviate(phrase)
        cleaned_string = phrase.gsub('-', ' ').gsub(/[^a-zA-Z\s]/, '') #入力の正規化
        picked_up_words = cleaned_string.split.map { |word| word[0].upcase } #単語を分割し、各単語の最初の文字を大文字に変換
        picked_up_words.join #大文字の文字を結合してアクロニムを作成
    end
end