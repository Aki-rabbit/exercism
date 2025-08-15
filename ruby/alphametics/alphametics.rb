class Alphametics
    # @param puzzle [String] 入力されたパズルの文字列
    # @return [Hash] 各文字に対応する数字のハッシュ
    def solve(puzzle)
        Equation.new(puzzle)

    end

    #　文字と数字の組み合わせを見つける
    def find_combinations

    end

end

class Word
    #　文字列を数値に変換
    def convert_to_number

    end

    #　文字列を計算式に変換
    def convert_to_equation

    end

end

# 数式を表すクラス
class Equation
    # 数式が有効か判断する
    def is_valid?

    end
end

#　文字と数字の対応を決定するクラス
class Assignment

    # 文字と数字の組み合わせが有効か判断する
    # 各文字に与えられた数字が重複していないか
    # 先頭の文字に0が割り当てられていないか
    def validation

    end
end