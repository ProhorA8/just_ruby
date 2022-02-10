# С клавиатуры вводится:
#   – дата
#   – единицы измерения(день, месяц, год)
#   – длительность (целочисленное значение)
#   – N последующих дат (целочисленное значение)
# Выводится нужное N последующих дат
require 'date'

# сбор параметров
puts 'Введите дату формата 9/18/2020:'
input_date = gets.chomp
puts 'Введите одну из единиц измерения (day, week, month, year):'
input_measurements = gets.chomp
puts 'Введите длительность – шаг (целочисленное значение):'
input_step = gets.to_i
puts 'Введите N последующих дат (целочисленное значение):'
input_count_dates = gets.to_i

# формируем валидную дату
def valid_date(date)
  date.split('/').rotate(2).join('-')
end

# формируем дату в необходимый формат
def invalid_date(date)
  date.to_s.split('-').rotate(1).join('/')
end

# возвращает дату с заданым шагом
def subsequent_dates
  # инициализируем счётчик шага
  step_counter = 0

  lambda do |step, hash|
    # получаем единицу измерения строкой
    unit = hash.keys[0].to_s
    # получуем параметры лямбды в виде массива
    array_params = hash[hash.keys[0]].call
    # получаем валидную дату для создания объекта даты
    string_date = valid_date(array_params[0])

    # увеличиваем счётчик с заданным интервалом
    step_counter += step

    if unit == 'day'
      Date.parse(string_date).next_day step_counter
    elsif unit == 'month'
      Date.parse(string_date).next_month step_counter
    else
      Date.parse(string_date).next_year step_counter
    end
  end
end

counter = 0
step = 0

# создаём хэш, где единица измерения полученная от пользователя – ключ, массив параметров полученных от пользователя – значение
hash = { "#{input_measurements}": lambda { [input_date, input_step, input_count_dates] }}

# выводим даты в необходимом формате, нужное колличество раз
while counter < input_count_dates
  counter += 1
  
  # вызов лямбды в методе с передачей ей шага и хэша
  date = subsequent_dates.call(step, hash)
  string_date = invalid_date(date)
  step += input_step

  print string_date, ' '
end
