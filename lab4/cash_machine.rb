class CashMachine
  def readfile
    if File.exist?("Balance.txt")
      File.open("Balance.txt") do
        balance_file = File.readlines("Balance.txt")
        bal = balance_file[0]
        @balance = bal.to_i
      end
    else
      @balance = 100.0
    end
  end

  def deposit
    puts "Введите сумму"
    value=gets.chomp.to_i
    dep=@balance
    if value>0
      newBalance=dep+value
      File.write("Balance.txt", "#{newBalance}", mode: "w")
    else
      puts "Введите сумму больше 0"
    end
  end

  def withdraw
    puts "Введите сумму"
    value=gets.chomp.to_i
    dep=@balance
    if value>0 and value<=dep
      newBalance=dep-value
      File.write("Balance.txt", "#{newBalance}", mode: "w")
    else
      puts "На вашем счету недостаточно денег, либо введите сумму больше 0"
    end
  end

  def balance
    b = @balance
    puts b
  end

  def init
    loop do
      readfile
      puts "внести деньги -> D, вывести деньги -> W, проверить баланс -> B или выйти -> Q"
      value=gets.chomp
      case value
      when "d" then deposit
      when "w" then withdraw
      when "b" then balance
      when "q" then break
      end
    end
  end

end

a=CashMachine.new
a.init
