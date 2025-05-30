class SimpleCalculator 
  class UnsupportedOperation < StandardError ; end
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    unless ALLOWED_OPERATIONS.include?(operation)
      raise UnsupportedOperation.new ("例外を発生させる")
    end

    #数値じゃないと計算できない→無効な引数の型
    unless first_operand.is_a?(Numeric) && second_operand.is_a?(Numeric)
      raise ArgumentError, "例外を発生させる"
    end

    begin 
      result =
        case operation
        when '+'
          first_operand + second_operand
        when '/'
          first_operand / second_operand
        when '*'
          first_operand * second_operand
        else
          raise UnsupportedOperation, "例外を発生させる"
        end
      "#{first_operand} #{operation} #{second_operand} = #{result}"
      rescue ZeroDivisionError 
        "Division by zero is not allowed."
      end
  end
end
