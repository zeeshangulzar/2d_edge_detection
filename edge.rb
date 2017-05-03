puts "Please enter your value :"
value = gets
value = value.gsub("\n", "")


if value.empty?
  puts "Please enter ASCII encoded string"
else
  output = ['0']
  values = value.split('')
  flags = values.map {|v| v =='0' || v=='1' }.uniq
  if flags.count == 1 && flags.first == true
    values.each_with_index do |value, index|
      next if values[index + 1].nil? || values[index].nil?
      if values[index + 1] != values[index]
        output << '1'
      else
        output << '0'
      end
    end
    output = output.join
    puts "Input: #{value}"
    puts "Output: #{output}"
  else
    puts " #{value} is invalid. Please enter valid ASCII encoded string"
  end
end
