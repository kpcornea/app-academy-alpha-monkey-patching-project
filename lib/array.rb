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
end
