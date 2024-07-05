def sorting_by_length(hash)
    sorted_array = hash.sort_by { |key, value| key.to_s.length }.flatten
    sorted_hash = Hash[*sorted_array]
    puts sorted_hash 
end

hash = {"a":1, "abc":2, "ab":3}
sorting_by_length(hash)