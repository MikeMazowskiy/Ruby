def foo
  puts "Введите имя"
  name = gets.chomp
  puts "Введите фамилию"
  surName = gets.chomp
  puts "Введите возраст"
  age = gets.to_i
  if age < 18
    puts "Привет, #{name} #{surName}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано"
  else
    puts "Привет, #{name} #{surName}. Самое время заняться делом!"
  end
end

def bar
  puts "Введите первое число"
  a = gets.to_i
  puts "Введите второе число"
  b = gets.to_i
  if  a == 20 || b == 20
    puts 20
  else
    puts (a + b)
  end
end

loop do
  print "Запустить первый метод введите 1\n"
  print "Запустить второй метод введите 2\n"
  print "Для выхода введите -1\n"
  input = gets.to_i
  puts "Вы ввели #{input}\n"
  break if input == -1
  if input == 1
    foo
  elsif input == 2
    bar
  end
end