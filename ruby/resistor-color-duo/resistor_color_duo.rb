=begin
Write your code for the 'Resistor Color Duo' exercise in this file. Make the tests in
`resistor_color_duo_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/resistor-color-duo` directory.
=end

#色の名前を入力として受け取り、入力が2色以上であっても2桁の数値を出力します。

class ResistorColorDuo
    #色の名前と出力する数値を紐づける
    COLORS = {
        "black" => 0,
        "brown" => 1,
        "red" => 2,
        "orange" => 3,
        "yellow" => 4,
        "green" => 5,
        "blue" => 6,
        "violet" => 7,
        "grey" => 8,
        "white" => 9,
        }


    def self.value(colors)
        first_two_colors = colors.take(2) #最初の2つの色を取得
        value_string = first_two_colors.map { |color| COLORS[color].to_s }.join #色の数値を文字列として結合する
        value_string.to_i #文字列を整数に変換して返す
    end
end

