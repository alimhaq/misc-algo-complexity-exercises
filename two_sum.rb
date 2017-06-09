def bad_two_sum?(arr, target_sum)
  (0...arr.length - 1).each do |i|
    (i + 1...arr.length).each do |j|
      return true if target_sum == arr[i] + arr[j]
    end
  end
  false
end

def bsearch(nums, target)
  return nil if nums.empty?

  probe_index = nums.length / 2
  case target <=> nums[probe_index]
  when -1
    bsearch(nums.take(probe_index), target)
  when 0
    probe_index
  when 1
    sub_answer = bsearch(nums.drop(probe_index + 1), target)
    (sub_answer.nil?) ? nil : (probe_index + 1) + sub_answer
  end
end

def okay_two_sum?(arr, target_sum)
  arr.sort
  until arr.empty?
    bsearch_target = target_sum - arr.shift
    return true if bsearch(arr, bsearch_target)
  end
  false
end

def two_sum?(arr, target_sum)
  target_hash = Hash.new(0)
  arr.each do |num|
    target_hash[num] += 1
  end
  arr.each do |num|
    if num == target_sum / 2
      return true if target_hash[target_sum - num] > 1
    else
      return true if target_hash[target_sum - num] > 0
    end
  end
  false
end
