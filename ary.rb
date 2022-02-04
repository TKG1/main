data = [["らんてくん", 98],["カンノ", 23],["ファラオ", 57],["だいそん", 84],["ひさじゅ", 100]]
rank = 1

# 整形処理のコード
desc_data = data.sort_by(&:last).reverse

desc_data.to_h.each do |name, score|
  puts "#{rank}位: #{name} #{score}"
  rank += 1
end
