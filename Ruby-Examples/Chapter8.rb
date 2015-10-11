#DOCUMENTATION, ERROR HANDLING AND DEBUGGING

#generating documentation with ruby Rdoc (document generator for ruby source)

#It’s a tool that reads through your Ruby source code files and creates structured HTML documentation.

#this class stores information about people

#==Heading
#* Unordered-*List*(bold)
#  * Nested-_UL_(italic)
#
#--
#This wont be show because the -- has disabled the rdoc tool
#++
#This will appear because the rdoc tool has been enabled with the ++ key

class Person 

	attr_accessor :name, :age, :gender

	#create the person object and stores it's name
	def initialize (name)

		@name = name
	end

	#prints the person's name to the screen
	def print_name

		print "My name is #{@name}"
	end

	def talk #:nodoc:

		print "Hello!!"
	end
end

#MODIFIERS AND OPTIONS

#:nodoc: avoids documentation
#:nodoc: all avoids documentation for all the elements within another one

#COMMAND LINE TOOLS
#>>rdoc --all (usually rdoc only document public methods but you can use the --all command to document all methods)
#>>rdoc --fmt <format-name> (produce documentation in a certain format xml, yaml, chm, pdf)
#>>rdoc --help 
#>>rdoc --inline-source
#>>rdoc --main <name>
#>>rdoc --one-file
#>>rdoc --op <dir-name>

#DEBUGING AND ERRORS

#EXCEPTIONS AND ERROR HANDLING

#An exception is an event that occurs when an error raises within a program.
#An exception can cause the program to quit immediately with an error message, or can be handled by error- 
#handling routines within the program to recover from the error in a sensible way.

#RAISING EXCEPTIONS
#In ruby exceptions are packaged into objects of class Exception or one of Exception's many subclasses.
#Ruby has about 30 main predefined exception classes that deal with different types of errors, such as
#NoMemoryError, RuntimeError, SecurityError, ZeroDivisionError and NoMethodError.

#When an exception is raised (exceptions are said to be raised when they occur within the execution of a program), Ruby immediately
#looks back up the tree of routines that called the current one (known as the stack) and looks for a routine that can handle that
#particular exception. If it can’t find any error-handling routines, it quits the program with the raw error message.

#10/0 #raises a ZeroDivisionError exception

class Person

	attr_accessor :name
	def initialize(name)

		raise ArgumentError,  "No name present" if name.empty?
	end
end

#me = Person.new('')


class BadDataException < RuntimeError
end

class Person

	attr_accessor :name
	def initialize(name)

		raise BadDataException,  "No name present" if name.empty?
	end
end

#me = Person.new('')


#HANDLING EXCETION

#in ruby the rescue clause is used along with begin and end, to define blocks of code to handle exceptions.
#once an error raises within a program the program will inmediately search the stack to find an error handler
#routine to manage the exception!

begin
	
	10/0
rescue Exception => e
	
	puts "You shouldn't do that!! #{e.message}"
end

#The above example is how the begin rescue end is used to define blocks of code to handle the divided by 0 exception!!

#you can "rescue" different types of excpetions as follow

begin

	10/0
rescue ZeroDivisionError

	puts "you cannot divided by zero!!"
rescue BadDataException

	puts "whatever"
rescue

	puts "irrelevant..."
end

#HANDLING PASSED EXCEPTIONS!

begin

	10 - "a"
rescue Exception => e #here we are passing to the rescue block any type of exception!

	puts e.class
end

#CATCH AND THROW!

#They’re designed to be used in situations where no error has occurred, but being able to escape quickly from a nested loop,
#method call, or similar, is necessary.

catch(:finish) do

	1000.times do 

		x = rand(1000)
		throw :finish if x == 123
	end

	puts "generated 1000 numbers without the number 123"
end

#catch serves as a scope to seek when the program throws a :finish statement within the catch block! if so it breaks the catch scope.
#catch and thrown don’t have to be directly in the same scope!!

def generate_random

	x = rand(100)
	throw :finish if x == 123 #this is out of the catch scope but still causes the catch block to break up if x === 123
end

catch(:finish) do

	1000.times {generate_random}
	puts "generated 1000 numbers without the number 123"
end

#THE RUBY DEBUGGER 

#debugging is the process of fixing the bugs in a piece of code.

#>>ruby -r debug <file-name>.rb #uses the debug tool to run the program in debug mode
#list x-y (Lists the lines of the program currently being worked upon)
#step <n-times> (Runs the next line of the program n-times)
#cont (Runs the program without stepping Execution will continue until the program ends,
	   #reaches a breakpoint, or a watch condition becomes true)
#break <line-number> (Sets a breakpoint at a particular line number)
#watch <contional-statement> (Sets a condition breakpoint. Rather than choosing a certain line upon which to stop,
							  #you specify a condition that causes execution to stop)
#quit (exits the debugger)

#TESTING

#THE PHILOSOPHY OF TEST-DRIVEN-DEVELOPMENT

#it's a technique where developers create a set of tests for a system to pass before coding the system itself, 
#and then rigidly use these tests to maintain the integrity of the code.

class String

	def titleize

		self.gsub(/(\A|\s)\w/) { |word| word.upcase }
	end
end

raise "Fail 1" unless "this is a test".titleize == "This Is A Test"
raise "Fail 2" unless "test driven development 123".titleize == "Test Driven Development 123"
raise "Fail 3" unless "it's a test driven development".titleize == "It's A Test Driven Development"

#UNIT TESTING

#ruby comes with a library Test::Unit, that makes testing easy and organizes test cases into a clean structured!
#Unit testing is the primary component of the test-driven-development philisophy.
#Means that you’re testing each individual unit of functionality within a program or system.
#one of the benefits of Unit::Test is that it gives you a standardized framework for writing and performing tests.
#Rather than writing assertions in an inconsistent number of ways.


require('test/unit') #import the unit/test library

class TestTitleize < Test::Unit::TestCase #create a TestTitleize class to perform my test, inheriting all from Test::Unit:Testcase

	def test_basic #the testbasic method performs the test

		assert_equal('Hi I Am Andres', 'hi i am andres'.titleize) #uses the assert_equal assertion to compare the input and the ouput evaluation
		assert_equal('Hey It Is Me', 'hey it is me'.titleize)
		assert_equal('No It Is Not Me', 'no it is not me'.titleize)
	end
end

puts Test.class, #module
     Test::Unit.class, #module
     Test::Unit::TestCase.class #class

#MORE TEST:UNIT ASSERTIONS

#assert(<boolean expression>)
#assert_equal(expected, actual)
#assert_not_equal(expected, actual)
#assert_raise(exception_type, ..){<code_block>}
#assert_nothing_raise(exception_type, ..){<code_block>}
#assert_instance_of(exception_type, ..){<code_block>}
#flunk

#BENCHMARK AND PROFILING

#Benchmarking is the process in which you get your code or application to perform a function (often many hundreds of 
#times in succession to average out discrepancies), and the time it takes to execute is measured. 
#You can then refer to these times as you optimize your code. If future benchmarks run faster than previous ones,
#you’re heading in the right direction. Luckily, Ruby provides a number of tools to help you benchmark your code.

#SIMPLE BENCHMARKING

#ruby standard libraries provide a benchmark library that provides several methods that measures the speed it takes
#the code you provide

require('benchmark') #loading the benhmark library into the current project

puts Benchmark.class #Module
puts Benchmark.measure { 10.times{ print '.' } } #uses the Benchmark's module .measure { <code> } method to measures
												 #the time of execution of what is inside the block


iterations = 1000

a = Benchmark.measure do
	
	iterations.times do |i|

		x = i
	end
end

b = Benchmark.measure do

	for i in 1..iterations

		x = i
	end
end

c = benchmark.measure do
	
	(1..iterations).each do |i|

		x = i
	end
end

puts "times: #{a}"
puts "for: #{b}"
puts "each: #{c}"

Benchmark.bmbm do |bm| #this allows us to perform multiple benchmarks at once in a very structured and tidy way
					   #the double bm perform a rehearsal before the actual benchmark

	bm.report("times: ") do #this allows us to define a report for the benchmark being performed

		iterations.times do |i|

			x = i
		end
	end

	bm.report("for: ") do

		for i in 1..iterations

			x = i
		end
	end
end

#PROFILING

#Profiling tells you what code is the taking what amount of time, it's conceptually the holy grail of optimization!!

require "profile"

class Calculator

	def self.count_to_high_number

		x = 0
		100000.times { x+= 1}
	end

	def self.count_to_small_number

		x = 0
		100000.times { x+= 1}
	end
end

Calculator.count_to_high_number
Calculator.count_to_small_number