# Сделан возможным safe_invert для Хэша
fruits_country = {
  'orange': 'Marocco',
  'banana': 'Ecuador',
  'lemon': 'Marocco'
}

# создадим собственный метод
class Hash
  # ключи в хеше должны быть уникальными
  def safe_invert
    each_with_object({}) do |(key, value), hash|
      hash[value] ||= []
      hash[value] << key
    end
  end
end

puts fruits_country.safe_invert
