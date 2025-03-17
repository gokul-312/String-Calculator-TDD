# test for class: StringCalculator

require "minitest/autorun"
require "./string_calculator.rb"

class StringCalculatorTest < Minitest::Spec
  before do
    @string_calc = StringCalculater.new
  end

  def test_empty_string
    assert_equal 0, @string_calc.add("")
  end

  def test_split_comma
    assert_equal 5, @string_calc.add("2,3")
  end

  def test_split_comma_more_value
    assert_equal 10, @string_calc.add("1,2,3,4")
  end

  def test_split_lines
    assert_equal 6, @string_calc.add("1\n2,3")
  end

  def test_dynamic_delimiter
    assert_equal 3, @string_calc.add("//;\n1;2")
  end

  def test_exception_for_negative
    assert_raises RuntimeError, "Negatives not allowed: -1" do
      @string_calc.add("-1,2")
    end
  end

  ## find_values
  def test_find_values_with_comma
    assert_equal %w[1 2 3], @string_calc.find_values("1,2,3")
  end

  def test_find_values_with_newline
    assert_equal %w[1 2 3], @string_calc.find_values("1\n2,3")
  end

  def test_find_values_with_custom_delimiter
    assert_equal %w[1 2], @string_calc.find_values("//;\n1;2")
  end

  ## raise_if_negative
  def test_raise_if_negative_with_no_negatives
    assert_nil @string_calc.raise_if_negative([1, 2, 3])
  end

  def test_raise_if_negative_with_negatives
    assert_raises RuntimeError, "Negatives not allowed: -1, -2" do
      @string_calc.raise_if_negative([-1, 2, -2])
    end
  end

  def test_raise_if_negative_with_all_negatives
    assert_raises RuntimeError, "Negatives not allowed: -1, -2, -3" do
      @string_calc.raise_if_negative([-1, -2, -3])
    end
  end
end