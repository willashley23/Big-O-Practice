class Array
  def my_min
    each do |num1|
      all_greater = true
      each do |num2|
        all_greater = false if num1 > num2
      end
      return num1 if all_greater
    end
  end

  def my_min2
    min = nil
    each do |num|
      min = num if min.nil? || num < min
    end
    min
  end

  def largest_contiguous_subset
    largest_sum = nil
    length.times do |idx1|
      (idx1...length).each do |idx2|
        sum = self[idx1..idx2].inject(:+)
        largest_sum = sum if largest_sum.nil? || sum > largest_sum
      end
    end
    largest_sum
  end

  def largest_contiguous_subset2
    largest = 0
    sum = 0
    each do |num|
      sum += num
      largest = sum if  sum > largest
      sum = 0 if sum < 0
    end
    largest
  end
end

arr = (-10..500).to_a.shuffle

p "Testing first"
start = Time.now
p [1,2,-4,2,5,-3,-7,-10,4].largest_contiguous_subset

p "Slow Working one"
start = Time.now
p arr.to_a.largest_contiguous_subset
total = Time.now - start
p total

p "Fast new one"
start = Time.now
p arr.to_a.largest_contiguous_subset2
total = Time.now - start
p total
