begin
  payment = ARGV[0].to_i
  raise if payment.negative?
rescue
  puts 'erorr: 引数には正の数を入力してください'
  exit
end
YEN = [10000, 5000, 1000, 500, 100, 50, 10, 5, 1]
required_yen = []

YEN.each{ |yen|
  required_yen.push(payment / yen)
  payment = payment % yen
}

p [YEN, required_yen].transpose.to_h
