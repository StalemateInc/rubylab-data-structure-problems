class ArrayRotator

  attr_accessor :array
  def initialize(array)
    @array = array.clone
  end

  def rotate(k_times)
    k = k_times.to_i
    return @array if @array.empty?
    if k.positive?
      first = k % @array.length
      @array = @array.slice!(-first, @array.length).concat(@array)
    else
      raise ArgumentError, 'Zero or negative argument given, positive k expected.'
    end
  end

end

test_array = [1, 2, 3, 4, 5, 6, 7]
rotator = ArrayRotator.new(test_array)
puts "Initial array: #{rotator.array}"
rotator.rotate(10)
puts "Resultant array: #{rotator.array}"

# or we could just use an Array#rotate method
# but I guess this is not a "use-a-method" task
