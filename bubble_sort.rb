def bubble_sort array
  array.length.times do
    i = 0
    a = 1
    while i < array.length - 1
      swap_number = array[a]
      if array[i] > array[a]
        array[a] = array[i]
        array[i] = swap_number
      end
      i += 1
      a += 1
    end
  end
  array
end
def bubble_sort_by array
  sort_count = array.length - 1
  sort_count.times do
    i = 0
    a = 1
    while i < array.length - 1
     return_value =  yield(array[i],array[a])
     swap_number = array[a]
     if return_value > 0
       array[a] = array[i]
       array[i] = swap_number
     end
     i += 1
     a += 1
    end
  end
  array
end
