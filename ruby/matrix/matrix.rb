=begin
Write your code for the 'Matrix' exercise in this file. Make the tests in
`matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/matrix` directory.
=end

#改行を含む文字列が与えられる
#各行を左から右に、そして行を上から下へ読み進めた行のリスト
#各列を上から下へ、そして列を左から右へ読み進めた列のリスト

class Matrix
    INDEX_ADJUSTMENT = 1 #インデックス調整のための定数

    private_constant :INDEX_ADJUSTMENT

    def initialize(input_string)
        @row = RearrangeStrings.make_row(input_string) 
        @column = RearrangeStrings.make_column(@row) 
    end

    class RearrangeStrings
        private_class_method :new
        
        def self.make_row(input_string)
            input_string.split("\n").map do |row_str|
                row_str.split(' ').map(&:to_i)
            end
        end

        def self.make_column(rows_data)
            rows_data.transpose.map do |column|
                column.map(&:to_i)
            end
        end
    end

    def row(index)
        @row[index - INDEX_ADJUSTMENT]
    end

    def column(index)
        @column[index - INDEX_ADJUSTMENT]
    end
end