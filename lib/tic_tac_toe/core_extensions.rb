class Array

  def any_empty?
    any? { |element| element.to_s.empty? }
  end

  def all_empty?
    all? { |element| element.to_s.empty? }
  end

  def all_same?
    all? { |element| element == self[0] }
  end
end
