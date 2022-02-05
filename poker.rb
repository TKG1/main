# 引数は５個以上受け取らない
arg = ARGV.take(5)
# 引数を文字列に変換
tehuda = arg.join(',')
# 手札の数字のみ抽出、昇順に並べ替え
string_number = tehuda.delete('^0-9,').split(',')
number = string_number.map(&:to_i).sort

# 手札のマークの一文字目のみを抽出、昇順に並べ替え
mark = tehuda.delete('0-9').split(',').sort
mark = mark.map { |m| m[0] }

# トランプのマーク・番号以外が入力されると例外
begin
  raise unless arg.length == 5
rescue
  p 'error: 引数は5個入力してください'
    exit
end

number.map do |num|
  begin
    raise unless num.between?(1,13)
  rescue
    p 'error: 1~13の数値を入力してください'
    exit
  end
end

mark.map do |m|
  begin
    raise unless m.match?(/^[HDCS]/)
  rescue
    p 'error: H:ハート、D:ダイヤ、C:クローバー、S:スペードの英単語を入力してください'
    exit
  end
end

# 番号の数
aggregated_number = []
# 連番の数
straighted_number = 0
# マークの数
aggregated_mark = []

# 役
royal_straight_flash = false
flash = false
straight = false
four_card = false
three_card = false
full_house = false
two_pair = false
one_pair = false

# 同じ番号を集計
number.uniq.map { |num| aggregated_number.push(number.count(num)) }
# 同じマークを集計
mark.uniq.map { |ma| aggregated_mark.push(mark.count(ma)) }
# 連番の判定
(number.length - 1).times { |i| straighted_number += 1 if number[i] == (number[i + 1] - 1) }

# 数の役判定
case aggregated_number.sort
when [1, 4]
  four_card = true
when [2, 3]
  full_house = true
when [1, 1, 3]
  three_card = true
when [1, 2, 2]
  two_pair = true
when [1, 1, 1, 2]
  one_pair = true
end

# ストレート判定
straight = true if straighted_number == 4
# フラッシュ判定
flash = true if aggregated_mark == [5]
# ロイヤルストレート・フラッシュ判定
if number == [1, 10, 11, 12, 13]
  straight = true
  royal_straight_flash = true if flash
end

# 結果の出力
if royal_straight_flash
  puts 'ロイヤルストレート・フラッシュ'
elsif flash && straight
  puts 'ストレート・フラッシュ'
elsif four_card
  puts 'フォーカード'
elsif full_house
  puts 'フルハウス'
elsif flash
  puts 'フラッシュ'
elsif straight
  puts 'ストレート'
elsif three_card
  puts 'スリーカード'
elsif two_pair
  puts 'ツーペア'
elsif one_pair
  puts 'ワンペア'
else
  puts 'ノーハンド'
end
