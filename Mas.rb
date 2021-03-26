$KCODE = "u"
 def conc(word)
  word1 = word.split(' ')[1]
  if word1[-2..-1].upcase == "CS"
    puts 2**word1.length
  else
    puts word1.reverse
  end
end
puts "Enter word"
word=gets.chomp
conc(word)
