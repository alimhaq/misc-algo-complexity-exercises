require 'benchmark'

def my_min(array) # n ** 2 time complexity
  smallest = array.first
  array[1..-1].each_index do |i|
    (i + 1...array.size).each do |j|
      smallest = array[j] if array[j] < smallest
    end
  end
  smallest
end

def mymin2(array)
  smallest = array.first
  array[1..-1].each do |num|
    smallest = num if num < smallest
  end
  smallest
end

def largest_contiguous_subsum(arr)
  result_arr = []
  (0...arr.length).each do |i|
    (arr.length - 1).downto(i) do |j|
      result_arr << arr[i..j]
    end
  end
  max = nil
  result_arr.each do |sub_arr|
    current_sum = sub_arr.reduce(:+)
    max = current_sum if max.nil?
    max = current_sum if max < current_sum
  end
  p max
end

def largest_contiguous_subsum1(arr)
  max_sum = arr[0]
  acc_sum = max_sum
  arr.each do |num|
    acc_sum < 0 ? acc_sum = num : acc_sum += num
    max_sum = acc_sum if acc_sum > max_sum
  end
  p max_sum
end

def largest_contiguous_subsum2(arr)
  largest = arr.first
  current = arr.first

  return arr.max if arr.all? { |num| num < 0 }

  arr.drop(1).each do |num|
    current = 0 if current < 0
    current += num
    largest = current if current > largest
  end

  p largest
end

arr = []
100000000.times do
  arr << rand(-10..10)
end

p Benchmark.realtime {largest_contiguous_subsum1(arr)}
p Benchmark.realtime {largest_contiguous_subsum2(arr)}
