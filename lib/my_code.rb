def map (original_array)
  new_array = []
  original_array.length.times do |index|
    new_array[index] = yield (original_array[index])
  end
  new_array
end

def reduce (original_array, starting_point = 0)
  total = 0
  original_array.length.times do |index|
      # check for integer
    if original_array[index].is_a? Integer
      total=total+(original_array[index])
    else 
      all_false = false
      all_true = true
      original_array.length.times do |index|
        if original_array[index] == false
          all_true = false
        else
          all_false = true
        end
      end
      # reduce to true/false
      conclusion = yield(all_false, all_true)
      return conclusion
    end
  end
    # reduce to value
    conclusion = yield(total, starting_point)
    conclusion
end
