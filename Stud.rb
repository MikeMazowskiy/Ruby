require 'fileutils'
new_array = File.readlines("list.txt").sort
File.open("list.txt","w") do |file|
  new_array.each {|n| file.puts(n)}
  end
@stud_Data=File.read("list.txt").split("\n")

def find
  puts "Введите возраст"
  value=gets.chomp
  stud=@stud_Data
  stud.each do |x|
    if x[value]
      File.write("results.txt", "#{x}\n", mode: "a")
    end
  end
end
def sort
  new_array = File.readlines("results.txt").sort
  File.open("results.txt","w") do |file|
    new_array.each {|n| file.puts(n)}
  end
end
loop do
  puts "Если хотите добавить сотрудника пишите '1' если хотите выйти напишите '-1', отсортировать массив 2"
  value=gets
  case value
  when "1\n" then find
  when "2\n" then sort
  break if value.to_i==-1
  break if FileUtils.compare_file('list.txt','results.txt')==true
  end
end
