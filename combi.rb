arg = ARGV[0].to_i.abs
array_numbers = []

1.upto(arg) {|i| array_numbers.push(i)}

p array_numbers.combination(2).to_a
