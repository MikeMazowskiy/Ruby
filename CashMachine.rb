require 'socket'
server = TCPServer.new(3000)
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

  def deposit(d_value)
    d_value = d_value.to_i
    if d_value>0
      @balance += d_value
      File.write("Balance.txt", "#{@balance}", mode: "w")
    else
      return 'Введите сумму больше 0'
    end
  end

  def withdraw(w_value)
    w_value = w_value.to_i
    if w_value>0 and w_value<=@balance
      @balance -= w_value
      File.write("Balance.txt", "#{@balance}", mode: "w")
    else
      "You have not enough minerals!"
    end
  end

  def balance
    "Your balance:#{@balance}"
  end
end

 while (connection = server.accept)
   atm=CashMachine.new
   atm.readfile
   request = connection.gets
   m, full_path = request.split(' ')

   connection.print "HTTP/1.1 200\r\n"
   connection.print "Content-Type: text/html\r\n"
   connection.print "\r\n"

   if m == 'GET'
     path, num = full_path.split('?')
     connection.print case path
     when '/balance'
       atm.balance
     when '/deposit'
       atm.deposit(num)
     when '/withdraw'
       atm.withdraw(num)
     when '/quit' then break
     else
       'Check your enter'
     end
   end

 end

