begin
  arg = ARGV[0].to_i
  raise if arg.negative?
rescue
  puts 'error: 引数には正の数を入力してください'
  exit
end

numbers = (1..arg).to_a
permutation_numbers = []

numbers.product(numbers) { |num| permutation_numbers << num.sort }
permutation_numbers.delete_if { |num| num[0] == num[1] }
combination_numbers = permutation_numbers.uniq

p combination_numbers

# 修正後
# p (1..arg).to_a.combination(2).to_
