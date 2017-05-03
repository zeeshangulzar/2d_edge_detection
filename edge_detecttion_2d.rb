input = []
output = []
results = []

#file reading
File.open("cat.txt", "r") do |f|
  f.each_line do |line|
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

input.each_with_index do |values, index|
  if index == 0 #for first row only
    inner_output = ['0']
    values.each_with_index do |value, inner_index|
      next if values[inner_index + 1].nil? || values[inner_index].nil?
      if values[inner_index + 1] != values[inner_index]
        inner_output << '1'
      else
        inner_output << '0'
      end
    end
    output << inner_output
  else
    inner_output = [] #for second row to onwrad
    values.each_with_index do |value, inner_index|
      next if values[inner_index - 1].nil? || values[inner_index].nil?
      if inner_index - 1 >= 0 && values[inner_index - 1] != values[inner_index]
        inner_output << '1'
      elsif input[index - 1][inner_index] != values[inner_index]
        inner_output << '1'
      else
        inner_output << '0'
      end
    end
    output << inner_output
  end
end

#print Input
input_values = input.map { |array| array.join }
puts "Input:"
input_values.each do |line|
  p line
end

#print output
results = output.map { |array| array.join }
puts "Output:"
results.each do |result|
  p result
end
