module Enumerable

  def my_each
    i = 0
    while i < self.length
      if self.class == Array
        yield(self[i])
        i += 1
      else
        yield(self.keys[i],self.values[i])
        i += 1
      end
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < self.length
        yield(self[i],i)
        i += 1
    end
    self
  end

  def my_select
    i = 0
    new_array = []
    while i < self.length
      if self.class == Array
        value = yield(self[i])
      else
        value = yield(self.keys[i],self.values[i])
      end
      if value == true
        new_array.push(self[i])
      end
      i += 1
    end
    new_array
  end

  def my_all?
    value = 'foo'
    i = 0
    true_count = 0
    while i < self.length
      if self.class == Array
        value = yield(self[i])
      else
        value = yield(self.keys[i],self.values[i])
      end
      if value == true
        true_count += 1
      end
      i += 1
    end
    array_length = self.length
    return(true_count == array_length)
  end

  def my_any?
    i = 0
    while i < self.length
      if self.class == Array
        value = yield(self[i])
      else
        value = yield(self.keys[i],self.values[i])
      end
      if value == true
        return true
      end
      i += 1
    end
    return false
  end

  def my_none?
    value = 'foo'
    i = 0
    false_count = 0
    while i < self.length
      if self.class == Array
        value = yield(self[i])
      else
        value = yield(self.keys[i],self.values[i])
      end
      if value == false
        false_count += 1
      end
      i += 1
    end
    array_length = self.length
    return(false_count == array_length)
  end

  def my_count 
    value = ''
    i = 0
    count = 0
    while i < self.length
      if block_given?
      if self.class == Array
        value = yield(self[i])
      else
        value = yield(self.keys[i],self.values[i])
      end
      count += 1 if value == true
      else
        count += 1
      end
      i += 1
    end
    return count
  end

  def my_map a_proc
    i = 0
    new_array = []
    while i < self.length
      if block_given?
        returned_value = a_proc.call(self[i])
        new_array.push(yield(returned_value))
      else
        new_array.push(a_proc.call(self[i]))
      end
      i += 1
    end
    new_array
  end
  def my_inject value=0
    present_total = 0
    while value < self.length
      present_number = self[value]
      present_total = yield(present_total,present_number)
      value += 1
    end
    present_total
  end
end
