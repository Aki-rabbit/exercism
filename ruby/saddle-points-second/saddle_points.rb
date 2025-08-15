class Grid
    class << self
        # 適切な木を見つけるメソッド
        # @param input [Array<Array<Integer>>] 行列の入力
        # @return [Array<Hash>] 適切な木の座標のハッシュの配列
        def saddle_points(input)
            max_in_row = input.map(&:max)
            min_in_column = input.transpose.map(&:min)

            collect_saddle_points(input, max_in_row, min_in_column)
        end

        private

        # 行の最大値と列の最小値を取得→ハッシュの配列として返す
        def collect_saddle_points(input, max_in_row, min_in_column)
            output_coords = []
            
            input.each_with_index do |row, row_index|
                match_min_max(row, row_index, max_in_row, min_in_column, output_coords)
            end

            output_coords
        end

        def match_min_max(row, row_index, max_in_row, min_in_column, output_coords)
            row.each_with_index do |value, column_index|
                is_row_max = (value == max_in_row[row_index])
                is_column_min = (value == min_in_column[column_index])

                if is_row_max && is_column_min
                    output_coords << { "row" => row_index + 1, "column" => column_index + 1 }
                end
            end
        end
    end
end
