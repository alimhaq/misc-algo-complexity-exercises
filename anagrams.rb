def first_anagram?(str1, str2)
  str1.chars.permutation.to_a.include?(str2.chars)
end

# p first_anagram?('het', 'the')
# p first_anagram?('qwerty', 'qwerty')

def second_anagram?(str1, str2)
  flag1 = false
  flag2 = false
  str2_arr = str2.chars
  str1_arr = str1.chars
  str1.chars.each do |ch|
    str1_arr.each_with_index do |el, i|
      if ch == el
        str1_arr.delete_at(i)
        flag1 = true
        break
      end
    end
    return false unless flag1
    flag1 = false
    str2_arr.each_with_index do |el, j|
      if ch == el
        str2_arr.delete_at(j)
        flag2 = true
        break
      end
    end
    return false unless flag2
    flag2 = false
  end
  str1_arr.empty? && str2_arr.empty?
end

# p second_anagram?('het', 'the')
# p second_anagram?('qxdweruijhgohhptyer', 'qhgwehpoiudxrjtyhre')

def third_anagram?(str1, str2) ##solutions sorts and joins strings. Why not compare arrays?
  str1.chars.sort == str2.chars.sort
end

def fourth_anagram?(str1, str2)
  counter = Hash.new(0)
  str1.chars.each do |ch|
    counter[ch] += 1
  end
  str2.chars.each do |ch|
    counter[ch] -= 1
  end
  counter.values.all? { |el| el == 0 }
end

p fourth_anagram?('het', 'the')
p fourth_anagram?('qxdweruijhgohhptyer', 'qhgwehpoiudxrjtyhre')
