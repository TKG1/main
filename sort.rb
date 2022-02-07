arg = ARGV
arg_a = arg.clone
arg_b = arg.clone
# 昇順
# p arg.min(arg.count)

# 降順
# p arg.max(arg.count)

# バブルソート
arg_a.length.times do
  x = 0
  arg_a.inject do |result, item|
    x += 1
    if arg_a.length == x
      arg_a
    elsif (result <=> item) == 1
      arg_a[x - 1], arg_a[x] = arg_a[x], arg_a[x - 1]
      result
    else
      item
    end
  end
end

p arg_a

# クイックソート
class Array
  def quick_sort
    return self if self.length < 2

    pivot = self[0]
    self.delete_at(0)
    small = self.select { |word| pivot > word }
    big = self.select { |word| pivot <= word }
    small.quick_sort + [pivot] + big.quick_sort
  end
end

p arg_b.quick_sort
