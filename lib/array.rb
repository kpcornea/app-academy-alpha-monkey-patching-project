# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.length == 0
    self.max - self.min
  end

  def average
    return nil if self.length == 0
    self.reduce(:+).to_f / self.length
  end

  def median
    return nil if self.length == 0
    if self.length % 2 == 0
      return (self.sort[self.length / 2] + self.sort[(self.length / 2) - 1]) / 2.0
    end
    self.sort[self.length / 2]
  end

  def counts
    hash = Hash.new(0)
    self.each { |ele| hash[ele] += 1 }
    hash
  end

  def my_count(val)
    count = 0
    self.each { |ele| count += 1 if ele == val }
    count
  end

  def my_index(val)
    self.each_with_index { |ele, i| return i if ele == val }
    nil
  end

  def my_uniq
    seen = []
    new_arr = []

    self.each do |ele|
      next if seen.include?(ele)
      new_arr << ele
      seen << ele
    end

    new_arr
  end

  def my_transpose
    hash = Hash.new { |h, k| h[k] = [] }

    self.each do |sub_arr|
      sub_arr.each_with_index do |ele, i|
        hash[i] << ele
      end
    end

    hash.values
  end
end
