def is_plate? (string)
  
	string.match(/^[A-Z]{3}[0-9]{3}$/) ? true : false
end

puts is_plate?("") #=> false
puts is_plate?("MVV387") #=> true
puts is_plate?("mvv387") #=> false