class Luhn
    def self.valid?(input_string)
        return false if input_string.nil? || input_string.empty?
        return false if input_string.match?(/[^\d\s]/)

        cleaned_digits = input_string.gsub(/\s/, '')

        return false if cleaned_digits.length <= 1

        sum_of_digits = self.calculate_sum(cleaned_digits)

        self.is_valid_checksum?(sum_of_digits)
    end

    def self.calculate_sum(cleaned_string)
        sum = 0
        len = cleaned_string.length

        cleaned_string.chars.each_with_index do |char, index|
            digit = char.to_i

            # 末尾からの位置を計算
            position_from_end = len - index

            # 末尾からの位置が偶数であれば対象の数字
            if position_from_end.even? 
                doubled_digit = digit * 2
                sum += self.apply_luhn_doubling_rule(doubled_digit)
            else # 末尾からの位置が奇数であればそのまま加算
                sum += digit
            end
        end
        sum
    end

    def self.apply_luhn_doubling_rule(number)
        if number > 9
            number - 9
        else
            number
        end
    end

    def self.is_valid_checksum?(sum)
        sum % 10 == 0
    end
end