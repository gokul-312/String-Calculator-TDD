require 'minitest/autorun'
require './string_calculator.rb'

class StringCalculatorTest < Minitest::Spec
  before do
    @string_calc = StringCalculater.new
  end

  def test_empty_string
    assert_equal 0, @string_calc.add('')
  end
end