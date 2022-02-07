arg = ARGV[0].to_i.abs
permutation_numbers = []

4.times do |i|
  (1..arg).to_a.each do |x|
    a = [i + 1, x].sort
    permutation_numbers.push(a)
  end
end

permutation_numbers.delete_if { |num| num[0] == num[1] }
combination_numbers = permutation_numbers.uniq

p combination_numbers

# 修正後
# p (1..arg).to_a.combination(2).to_a
