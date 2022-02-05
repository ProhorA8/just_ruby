# С клавиатуры вводится:
# дата, единицы измерения(день, месяц, год) и длительность (целочисленное значение)
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
count_subsequent_dates = gets.to_i

# формируем валидную дату
def valid_date(date)
  date.split('/').rotate(2).join('-')
end

# формируем дату в необходимый формат
def invalid_date(date)
  date.to_s.split('-').rotate(1).join('/')
end

# возвращает дату с заданым шагом
def subsequent_dates(date, unit, step)
  string_date = valid_date(date)

  if unit == 'day'
    Date.parse(string_date).next_day step
  elsif unit == 'month'
    Date.parse(string_date).next_month step
  else
    Date.parse(string_date).next_year step
  end
end

maximum_duration = (count_subsequent_dates - 1) * input_step

# выводим даты в необходимом формате, нужное колличество раз
0.step(maximum_duration, input_step) do |step|
  string_date = invalid_date subsequent_dates(input_date, input_measurements, step)
  print string_date, ' '
end
