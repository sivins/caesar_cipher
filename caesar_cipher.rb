puts "Please enter the text you need to encrypt:"
plaintext = gets.chomp

puts "Please enter the encryption key (integer):"
key = gets.chomp.to_i

#first, a function to deal with "loop around"
def loop_around(num, is_capital)
	#makes sure 'Z' + 1 = 'A' and 'z' + 1 = 'a'. num is an integer, is_capital is a bool
	if is_capital
	
		if num >= 65 and num <= 90
			return num
		end

		if num < 65
			return loop_around(num + 26, true)
		end

		if num > 90
			return loop_around(num - 26, true)
		end
	
	#if lowercase:
	else
		if num >= 97 and num <= 122
			return num
		end

		if num < 97
			return loop_around(num + 26, false)
		end

		if num > 122
			return loop_around(num - 26, false)
		end
	end

end


#change string to numbers so we can add key
cipher_in_numbers = Array.new
plaintext.each_char {|c| cipher_in_numbers << c.ord}

#add the key. if the character is a letter, we need to make sure it looped around (z to a, etc.)
cipher_in_numbers.each_index do |i|
	
	#capital letters
	if (cipher_in_numbers[i] >= 60) and (cipher_in_numbers[i] <= 95)
		cipher_in_numbers[i] += key
		cipher_in_numbers[i] = loop_around(cipher_in_numbers[i], true)
	
	#lowercase letters
	elsif (cipher_in_numbers[i] >= 97 and cipher_in_numbers[i] <= 122)
		cipher_in_numbers[i] += key 
		cipher_in_numbers[i] = loop_around(cipher_in_numbers[i], false)
	
	end

end

#change back to letters
cipher_in_numbers.each_index {|i| cipher_in_numbers[i] = cipher_in_numbers[i].chr}

#cast into a string
cipher = ''
cipher_in_numbers.each {|c| cipher += c.to_s}

#result
puts cipher