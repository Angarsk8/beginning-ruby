#Ruby on Rails Tutorial - Chapter #1 & #2

class Pet 

	attr_accessor :name, :age, :gender, :color
end

#Ruby is a purely object oriented language, so it's possible to create abstractions that represent different objects -
#so you can create a class named Pet that defines the attributes of an instance or object of that class. An example is shown above

class Cat < Pet

	def meow

		puts 'meoow!!'
	end
end

#The fact that ruby is OOP language, lets you make objects that inherent attributes and functionalities (Methods) from a -
#superior or parent class. An example is given above. It also shows how to create a method with the "def methodName -- end" -
#structure

class Dog < Pet

	def bark

		puts 'woof!!'
	end 
end

class Snake < Pet

	attr_accessor :length

	def tsss

		puts 'tsss!!'
	end
end

snake = Snake.new
cat = Cat.new
dog = Dog.new

snake.name = 'Danger'
snake.length = 10 #feets
cat.name = 'Catty'
dog.name = 'Doggy'

puts snake.name, cat.name, dog.name
puts 'the snake called ', snake.name, 'is ', snake.length, 'feet longer!!'
puts dog.bark, cat.meow, snake.tsss, 2.+(2), 2.class

#you can output the value of a variable (or just values) onto the screen by using the method puts; if you have several variables or values -
#you can output their values on a row by writing an expression like puts variable, variable, value, ... each variable must be defined previ-
#ously. 

#In Ruby everything is an Object even the numbers, so for instance 1 + 1 is just the addition of two objects of the class 'Fixnum' -
#using the method +, so 2 + 2 = 2.+(2), it's possible to reveal the class that a given object belongs to by using the default Ruby -
#method object_name.class.

#kernel is an special class (Module) and it provides methods that are available in every class and scope throughout Ruby. A clear example -
#of that is the puts method where you don't have to call the object first before using the method itself, such as Kernel.puts.

Kernel.puts ("Hello, world!")

#Even though you can use the method puts of the Kernel module by passing the parameter surrounded by single quotes '', the proper way -
#to pass parameter to any method is by surrounding them within brackets or parenthesis like shown above. you can omit the parenthesis -
#whenever the method to be used only receives a single parameter.

#Methods of the String Class

message = 'This is simple text' #this is actually an object of the String Class

puts message.length #length method return the length or number of characters of any String object
puts message.upcase #change the value of the message variable to upper case
puts message.downcase #change the value of the message variable to lower case
puts message.capitalize #Capitalize the value of the message String Object
puts message.chop #cut the last character of the message variable
puts message.reverse #reverse the content of the variable
puts message.swapcase #Swap the case of the message variable
puts message.upcase.reverse.chop #first change the case of the message variable to upper case, then reverse it and finally chop it.

def normalFunction 

	puts 'this is not a method, this is a procedure, function, routine or whatever'
end

normalFunction

#Even though Ruby is a purely OOP language you can use it as a procedural programming language, therefore you are not forced to define -
#methods within the bounds of a class, if you are not describing a functionality of an instance of a particular object of Class, you can -
#use functions or procedures outside classes as shown above. Is it possible to call a procedure just by writing its name.

puts Object.class






