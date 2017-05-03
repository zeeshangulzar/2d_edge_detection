input = []

#file reading
File.open("cat.txt", "r") do |f|
  f.each_line do |line|
    puts line
    input << line.strip.gsub("\n", "").split('')
  end
end

#validations
flags = input.map {|array| array.size}.uniq
if flags.size ==  0 #blank file validation
  puts "File is empty, Please provide valid ASCII encoded string file."
  exit
elsif flags.count != 0 && flags.count > 1 #irregular size validation
    puts "Please enter same size of ASCII encoded string"
    exit
else
  input.each do |array|
    binary_flags = array.map {|v| v =='0' || v=='1' }.uniq
    if binary_flags.count == 1 && binary_flags.first == true
      #your code  here
    else
      puts "Please provide valid ASCII encoded file"
    end
  end

end
