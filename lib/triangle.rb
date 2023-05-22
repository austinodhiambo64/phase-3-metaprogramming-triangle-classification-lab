class Triangle
  # write code here
  def initialize(a, b, c)
    validate_triangle(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    if @a == @b && @b == @c
      :equilateral
    elsif @a == @b || @b == @c || @a == @c
      :isosceles
    else
      :scalene
    end
  end


  class TriangleError < StandardError
    def message
      "Invalid triangle. Please check the side lengths."
    end
  end

  private

  def validate_triangle(a, b, c)
    sides = [a, b, c]
    if sides.any? { |side| side <= 0 } || (a + b <= c) || (a + c <= b) || (b + c <= a)
      raise TriangleError
    end
  end
end
