@arrPok=Hash.new{}
pok_Data=File.read("gjr.txt").split("\n")
@pok_hash=Hash[*pok_Data]
def addPok
  puts "Cколько вы хотите добавить покемонов ?"
  value=gets
  value=value.to_i
  value.times do
    puts "Введите имя и цвет покемона"
    pok=gets.split
    name=pok[0]
    color=pok[1]
    boolean=@pok_hash.key?(name)
    bool=@pok_hash[name]==color
    if boolean==false
      puts "Такого покемона не существует"
    else
      if bool==false
        puts "У этого покемона другой цвет"
        else
        @arrPok[name]=color
        File.write("Pokemon.txt", "#{name}=>#{color}\n", mode: "a")
      end
    end
  end
end

def putPok
  @arrPok.each do |name,color|
      puts "name:#{name}=>color:#{color}"
    end
end

def putPokHash
  @pok_hash.each do |name,color|
    puts "name:#{name}=>color:#{color}"
  end
end
loop do
  puts "Если хотите добавить нового покемона введите (add) если хотите вывести массив покемонов введите (puts) для выхода нпишите -1"
  value=gets
  break if value.to_i==-1
 case value
  when "add\n" then addPok
  when "puts\n" then putPok
  else puts "Неее так не пойдет, давай выбирай или add или puts \n\n"
 end
end
