#Ruby Chapter 3

age = 23
age2 = 18
puts "You're old enough to see this message" if age > 22 && age < 30
puts "You're old enough to see this message" if age.between?(22, 30) #variable.between?(a, b) == (variable > a && variable < b)
puts age.between?(22, 30) == (age > 22 && age < 30) #This proves the above commented statement
puts "You have the right age to view this message" if age == 23
puts "You're either too old or too young" if age2 < 22 || age2 > 30
puts (age > 22 && age < 30) == !(age < 22 || age >30)

#Anything inside parenthesis brackets is calculated first!


#Relational operators

#Comparisson       Meaning
#x > Y             Greater than
#x < Y  		   Less than
#x == Y            Equal to
#x >= Y            Greater than or equal to
#x <= Y            Less than or equal to
#x <=> Y           Comparison; returns 0 if x and y are equal, 1 if x is higher, and -1 if y is higher
#x != Y            Not equal to

puts age.between?(22, 30) == (age > 22 && age < 30)

#Looping Through Numbers with Blocks and Iterators

index = 0

5.times do 

  puts 'test', index
  index += 1
end        #this literaly repeats 5 times the task of putting the test word into the console
           #this is mainly intended for multiple line code to be iterated

5.times { puts 'test'} #Does the same as the code above, but this sintax is intended to be used on single line expressions
1.upto(5) { puts 'This is being iterated 5 times using the expression 1.upto(5) {...}' } #upto method to iterate from 5 to 10
10.downto(5) { puts 'Test'  } #iterating trough 10 to 5 using the inverse version of upto
0.step(50, 5) { 'Test' } #iterates using the step method that receives as parameters the limit number and the step
5.times {|n| puts n} #the |n|  is the actual index of the loop, you can use it inside the iteration as you might want
                     #the chutes defines how parameters are passed to blokcs that don't have explicit names such as -
                     #methods.
0.step(50, 5) do |n|

  puts n
end

puts (10.0/3).class #Floating Point Numbers belong to the Float Class not to the Fixnum class

a = 10 
b = 3

puts a/b #returns a number with no presicion or simply an integer whose class is Fixnum
puts a.to_f/b.to_f #returns a number with float presicion whose class is Float
                   #the Integer class’s to_f method is used to explicitly convert the a number which is -
                   #an integer, into a float.
puts (a.to_f).to_i #this line of code does the opposite as the above code, it converts a floating number -
				   #into an integer number using the Float class's to_i method.


#Constants are always or should be always written capitalized.

Pi = 3.141592
Pi = 5 #it should show a warning telling me that the constant Pi was already initialized

#The eagle-eyed reader might recall that in Chapter 2 you referred to classes by names such as Dog and Cat,
#beginning with capital letters. This is because once a class is defined, it’s a constant part of the program  -
#and therefore acts as a constant, too.

#Text and Strings

puts 'Hola @#{1234}'.class

#A string is a collection of textual characters (including digits, letters, whitespace, and symbols) of any length.
#All strings in Ruby are objects of the String class. Any text that’s pre-embedded within a program is a string literal

puts %<this is a very long piece -
so long that it actully has -
to be cutted into three lines> #theres's another way to write String literals like the one shown on the left
                               #you can use % with any kind of delimeter such as paired curly braces, expression signs, ect
                               # {}, (), !¡, <>, ¿?, ...

message = <<HERE_DOCUMENT
this is another way of writing long 
partinioted lines of text but with a
more wisely delimeter
HERE_DOCUMENT

puts message #The example show above is another method for writing String literals of multiples lines 
             #here I'm using a <<HERE_DOCUMENT to indicate where the literal starts and where it 
             #ends..

#String Expressions

puts 'Hola, ' + 'mi nombre es Andres Garcia' #The + operator when applied to string literals concatenates them
puts 'x' > 'y' #you can use relational operations to string literals, but what it internally does is to compa-
               #-re the actual number that represents the characters of the string. Characters are stored as -
               #-numbers inside your computer’s memory. Every letter and symbol has a value, called an ASCII value.

puts ?x #you can find what the ASCII value is with the expression shown on the left
puts 120.chr #the reverse operation of ?x

#Interpolation (VERY IMPORTANT!!)

x = 10
y = 20
puts "#{x} + #{y} is equal to #{x + y}" #this shows you that you can embed expressions and even logic -
          								#-directly into strings. #{variable or value}

puts "you're a #{'bad '*5}cat!!" #you can even interpolate several times an string into an expression as shown

puts x.to_s + ' + ' + y.to_s + ' is equal to ' + (x + y).to_s #You can write an expression without using interpolation, -
                                                              #by just creating a concatenated expression. but interpolation -
                                                              #-way eaiser and more interesting. in the expression shown on the -
                                                              #-left I'm using the Integer class's .to_s method to parse the -
                                                              #-integer numeric values into string literals.

puts "Hello\n"*5


#Regular Expressions and String Manipulation 

#All regular expression are Regexp objects!

#Regular expressions are string expressions that describe pattern for matching elements in  other strings

puts 'foobar'.sub('bar', 'foo') #the .sub('a', 'b') replaces the 'a' for 'b' on a string literal.
                                #This method just replaces one matching string at a time

puts 'This is a simple test'.gsub('i', ' ') #This does the same as above, but it replaces multiple matching elements
                                            #at a time.

puts 'This is a test'.sub(/^../, 'Hola')  #This sentence is using a regular expressions to change the part of a string that matches -
                                          #its pattern with the word 'Hello'. A regula expression starts and ends with '/' and-
                                          #uses anchors to represents where the mathc should be applied. This regular expression -
                                          # /^../ find a match for the to first characters on a string literal.
puts 'This is a test'.sub(/..$/, 'Hola')  #Does the same as above but the matching should be produce from the last character.
                                          #this matching pattern is produced by the $ anchor at the end of the regular expression.

#Iteration with regular expressions

puts "XYZ".scan(/./) do |letter|      #if you want to iterate trhough each section of an string by matching them with a regular expression -
                                      #-then you should use the .Scan(REGEX) { |LETTER| } method iterator. you can also use the do statement end -
                        puts letter   #-block iterator as shown on the left.
                     end   

puts 'This is a test'.scan(/\w\w/) do |letter|

									                   puts letter    #here the \w expression is matching only alphanumeric characters and  underscore.
                                   end          

#Character         Meaning

#^                 Anchor for the beginning of a line
#$                 Anchor for the end of a line
#\A                Anchor for the start of a string
#\Z                Anchor for the end of a string
#.                 Any character
#\w                Any letter, digit, or underscore
#\W                Anything that \w doesn’t match
#\d                Any digit
#\D                Anything that \d doesn’t match (non-digits)
#\s                Whitespace (spaces, tabs, newlines, and so on)
#\S                Non-whitespace (any visible character)

puts "The car costs $1000 and the cat costs $10".scan(/\d+/) {|cost| puts cost}  #This statemet scan the string literal by searching only digits, but retrieves them in a row
puts "The car costs $1000 and the cat costs $10".scan(/\d/) {|cost| puts cost} #on the other hand, this statemente retrieves all matching digits but separately at a time

#Regular Expressions Modifiers

#*                 Match zero or more occurrences of the preceding character, and match as many
#+                 Match one or more occurrences of the preceding character, and match as many
#*?                Match zero or more occurrences of the preceding character, and match as few
#+?                Match one or more occurrences of the preceding character, and match as few
#?                 Match either one or none of the preceding character.
#{x}               Match x occurrences of the preceding character.
#{x,y}             Match at least x occurrences and at most y occurrences.

puts "this is a test".scan(/[aeiou]/) { |vowels| puts vowels} #The last important aspect of regular expressions you need to understand at this stage is
                                                              #character classes. These allow you to match against a specific set of characters
puts 'this is a test'.scan (/[a-m]/) {|letters| puts letters} #This scan matches all lowercase letters between a and m.

#Matching

#Making substitutions and extracting certain text from strings is useful, but sometimes you-
#-merely want to check whether a certain string matches against the pattern of your choice..

puts 'This test contains digits' if 'Hello1234' =~ /\d/  #if the string has matches with the regular expression, the  puts a message indicating something
puts 'This test does not contain any digit above 5' unless 'Hello1234' =~ /[5-9]/ #unless the string matches the regular expression puts a message
                                                                        
puts 'This test does not contain any digit above 5' if 'Hello1234' !=~ /[5-9]/  #unless can be replaced by a normal if statment with a negation before the matching
                                                                                #- regex operator.

# =~ return the position of the first match!

#you can use the String class's .match() method to do the same as =~

puts "Hola".match(/d/) == ("Hola" =~ /d/) #returns true, both return 0 because not macth was found 
puts "Hola".match(/./) == ("Hola" =~ /./) #returns false, beacuse one returns the position of the first match, and the other the first match inside the string.

x = "This is a test".match(/(\w+) (\w+)/)
puts x[0] #you can acces to the data in the MatchData object like an array
puts x[1] #returns individual matches which are encapsulated into parenthesis
puts x[2] #returns individual matches which are encapsulated into parenthesis
puts x.class #return MatchData which is the class it belongs to

#match returns a MatchData object that can be accessed like an array. The first element
#(x[0]) contains the data matched by the entire regular expression. However, each successive
#element contains that which was matched by each match group of the regular expression. In
#this example, the first (\w+) matched This and the second (\w+) matched is.

#Arrays and Lists (Collection of elements or objects)

x = ['Andres', 'Garcia', 22] #This a array literal
puts "My name is #{x[0]} and my last name is #{x[1]}, and I'm #{x[2]} years old"

#Every array is indexed at 0, and you can acces to its content with an index (element reference) 'arrayName[index]', that represents the object inside the array

x[2] += 1 #you can re-asign values in arrays just like in javascript, or just like if you were manipulating Fixnum objects (Numbers)

x[1] = ''
5.times do |index| 

  x[1] += "Garcia ##{index}, "
end

x[1] = x[1].sub(/..$/, '')

puts x[1] 

#you don't always have to create previously initialized array literals, you can create empty array literals ike so:

x = []
y = []
x << 'Andres' #you can push data to the array like this
y << 'Garcia'
x.push(22) #you can use the more natural javacript-like push method to add data to the end of the queue
x.unshift(12) #this on the other hand will unshift the value to the beginning of the array
x.push('Male')
y << x.pop() #you can remove the last item of an array by using the Array class's .pop() method. arrays works in LIFO mode
             #.pop() not only removes an element inside an array, it also retrieves the element being deleted to be holded on a variable.
x.shift() #this delete the first element of the array           
puts x.class #the class of an array is obviously Array

puts x
puts y
puts x.length, y.length

x = ['Andres', 'Alejandro', 'Garcia', 22]
y = x.join(', ')  #you can convert an arry into a long sring literal by joining its elemnts with Array class's.join(delimeter) method
                  #the items to be joined must be strings or easily converted to strings objects. If you don't -
                  #pass a delimeter to the .join method, it will join the array's elements with no space in between

w = y.split(', ') #you can also split an string into an Array object, by using the String class's .split(delimeter) method
puts y.split(/\,/).inspect #The inspect presents the information on a tidier way. In this case it shows the array the way it is.
p y.split(/\,/)            #inspect can replace by p instead of puts, it shows you the structure of the object

#if you use the scan method without a block of code the return is an array f all the matching part of the string

y = y.scan(/\w+/)
puts y.join(', ')

#Array Iteration

x = ['Andres', 'Alejandro', 'Garcia']
x.each { |e| puts e  } #You can iterate trough an Array by using the .each method and the using a block of code-
                       #-such as {} or a 'do .. end'. |e| is the array element of the array that is passed to block of code

y = [1, 2, 3, 4, 5]
p y.collect { |e| e*2 }       #you can convert an Array by using the .collect method and passing the element as a parameter to a block-
p x.collect {|e| e + 'X'}     #-of code to then modify it.

i = 0
while (i < y.length)

  y[i] = y[i].to_s + 'X'
  puts y[i]
  i += 1
end

#you can still use tradional cycle or repetitives blocks to iterate trough an array like shown above

#Other Array Methods

x = [1, 2, 3]
y = ['a', 'b', 'c']
p z = x + y #This is an array addition, I'm adding the elements of x and y to Z, whic is a resultant array

x = [1, 2, 3, 4, 5, 6]
y = [2, 4, 6]
p z = x - y #This is an array subtraction, I'm subtrating the elements of x to y, and creating a new array with the result

z = []
puts 'the array z is empty!!' if z.empty? #you can perform the .empty? function to check if an array is empty 
                                          #you could have used array.length or array.size to do the same task
                                          #but the .empty? method is way practical

x = [1, 2, 3]
puts x.include?(3) #you can perform the .include?(element) to figure out if an array contain an element
puts x.include?(5) #it returns true or false

#Accessing the First and Last Elements of the Array

x = Array.new(10) do |i|

  i = i + 1
end #it creates an array of 10 elements by default and asign to its current reference its index + 1
puts x.length()
p x

puts "the first elemnt of x[] is #{x.first} and the last element is #{x.last}" #you can easily find the first and the las element of an array by
                                                                               #writing arrayName.first and arrayName.last respectively

puts x.first(5).join(', ') #If you pass a numeric parameter to  first or last you'll get that number of items from the start or the end of the array

y = Array.new(10)
p y = x.reverse() #you can reverse and array by using the Array class's method .reverse()

#Hashes (Object literals)

properties = {

  'firstName' => 'Andrés',
  'lastName' => 'García',
  'age' => 22,
  'gender' => 'Male'
}

properties.each do |key, value|

  puts "#{key} => #{value}" #you can use the .each method to iterate a hash object, you can pass the key:value pairs to the block as shown
end

properties.each_key do |key| puts key end #loops trough each key
properties.each_value do |value| puts value end #loops trough each value

# It’s more like a dictionary than a list, as there’s no guaranteed order, but just simple links between keys and values

puts properties.size #reveals the size of the hash object
puts properties.length #reveals the length of the hash object
puts properties.class #every hash is an instance of a Hash class

#properties = Hash.new

#properties['Name'] = 'Marly' #you can asign a value just in the same way you do on array literals, but using key:value pairs, instead of references

p properties

arraySize = properties.length - 1
x = Array.new(arraySize)
y = Array.new(arraySize)

i = 0
properties.each do |key, value|

  x[i] = key
  y[i] = value
  i += 1
end  #you can collect the keys on a hash object by looping trough it

p properties.keys #ruby provides the .keys metho to return an array with the keys on a hash object, you can do the same with the values
p properties.values
p x  
p y

p properties.delete(x[0]) #you can delete an element on an hash object with the .delete(key) method
p properties

#Deleting hash elements conditionally

i = 0
number = Hash.new

number['a'] = 1
number['b'] = 2
number['c'] = 3
number['d'] = 4
number['e'] = 5

p number

number.delete_if do |key, value|

  value > 3
end  #you can delete conditionally elements inside a hash object by using the .delete_if {|key, value| condition} method
     #it has the method and a block, where you pass the key:value pair to make the condition to be evaluated in the delete_if
     #method

p number

valid = true

puts meessage = valid ? "valid" : "invalid" #ternary operator

#Flow Control

me = {

	"Name" => "Andrés",
	"LastName" => "García",
	"Age" => 22,
	"Gender" => "Male"
}

puts "He's older than 18 years old" if me['Age'] > 18 #This is the conditional structure that's been used in the previous example

if me['Age'] > 18

	puts "He's older than 18 years old"
end  #this is the more natural conditional structurev if statements elseif statements ... end

if me['Age'] >= 22 

	puts "You can drink in the Usa"
else

	if me['Age'] < 22

		puts "You cannot drink in UK"
		#exit -- exit the program
	end
end  #Just in like any other programming language, you can nest conditionals structures within others conditional as show above

# ? the ternary operator

me['type'] = me['Age'] < 18 ? "Child" : "Old" #this is a shorter conditional block of code

p me

puts "You're way too " + (me['Age'] > 18 ? "old" : "young") + " to play this game!!"

#else if and case
fruit = "orange"
color = "orange" if fruit == "orange"
color = "green" if fruit == "apple"
color = "yellow" if fruit == "bannana"
puts color

fruit = "apple"

if fruit == "orange"

	color = "orange"
elsif fruit == "bannana"

	color = "yellow"
elsif fruit == "apple"

	color = "green"
else

	color = "uknown"
end 

puts color

fruit = "bannana"

case fruit

	when "orange"

		color = "orange"
	when "apple"

		color = "green"
	when "bannana"

		color = "yellow"
	else

		color = "uknown"
end

puts color

fruit = "papaya"

color = case fruit

	when "orange"

		"orange"
	when "apple"

		"green"
	when "bannana"

		"yellow"
	else

		"uknown"
end

puts color  #as all Ruby expressions return a result, you can asign a value to the color variable with a case structure as shown above

puts statement = if me['Age'] >= 22 

	"You can drink in the Usa"
else

	if me['Age'] < 22

		"You cannot drink in UK"
		#exit -- exit the program
	end
end  #Another example of assigning expressions to variables

x = 1 

while x < 100

	puts x 
	x *= 4
end

x = 1

until x > 100

	puts x 
	x *= 4
end

x = 1
x = x * 2 while x < 100
puts x #as all Ruby expressions return a result, you can asign a value to the color variable with a while structure as shown

#Code Blocks

#The code block is defined within the {} symbols or alternatively within the do ... end delimeters.
#The code between {} or do...end block, is essentialy a nameless, anonymous procedure or function

#you can write methods on your own to handle code blocks

def eachVowel (&code_block) #the & ampersan symbol means that the method accepts code blocks

	vowels = ['a', 'e', 'i', 'o', 'u']
	vowels.each{|vowel| code_block.call(vowel)} #you could have replaced the code_block.call() method with yield
end	                                            #to achieve the exact same result

eachVowel { |vowel| puts vowel } #example of the previously design method

def block_test

  puts "We're in the method!"
  puts "Yielding to the block..."
  yield #this expression allows the method to receive and execute a block
  puts "We're back in the method!"
end

block_test { puts ">>> We're in the block!" } #when you yield in a method, the method gets ready to receive
                                              #a block

def yield_name(name)

  puts "In the method! Let's yield."
  yield("Kim") #a yield expression with an argument
  puts "In between the yields!"
  yield(name)
  puts "Block complete! Back in the method."
end

yield_name("Eric") { |n| puts "My name is #{n}." }

#in the code below I've created an Proc obcject to hold my block for a further validation
multiples_of_3 = Proc.new do |n|
  n % 3 == 0
end

(1..100).to_a.select(&multiples_of_3) #here I'm passing my Proc into the select function!

hi =  lambda { |item| puts item }
hi.call("Hello!") #you can call the lambda as if it were a function, in fact it is an anonymous function

(1..100).to_a.collect(&:to_s) #it returns a casted array, converts them to string

#Only one code block can be passed at any one time. It’s not possible to accept two or more code blocks as parameters to a method.
#However, code blocks may accept none, one, or more parameters themselves.

#it's also possible to store code blocks within variables using the lambda method

print_parameter_to_screen = lambda {|x| puts x}
print_parameter_to_screen.call(100) #you can call the code block with the .call(parameter) method
puts print_parameter_to_screen.class #it belongs to the Proc class (a lambda is a code block)

#Ruby provides a class named Time to handle all the concepts related to the time
#Time stores times as a number of microseconds since the UNIX time epoch

puts Time.now() #Time class is equivalent to the Date class in javascript

#you can extend some classes to make them compatible fith your own custom methods

class Fixnum

	def minutes

		self*60 #the self term refers to the current object. Is the same as this in javascript or me in visual basic
	end

	def hours

		self*60*60
	end

	def days

		self*60*60*24
	end
end

#You can create an instance of a Time based on the current local time or in the GTM/UTC time as follow:

#Time.local(year, month, day, hour, min, sec, msec)
#Time.gm(year, month, day, hour, min, sec, msec)
#Time.utc(year, month, day, hour, min, sec, msec)

todayInSeconds = Time.gm(2015, 4, 2).to_i #converts a date to seconds represented in integers
todayInDate = Time.at(todayInSeconds) #this method converts the seconds to a date based on the UNIX epoch
puts "#{todayInDate.year()}, #{todayInDate.month()}, #{todayInDate.day()}"

#Time object methods used to access date/time attributes

# hour
# min
# sec
# usec
# day
# mday
# wday
# yday
# month
# year
# zone
# utc?
# gmt?

puts 22.class #returns Fixnum, and represents a easily manageble number
puts 99999999999999999999.class #return Bignum, and represents a fairly large number

#Ranges

rangeABC = ('A'..'Z')
puts rangeABC.class #this is an instance of a Range class
p x = rangeABC.to_a() #the .to_a method basically convert a range into an array

rangeABC.each { |e| print e } #you can print the items within a range by using its own .each{} method
puts rangeABC.include?('R') #You can use the Falseclass or Trueclass .include?() method to check if a range include a given value

p x[1..3] #you can select multiple elements on an array with various indeces like this.
          #you can use this structure to asign multiple values to an array at once

#Symbols are abstract references represented, typically, by a short string prefixed with a colon

p value = :value
p value = value.to_s #you can cast a symbol to a string and viceversa
p value = value.to_sym #here I'm casting an string into a symbol

p x = (1..10).to_a()
p y = x.join(' , ').scan(/./) #the scan method can be used as a getter too, it returns an array with all the matches

#OTHERS

my_array = (1..10).to_a 
p my_array.first(5), #gets the first 5 elements on an array
  my_array[0..4], #gets the first 5 elements on an array
  my_array[(my_array.length-1)-4..(my_array.length-1)], #gets the last 5 elements on an array
  my_array.last(5) #gets the last 5 elements on an array

i = 20
my_array = Array.new

loop do

  i -= 1
  #next if i.odd? #checks if a number is odd
  next if i % 2 == 0
   my_array << "#{i}"
  break if i <= 0
end

p my_array

my_array.length()

#the above statement is the most basic loop statement loop {next if <condition>; <statements>; break if <condition>}

=begin
puts "What is your name?"
name = gets.chomp #gets what the user writes on the console and holds it into the name variable
puts "What is your last name?"
last_name = gets.chomp
puts "Where do you live?"
city = gets.chomp
puts "Your name is #{name} #{last_name} and you are from #{city}"
=end

























