This is a simple string calculator implemented in Ruby using Test-Driven Development (TDD). It provides a method to add numbers in a string format, supporting custom delimiters. The calculator can decode a string and perform the addition.

## Language and Version

- **Language**: Ruby
- **Version**: 3.2.1 

## Libraries Used

This project uses the `minitest` library for unit tests. It relies solely on the Ruby Standard Library for its main functionality.

## Usage

The main class provided is `StringCalculator` with the following method:

- `add(string)`: Takes a string of numbers separated by delimiters and returns their sum. Supports custom delimiters and handles edge cases.

## Reference
1. https://osherove.com/tdd-kata-1/

## Example
Here is an example of how to use the `StringCalculator` class, as demonstrated in the unit tests:
```ruby
calculator = StringCalculator.new

# Example 1: Adding numbers with default delimiter (comma)
result = calculator.add("1,2,3")
puts result # Output: 6

# Example 2: Adding numbers with newline as delimiter
result = calculator.add("1\n2\n3")
puts result # Output: 6

# Example 3: Adding numbers with custom delimiter
result = calculator.add("//;\n1;2;3")
puts result # Output: 6

# Example 4: Handling negative numbers
begin
  result = calculator.add("1,-2,3")
rescue => e
  puts e.message # Output: "Negatives not allowed: -2"
end

# Example 5: Ignoring numbers larger than 1000
result = calculator.add("2,1001,3")
puts result # Output: 5

# Example 6: Adding numbers with dynamic delimiter of any length
result = calculator.add("//[***]\n1***2***3")
puts result # Output: 6

# Example 7: Adding numbers with multiple delimiters
result = calculator.add("//[*][%]\n1*2%3")
puts result # Output: 6

# Example 8: Adding numbers with multiple delimiters of any length
result = calculator.add("//[***][^^]\n1***2^^3")
puts result # Output: 6
```