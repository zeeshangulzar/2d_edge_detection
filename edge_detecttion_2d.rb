puts "start"
input = []
File.open("cat.txt", "r") do |f|
  f.each_line do |line|
    puts line
    input << line.strip.gsub("\n", "").split('')
  end
end
puts "end"
# puts input
input.each do |a|
  p a
end
p input[0][0]
p input[1][4]

