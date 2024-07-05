class Array
    def custom_map(&block)
        result = []
        to_ary.each do |x|
        result.append(yield(x))
        end
        result
    end
end
p [1, 2, 3].custom_map { |x| x + 1 }
p [1, 2, 3].custom_map { |x| x * 2 }
p [1, 2, 3].custom_map { |x| x ** 2 }