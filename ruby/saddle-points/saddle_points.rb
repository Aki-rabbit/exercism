=begin
Write your code for the 'Saddle Points' exercise in this file. Make the tests in
`saddle_points_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/saddle-points` directory.
=end

#

#　計算を実行するクラス
class Grid

    def initialize(rows, columns)
        @rows = rows
        @columns = columns
    end

    # 適切な木を見つけるメソッド
    # @param input [Array<Array<Integer>>] 行列の入力
    # @return [Array<Integer>] 適切な木の座標の配列
    def saddle_points(input)
        saddle_points = []

        max_in_row = input.map { |row| row.max }
        min_in_column =input.transpose.map { |column| column.min}


        saddle_points
    end

end

# 情報を表示・保持するクラス
class Coordinates
    def initialize

    end

    def row
        @row = row
    end

    def column
        @column = column
    end

end