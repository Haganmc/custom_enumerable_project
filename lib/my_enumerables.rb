module Enumerable
  def my_each_with_index
    index = 0
    self.my_each do |elem|
      yield(elem, index)
      index +=1
    end
  end

  def my_select
    result = []
    self.my_each do |elem|
      result << elem if yield(elem)
    end
    result
  end

  def my_all?
    matches = []
    self.my_each do |elem|
      matches << elem if yield(elem)
    end
    matches == self
  end

  def my_any?
    matches = []
    self.my_each do |elem|
      matches << elem if yield(elem)
    end
    matches.length > 0
  end

  def my_none?
    matches = []
    self.my_each do |elem|
      matches << elem if yield(elem)
    end
    matches.length == 0
  end

  def my_count
    if block_given?
      matches = []
      self.my_each do |elem|
        matches << elem if yield(elem)
      end
      matches.size
    else
      self.size
    end
  end

  def my_map
    result = []
    self.my_each do |elem|
      result << yield(elem)
    end
    result
  end

  def my_inject(init)
    result = init.clone
    self.my_each do |elem|
      result = yield(elem, result)
    end
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
     for items in self do
      yield items
     end
  end
end
