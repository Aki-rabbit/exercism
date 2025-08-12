class SumOfMultiples
    def initialize (*items)
        @items = items
    end

    #倍数セットから計算
    #重複を除外して、合計値を返す
    # @param  レベルとアイテムの基本値
    def to(level)
        calculated_points = calculate_points(level, @items)
        excluded_duplication = exclude_duplication(calculated_points)
        sum_up_points(excluded_duplication)
    end
  

    private

    #レベルの値以下の、基本値の倍数を計算
    # @param level, item [Integer] レベルとアイテムの基本値
    # @return [Array<Integer>] ポイントのリスト（結合済み）
    def calculate_points(level, items)
        calculated_points = []

        (1...level).each do |number|
            items.each do |item|
                if number % item == 0
                    calculated_points.push(number)
                end
            end
        end

        calculated_points
    end

    # @param [Array<Integer>] calculated_points ポイントのリスト
    # @return [Array<Integer>] 重複を除外した配列
    def exclude_duplication(calculated_points)
        calculated_points.uniq
    end

    # @param [Array<Integer>] 重複を除外した配列
    # @return [Integer] 合計値
    def sum_up_points(excluded_duplication)
        excluded_duplication.sum
    end
end

# test_input

