# class: string calculator
# methods: @add (string) -> returns (integer)

class StringCalculater

  def add(string)
    return 0 if string.empty?

    values = find_values string
    validate_and_filter values
    values.sum
  end

  def find_values(string)
    if string.start_with?('//')
      delimiter, numbers = string.split("\n", 2)
      delimiter = delimiter[2..]
      delimiter = delimiter[1..-2] if delimiter.start_with?('[') && delimiter.end_with?(']')
      numbers.split(delimiter)
    else
      string.split(/,|\n/)
    end
  end

  def validate_and_filter values
    negatives = []
    values.map!(&:to_i).select! do |n|
      if n.negative?
        negatives << n && false
      else
        n < 1000
      end
    end
    return if negatives.empty?

    raise "Negatives not allowed: #{negatives.join(', ')}"
  end
end
