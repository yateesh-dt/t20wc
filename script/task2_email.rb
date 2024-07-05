def valid_email?(email)
    if (email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
        true
    else
        false
    end
end

p valid_email?("yateesh@gmail.com")
p valid_email?("yaeesh")
p valid_email?("@gmail.com")
p valid_email?("yateesh@gmail")
p valid_email?("yateesh@outlook.com")