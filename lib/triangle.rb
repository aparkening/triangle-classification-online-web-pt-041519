require 'pry'
class Triangle
  attr_reader :s1, :s2, :s3

  def initialize(s1, s2, s3)
    @s1 = s1
    @s2 = s2
    @s3 = s3
  end

  # Return type of triange as symbol
  def kind
    
    # If triangle is valid, determine type. Valid if:
      # Every side > 0
      # The sum of any 2 lengths exceed 3rd length
    if (s1 > 0 && s2 > 0 && s3 > 0) && ((s1 + s2) > s3 && (s1 + s3) > s2 && (s2 + s3) > s1 ) 
      # Equilateral if all sides equal
      if s1 == s2 && s2 == s3
        return :equilateral

      # Isosceles if two sides equal
      elsif s1 == s2 || s2 == s3 || s3 == s1
        return :isosceles

      # Scalene if no sides are equal, but don't need to test
        # elsif s1 != s2 && s2 != s3 && s3 != s1
      else
        return :scalene
      end
    # Else raise error
    else
      begin
        raise TriangleError
      end
    end
  end

  # Display custom error for triangles
  class TriangleError < StandardError
    def message 
      "you must supply valid sides for your triangle. Ensure sides are larger than 0 and that the sum of two sides are larger than the third side."
    end
  end

end