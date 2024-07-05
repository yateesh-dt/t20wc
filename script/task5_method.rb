def max_number(num1, num2, num3, num4)
    max_value = num1 > num2 ? 
        (num1 > num3 ? (num1 > num4 ? num1 : num4) : (num3> num4 ? num3 : num4)) : 
        (num2 > num3 ? (num2 > num4 ? num2 : num4) : (num3 >num4 ? num3 : num4))
    max_value
end

def max_number_using_ifelse(num1, num2, num3, num4)
    if(num1 > num2)
        if(num1 > num3)
            if(num1 > num4)
                result = num1
            else 
                result = num4
            end
        else
            if(num3 > num4)
                result = num3
            else
                result = num4 
            end 
        end
    else 
        if(num2 > num3) 
            if(num2 > num4)
                result = num2 
            else 
                result = num4 
            end 
        else 
            if(num3 > num4) 
                result = num3
            else 
                result = num4
            end 
        end 
    end
    result 
end

puts max_number_using_ifelse(1, 2, 3, 4)
puts max_number(4, 2, 3, 1)