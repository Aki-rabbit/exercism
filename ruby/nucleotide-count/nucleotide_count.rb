# 入力を受け取る
# DNA文字列を引数として受け取り、各ヌクレオチドの数を出力する
# 無効な場合にエラーを出力する

class Nucleotide
    # 無効な場合にエラーを出力する
    class << self
        def from_dna(input)
            raise ArgumentError, 'error' unless input.match?(/\A[ATCG]*\z/)
            new(input)
        end
    end

    #　インスタンスの初期状態を正しく設定する
    def initialize(input)
        @input = input
    end

    # @inputに含まれるすべてのヌクレオチドの数を返す
    # @param input [String] DNA文字列
    # @return [Hash] ヌクレオチドの種類とその数を含むハッシュ
    def histogram
        nucleotides_count = { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0 }
        nucleotides_count.keys.each do |nucleotide_key|
            nucleotides_count[nucleotide_key] = self.count(nucleotide_key)
        end

        nucleotides_count
    end

    #　与えられた一種類のヌクレオチドの数を返す
    # @param nucleotide_kind [String] ヌクレオチドの種類 ('A', 'T', 'C', 'G')
    # @return [Integer] ヌクレオチドの数
    def count(nucleotide_kind)
        @input.count(nucleotide_kind)
    end

end
