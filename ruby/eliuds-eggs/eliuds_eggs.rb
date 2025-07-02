=begin
Write your code for the 'Eliuds Eggs' exercise in this file. Make the tests in
`eliuds_eggs_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/eliuds-eggs` directory.
=end

#10進数で与えられた数値を２進数に変換
#２進数表現における1の数（卵の数）をカウント


class EliudsEggs
    def self.egg_count(displayed_number)
        binary_number = displayed_number.to_i.to_s(2) 

        count = 0
        binary_number.each_char do |char|
            if char == '1'
                count += 1 #2進数表現の各桁を確認し、1の数をカウント
            end
        end
        return count
    end
end
