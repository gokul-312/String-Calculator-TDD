# class: string calculator
# methods: @add (string) -> returns (integer)

class StringCalculater

  def add(string)
    return 0 if string.empty?

    values = find_values string
    raise_if_negative values
    values.sum
  end

  def find_values(string)
    if string.start_with?('//')
      delimiter, numbers = string.split("\n", 2)
      delimiter = delimiter[2..]
      numbers.split(delimiter)
    else
      string.split(/,|\n/)
    end
  end

  def raise_if_negative(values)
    values.map!(&:to_i)
    negatives = values.select(&:negative?)
    return if negatives.empty?

    raise "Negatives not allowed: #{negatives.join(', ')}"
  end
end
