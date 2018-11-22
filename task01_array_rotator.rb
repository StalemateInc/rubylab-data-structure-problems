class ArrayRotator

  attr_reader :array
  def initialize(array)
    @array = array
  end

  def rotate(k_times)
    k = k_times.to_i
    if k.positive?
      first = k % @array.length
      @array = @array.slice!(first, @array.length-1).concat(@array)
    else
      raise ArgumentError, 'Zero or negative argument given, positive k expected.'
    end
  end

end

test_array = [1, 2, 3, 4, 5, 6, 7, 8]
rotator = ArrayRotator.new(test_array)
puts "Initial array: #{rotator.array}"
rotator.rotate(12)
puts "Resultant array: #{rotator.array}"
