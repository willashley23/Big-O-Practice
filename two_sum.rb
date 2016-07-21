#O(n^2)
def bad_two_sum?(arr, num)
  arr.each_with_index do |num1, idx1|
    (idx1+1...arr.length).each do |idx2|
      return true if num1 + arr[idx2] == num
    end
  end
  false
end

#O(nlogn)
def okay_two_sum?(arr, num)
  arr.sort.each do |el|
    return true if arr.bsearch{|x| x == (num - el)}
  end
  false
end


#O(n)
def pair_sum?(arr, num)
  h = Hash.new(false)
  arr.each do |el|
    return true if h[num-el]
    h[el] = true
  end
  false
end
