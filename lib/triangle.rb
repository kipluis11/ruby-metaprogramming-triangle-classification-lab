class Triangle
  # write code here
  attr_accessor :l, :r, :c 

  def initialize(l, r, c)
    @l = l
    @r = r
    @c = c 
  end

  def kind
    validate_triangle
    if l == r && r == c 
      :equilateral
    elsif l == r || r == c || l == c 
      :isosceles
    else 
      :scalene
    end
  end

  def validate_triangle
    real_triangle = [(l + r > c), (l + c > r), (r + c > l)]
    [l, r, c].each do |side|
      real_triangle << false if side <= 0
      raise TriangleError if real_triangle.include?(false)
    end
  end

  class TriangleError < StandardError
  end

end
