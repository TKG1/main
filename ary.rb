data = [["らんてくん", 98],["カンノ", 23],["ファラオ", 57],["だいそん", 84],["ひさじゅ", 100]]

# 整形処理のコード
desc_data = data.sort_by(&:last).reverse

desc_data.to_h.each.with_index(1) do |(name, score), index|
  puts "#{index}位: #{name} #{score}"
end
