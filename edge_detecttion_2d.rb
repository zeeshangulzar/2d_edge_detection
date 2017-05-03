input = []
output = []
results = []

#file reading
File.open("cat.txt", "r") do |f|
  f.each_line do |line|
    puts line
    input << line.strip.gsub("\n", "").split('')
  end
end

#empty file and irregular input validation
flags = input.map {|array| array.size}.uniq
if flags.size ==  0 #blank file validation
  puts "File is empty, Please provide valid ASCII encoded string file."
  exit
elsif flags.count != 0 && flags.count > 1 #irregular size validation
    puts "Please enter same size of ASCII encoded string"
    exit
end

#non binary input validation
binary_flag = false
input.each do |array|
  binary_flags =  array.map {|v| v =='0' || v=='1' }.uniq
  if !(binary_flags.count == 1 && binary_flags.first == true)
    puts "Please provide valid ASCII encoded file"
    exit
  end
end


puts "working code"

# input.each_with_index do |values, index|
#   if index == 0
#     inner_output = ['0']
#     values.each_with_index do |value, inner_index|
#       if value[inner_index + 1] != value[inner_index]
#         inner_output << '1'
#       else
#         inner_output << '0'
#       end
#     end
#     output << inner_output
#   else
#   end
# end
# results = output.map { |array| array.join }
# puts "Output: #{results}"
