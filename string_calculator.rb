# class: string calculator
# methods: @add (string) -> returns (integer)

class StringCalculater

  def add(string)
    return 0 if string.empty?

    values = find_values(string)
    validate_and_filter(values)
    values.sum
  end

  def find_values(string)
    if string.start_with?('//')
      delimiter, numbers = string.split("\n", 2)
      delimiter = decode_delimiters(delimiter[2..])
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
  
  def decode_delimiters(string)
    return string unless string.start_with?('[') && string.end_with?(']')

    return string[1..-2] unless string.index('][')

    Regexp.union(string[1..-2].split(']['))
  end
end
