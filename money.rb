payment = ARGV[0].to_i.abs
YEN = [ 1, 5, 10, 50, 100, 500, 1000, 5000, 10000 ]
required_yen = []

YEN.reverse.map{ |yen|
  required_yen.prepend(payment / yen)
  payment = payment % yen
}

p [YEN, required_yen].transpose.to_h
