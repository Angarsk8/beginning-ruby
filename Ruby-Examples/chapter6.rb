#object orienation basics
#a class is a blueprint for objects. an object is an instance of a class
#those are styles that allows the representation of concepts instead of simple task or routines


class Square

	def initialize(side_length)

		@side_length = side_length 
	end

	def area 

		@side_length * @side_length
	end
end 

#the first method of the Square class is an special method that initialize an instance of itself
#by passing the side_length argument to the @side_length instance variable or property

x = 10

def print_x

	#puts x #this throws an error since x has not been declared within the print_x scope
end

print_x
puts x

#the above example demonstrate that local variables only live in their original scope. In the scope
#they were originally created

$y = 12

def print_y

	puts $y #on the other hand this method doesn't throw any error because the variable putted has been
	        #declared globally. You declared global variable using the $ symbol before the variable
end

print_y
puts $y

#global variables live everywhere within an application, including classes and objects
#it's not a good practice to use global variables since they can make you dependant on them
#it's better to avoid them as much as possible

class Square

	def initialize(side_length)

		@side_length = side_length #@side_length is an object variable since it only has scope within the object
		                           #and it's related to an instance of that class; they are private by nature
		                           #so you cannot access to them outside the class unless you set them to do so.
	end

	def area 

		@side_length * @side_length
	end
end 
#object variables (also known as instance variables) are so named because they have scope within,
#and are associated to, the current object. they are prefixed by the @ symbol.

class Square

	@@squares_numbers = 0 #declares a class variable initialized in 0

	def initialize (side_length)

		@side_length = side_length
		@@squares_numbers += 1 #every time an Square instance is created the @@squares_numbers class variable
							   #increments by one, this remains in memory.
	end
end

#the scope of a class variable is within a class, and is prefixed by the @@ symbol
#it remains in the memory of the class

class Test

	def test_method

		puts "Hello from an instance" #this is an instance method; it describes the behaviour of an instance
									  #of the Test class; they're public by nature
	end

	def self.test_method #self could be replace by Test, the name of the current class

		puts "Hello from a class" #a class method is prefixed with the self keyword
								  #that refers to the actual object
	end
end

Test.test_method #calling the Test class's test_method
Test.new.test_method #calling the Test new instance's test_method

#the above example demonstrates the difference between class methods and instance methods
#class methods can be invoked directly through the class while an instance method must be re
#ferenced trough an object, it must be declared first

class Sample

	def initialize(name)

		if defined?(@@counter) #the defined?(variable) allows to check whether a variable has been declared 
			                   #or not

			@@counter += 1
		else

			@@counter = 1
		end
	end

	def self.print_count

		puts @@counter
	end
end

a = Sample.new("a") #the ClassName.new(arguments) is the way of creating an instance of a class in Ruby
b = Sample.new("b")
Sample.print_count #this expression print the value of the Sample class's @@counter variable

#Inheritance

#allows to generate the taxonomy of classes and objects. view Inheritance.png
#each level down is more specific and targeted than that above it.

#classes lower down the hierachy get the feature of those classes higher up, but can also add specific
#features of their own
#classes can inherit the features and functionality of another class, but can only inherit from a single
#other class

class ParentClass #general class

	def method_1

		puts "Hello from the ParentClass method_1"
	end

	def method_2

		puts "Hello from the ParentClass method_2"
	end
end

class ChildClass < ParentClass #specific class derived from a general class

	def method_2

		puts "Hello from the ChildClass method_2"
		super #this uses a name method provided on a higher up class in the inheritance chain
		      #using super looks up the inheritance chain and calls the method of the same name
		      #on the next highest class
	end
end

child_object = ChildClass.new()
child_object.method_1 #this method is inhereted from the ParentClass
child_object.method_2 #this method overrides the ParentClass method_2, because it searches up the hierarchy,
                      #traversing the taxonomy of the object and its class

#DRY DON'T REPEAT YOURSELF (Part of the ruby philosophy)

#Overriding existing classes

=begin

	class String

		def length

			20
		end
	end

	puts "Hola".length #in the above example I've overrided the generic String class to set the length of any
	                   #String, no matter what its real length is. This is heavily dangerous!!
=end

#you can override your own classes by opening the class and redefining the method just in the exact same way
#as I did in the last example. reopening classes is a unique feature of Ruby!!

puts "Hola".respond_to?('length') #the Object.respond_to?('method') is used to check whether an object
                                  #can use or respond to a given method! useful method, returns a boolean

#Reflection and discovering an Object's methods!
#Reflection is the process by which a computer program can inspect, analyze, and modify itself while it’s
#running and being used

p String.methods #the Object.methods method is a method that returns an array of all methods available
                 #for Object, This means the methods that can be used on that object!!

 #the are some other reflective methods like Object.public_methods, Object.private_methods, Object.protected_methods
 #Object.instance_variables, etc (Object can be a class or an instance of a class)

class Animal

	#attr_accessor :name,:age,:type 
	@@counter = 0

	def initialize(name, age, type)

		@name = name
		@age = age
		@type = type
		@@counter += 1
	end
end

p Animal.new("Andrés",22,"Human").instance_variables #return an array of the instance variables, 
                                                     #no matter what the restrictions of the variable are
p Animal.class_variables #return an array of the class variables

#Encapsulation

#Encapsulation is the ability for an object to have certain methods and attributes available for use publicly
#(from any section of code), but for others to be visible only within the class itself or by other objects of
#the same class. 

class Person

	attr_accessor :first_name,:last_name #this is a way of encapsulation, where these two instance variables
	                                     #has been defined in a way that can be both writed and readed
	                                     #another option is attr_writer and attr_reader

	def initialize (first_name, last_name, age)

		@first_name = capitalized_name(first_name)
		@last_name = capitalized_name(last_name)
		@age = age
	end

	private #this is encapsulating privately the capitalized_name method, so it can be only used within the class
	def capitalized_name(name)

		name.capitalize
	end

	public #this is encapsulating publicly the print_name method, so it can be used by an instance of Person
	def print_me

		puts "My name is #{@first_name} #{@last_name} and I'm #{@age} years old"
	end

	#this is also encapsulated publicly because it's within the public keyword
	def set_name(first_name, last_name)

		@first_name = capitalized_name(first_name)
		@last_name = capitalized_name(last_name)
	end

	def age

		@age
	end

	def age_difference(other)

		self.age - other.age
	end

	protected :age
end

me = Person.new('andrés', 'garcía', 22)
other = Person.new('Marly', 'Jaramillo', 31)
puts me.age_difference(other)
me.print_me
me.set_name('Alejandro', 'Hurtado')
me.print_me

#another way of method encapsulation is as follow
# private :capitalized_name
# public :print_name, set_name
#this must be done after the methods definition

#protected is another keyword for encapsulating methods, it makes a method private but within
#the scope of a class rather than within a single option

#Polymorphism

#Is the concept of writing code that can work with objects of multyple types and classes at once.
#For example the + method works for adding numbers, joining strings and adding arrays together.

class Animal
	attr_accessor :name
	def initialize (name)
		@name = name
	end
end

class Cat < Animal
	def talk
		puts "Meoow"
	end
end

class Dog < Animal
	def talk
		puts "Woof"
	end
end

animals = [Cat.new('Misi'), Dog.new('Ruffo'), Cat.new('Mossy')]
animals.each{ |animal| animal.talk()}

#In the above example is shown how polymorphism works, you have three diferente classes -
#two of them have the same methods, but they both are related to different instances of their classes

puts 1000.to_s 
puts [1, 2, 3, 4].to_s
puts ({name: 'Andrés', last_name: 'García'}).to_s

#The above example is another polymorphimic case, the same method applied to different type of objects

#Nested classes

#these are classes defined within other classes; those classes are used when a class is needed within
#another class but aren't useful anywhere else.
#Nested classes are defined as usual, you can acces them directly within the container class, but from-
#the outside you can only access them like ContainerClass::InnerClass

class Drawing
	def self.give_me_a_circle
		Circle.new
	end

	class Line
	end
    
	class Circle
		def what_am_i
			puts "I'm an a #{self.class}"
		end
	end
end

circle = Drawing.give_me_a_circle
circle.what_am_i
another_circle = Drawing::Circle.new #Here we're defining a circle object whose class was defined within drawing
another_circle.what_am_i

#The scope of constants
#special variables whose value remains constant troughout the whole program (Unchanging values)
#these special variables are capitalized. PI is an example of a constant.
#Constants seem to work as global variables but they don't, constants are defined within the scope of
#the current class and are made available to all child classes unless they're overriden

PI = 3.141592

def print_PI

	puts PI
end

class ThisWorld

	def print_PI

		puts PI
	end
end

class AnotherWorld

	PI = 4.1234

	def print_PI

		puts PI
	end
end

puts PI
print_PI
ThisWorld.new.print_PI
AnotherWorld.new.print_PI

#MODULES, NAME-SPACES AND MIXINS

#Modules provides an structure to collect ruby classes, methods and constants into a single separately and 
#defined unit. this is useful so you can avoid clashes with existing classes, methods, and constants, and 
#also so that you can add (mix in) the functionality of modules into your classes.
#First, we’ll look at how to use modules to create namespaces to avoid name-related clashes.

#NAMESPACES

#One common feature used in Ruby is the ability to include code situated in other files into the current
#program (this is covered in depth in the next chapter). When including other files, you can quickly run 
#into conflicts, particularly if files or libraries you’re including then include multiple files of their own.
#You cannot guarantee that no file that’s included (or one that’s included in a long chain of includes) will 
#clash with code you've alredy written or processed

#require is a ruby statement used to load in code contained within another file.
#if you have two methods defined in different files and named equally, and you're requiring both files
#and you want to use one specific method, then the program won't know which one to use!! it'll use the
#one whose file was required later. This problem is well know as name conflict. classes can clash
#similarly. Modules help to solve these problems by providing NAMESPACES that can contain any number of 
#classes, methods and constants, and allow you to address them directly as shown below!

module NumberStuff

	def self.random

		rand(1000)
	end

	def random

		rand(1000)
	end
end

module LetterStuff

	def self.random
		(rand(25)+65).chr
	end
end

include NumberStuff
puts random
puts NumberStuff.random
puts LetterStuff.random

#modules look like classes but in reality you cannont create any instance of a module nor have inheritance.
#they're like special fixed classes. Modules simply provide ways to organize methods, classes, and constants
#into separate namespaces.

module ToolBox

	class Ruler

		attr_accessor :name
	end
end

module Country

	class Ruler

		attr_accessor :name
	end
end

new_toolbox = ToolBox::Ruler.new #this is using the Ruler class defined whithin the namespace of the
                                 #ToolBox module
new_toolbox.name = "Andrés"
puts new_toolbox.name
new_country = Country::Ruler.new
new_country.name = "García"
puts new_country.name

#MIX-INS

#This solves the problem of single inheritance in ruby, this actually allows kinda multiple inheritance!!
#modules act like a sort of “super” class and can be included into other classes, extending that class with 
#the methods the module offers. For example:

module UsefulFeatures

	def class_name

		self.class.to_s
	end

	def do_stuff

		puts "This is a test that shows the use of modules included in the current scope"
	end
end

class Other

	include UsefulFeatures #here we've used the included keyword to include the features of the module UF
end

me = Other.new
puts me.class_name

#modules are organizational tools rather than classes themselves
include UsefulFeatures #this expression is necessary to use the features of this module in the current scope
do_stuff #here's shown how to use the module in the current scope!!
UsefulFeatures.do_stuff #this is another way of using the do_stuff method within the UF module, this gives it a
                        #a namespace a make this method distinct to any other method called like that!

def maxim(*args)

	max_number = 0

	args.each do |number|

		number = number.to_i
		max_number = number > max_number ? number : max_number
	end

	max_number
end #example: calculating the max number on a array

puts maxim(1,2,3,4,5)

#THE ENUMERABLE MODULE

#However, the Array class has pre-included the methods provided by the Enumerable module.
#a module that supplies about 20 useful counting and iteration related methods, including collect
#detect, find, find_all, include?, max, min, select, sort and to_a

class AllVowels

	include Enumerable
	@@vowels = %w{a e i o u}
	def each

		@@vowels.each{|y| yield y}
	end
end

all_vowels = AllVowels.new
all_vowels.each {|vowel| puts vowel}
p all_vowels.select{|vowel| vowel != 'a'} #Because you included the Enumerable module, now you can use its
      									  #features

#COMPARABLE

#The comparable module provides methods that give other classes comparisson operators

class Song

	include Comparable
	attr_accessor :length

	def <=>(other)

		self.length <=> other.length
	end

	def initialize (name, length)

		@name = name
		@length = length
	end
end

first = Song.new('Black Bird', 3*60)
second = Song.new('Time', 4*60)
third = Song.new('Telephone', 2*60)
puts first <=> second #here we've used the Comparable module to extend the functionality of a class
                      #by providing it relational methods and operators!!
puts first > second, second > third, first === second, first.between?(third, second) #Comparable

#Struct: quick and easy data classes

#is an special class hose only job is to have attributes and to hold data

FamilyMember = Struct.new(:name, :age) #these attributes are accessible by default
jorge = FamilyMember.new('Jorge', 34)
beto = FamilyMember.new('Iván', 29)
lilian = FamilyMember.new('Lilian', 30)
marly = FamilyMember.new('Marly', 32)
puts marly.name