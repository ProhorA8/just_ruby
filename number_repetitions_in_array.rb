# На массиве реализован метод получения Хэша (ключ - элемент, значение - количество повторений в массиве)
fruit = ['orange', 'banana', 'banana', 'banana', 'lemon', 'lemon'] # => {'orange'=>1, 'banana'=>3, 'lemon'=>2}

# возвращает хэш с количество повторений элементов
def histogram(array_collection)
  array_result = array_collection.group_by { |v| v }.flat_map { |k, v| [k, v.size] }
  Hash[*array_result]
end

puts histogram fruit

# или второй вариант
def count_frequency(word_list)
  counts = Hash.new(0)
  word_list.each { |word| counts[word] += 1 }
  counts
end

puts count_frequency fruit
