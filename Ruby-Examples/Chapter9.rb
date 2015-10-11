#FILES AND DATABASES

#INPUT AND OUTPUT (I/O)

#I/O streams are the basis for all input and output in Ruby. Is a conduit or channel for input and output operations
#between one resource and another

#KEYBOARD INPUT 

a = gets #accepts a single line from the standard input, the keyboard in this case, and asign it to <a>	 
puts a

#standard input: keyboard
#standard output: screen

#>>ruby chapter9.rb < story.txt (print the first line of the file passed as an argument to the console)

b = readlines #read all the lines, line after line until a terminator (EOF - End Of File)
puts b

puts b.length

#-----------------------------------------------------------------------------------------------------------------------------------------

#FILE I/O

#OPENING AND READING FILES 

File.open('story.txt').each do |line|

	puts line
end #uses the File's class .open(<file.ext>) method in conjunction with .each {<block>} to print line by line
    #the content of the file.ext file.

File.new('story.txt','r').each do |line|
	
	puts line
end #similar to open, by this method specifies the procces involved (r - read)

#File.open can accept a code block, and once the block is finished, the file will be closed automatically
#File.new object referring to the file. To close the file, you have to use its close method.

File.open('story.txt') do |f|

	puts f.gets
end

#the above code opens the story.txt file and passes it into the block as f, puts f.gets takes a line of data
#from the file and prints to the screen.

k = File.new('story.txt', 'r')
puts k.gets
k.close

#The above code create an object refered to the story.txt file and stores it into the k variables
#then puts k.gets takes the whole object and print it to the screen
#and lastly closes the file

#-----------------------------------------------------------------------------------------------------------------------------------------

class MyFile

	attr_accessor :handle
	def initialize (file_name, mode = 'r')

		@handle = File.new(file_name, mode)
	end

	def gets_file_text

		@handle.gets
	end

	def close_file

		@handle.close
	end
end

my_file = MyFile.new('story.txt')
puts my_file.gets_file_text
my_file.close_file

#-----------------------------------------------------------------------------------------------------------------------------------------

File.open('info.txt').each do |line|

	puts line
end

File.open('info.txt').each(',') do |line| #you can read an I/O stream using a custom delimeter

	puts line	
end

File.open('info.txt').each_byte do |byte| #you can read an I/O stream using the each_byte method

	puts byte	
end

File.open('info.txt').each_char do |byte| #you can read an I/O stream using the each_char method

	puts byte	
end

File.open('info.txt') do |f| #this is how you use gets to read an I/O stream

	3.times do 

		puts f.gets #gets can also have an optional parameter (delimeter)
	end
end

puts File.open('info.txt').readlines.join('--') #open the info.txt file and read it completely, and then join each line into an string

puts File.readlines('info.txt').join('--') #the same as above

File.open('info.txt') do |f|

	puts f.read(6) #reads 6 bytes of the info.txt file
end

text = File.open('info.txt').readlines #read all the lines of the file and stores it into an array
p text
text = File.readlines('info.txt') #a shorthand of the above statement
p text
text = File.open('info.txt').read #real all the lines of the file and stores into an string
p text
text = File.read('info.txt') #the same as above, (opens a file in the read mode, returns an string with its content and then closes it)
p text

#-----------------------------------------------------------------------------------------------------------------------------------------

#YOUR POSITION WITHIN A FILE

my_file = File.new('info.txt', 'r')
puts my_file.pos #starts at 0 position (.pos method)
puts my_file.gets
puts my_file.pos #after a gets retrieve, it passes to 28!!
my_file.pos = 40 #the .pos method can also be a setter, to set the position within the file in bytes!
puts my_file.gets

#-----------------------------------------------------------------------------------------------------------------------------------------

#WRITING TO FILES

File.open("info.txt", "a") do |file| #by default the File.open is in read only mode, but you can specify it to be appendable too
									 #w means writteble, r readeble, r+ both things, a appendeble, a+ both things, etc

	file.puts "\nThis is a test!!" #the <file>.puts <text> literaly puts the text within the file 
end

new_file = File.new('info.txt', 'a')
new_file.puts Time.now
new_file.close

#-----------------------------------------------------------------------------------------------------------------------------------------

#RENAMING AND DELETING FILES

File.rename('info.txt', 'info2.txt') #renames the file
File.rename('info2.txt', 'info.txt')

#File.delete('<file1>', '<file-2>', '<file-3>', ..., '<file-n>') 
#File.unlink('<file1>', '<file-2>', '<file-3>', ..., '<file-n>')
#both functions allow you to delete a list of files passed as arguments

#-----------------------------------------------------------------------------------------------------------------------------------------

#FILE OPERATIONS

#CREATE FILENAMES PLATFORM-INDEPENDENTLY

x = File.join( File::SEPARATOR, 'full', 'path', 'here', 'filename.ext') #joins the elemnts to create an absolute path-
																		#independently of the OS; the File::SEPARATOR -
																		#is a constant that holds a path separator 
p x
p x.class #returns an string

puts File.expand_path('info.txt') #the File.expand_method expand the path or show the absolute path of a file

#SEEK

#IO::SEEK_CUR seeks a certain number of bytes ahead of the current position
#IO::SEEK_END seeks a postion based on the end of the file
#IO::SEEK_SET seeks to an absolute position on a file (identical to pos)

my_file = File.new('info.txt', 'r+') #the file is both writteble and readeble
my_file.seek(-5, IO::SEEK_END) #seek for the fifth byte from the end of the file and put the cursor there
my_file.putc '%' #putc puts a char in the current cursor
puts my_file.mtime #this can also be File.mtime('<file-name>')
my_file.close

#FINDING OUT WHEN A FILE WAS LAST MODIFIED

puts File.mtime('info.txt') #shows the last modification done on an specific file

#you can store that time into a variable and call its properties as follow:

my_times = File.mtime('info.txt')
puts my_times,
	 my_times.hour,
	 my_times.min,
	 my_times.sec

#CHECKING WHETER A FILE EXITS

puts "it exists!!" if File.exist?('info.txt') #File.exist? method returns true if a file exists!! :)

class MyFile

	attr_accessor :handle
	def initialize (file_name, mode = 'r')

		if File.exist?(file_name)

			@handle = File.new(file_name, mode)
		else

			false
		end
	end
end

#GETTING THE SIZE OF A FILE

puts File.size('info.txt')

#HOW TO KNOW WHEN YOU ARE AT THE END OF A FILE

my_file = File.new('info.txt', 'r+')

catch(:finish) do

	loop do 

		throw :finish if my_file.eof?
		puts my_file.gets
	end
end

my_file.close

#in the above code, I've looped until the end of my_file has been reached

#-----------------------------------------------------------------------------------------------------------------------------------------

#DIRECTORIES

#The class File handles files and the Dir class handles directories

Dir.chdir("../") #changes the directory to the one is inside the function
puts Dir.pwd #prints the information about the current directory
puts Dir.entries("Ruby-Examples/") #print all the files and sub-folders in the folder passed as an argument

#the foreach method does the same as the Dir.entries(<folder-path>) method but as an interator
Dir.foreach("Ruby-Examples/") do |file|

	puts file		
end

puts Dir['Ruby-Examples/*'] #this is another way! :)


Dir.mkdir("test_folder") unless Dir.exist?("test_folder")  #makes a directory
File.new('test_folder/my_new_file.txt', 'w')
Dir.delete("test_folder") if Dir.exist?("test_folder") && Dir['test_folder/*'].empty? #deletes a empty directory!

#if the directory is not empty you cannot delete it with the Dir.delete(<folder-path>)
#you can alternatively the following library:

require('fileutils')

FileUtils.rm_f('test_folder/')


#-----------------------------------------------------------------------------------------------------------------------------------------

#Creating Files In The Temporary Directory

require('tmpdir') #the library to make Dir.tmpdir available

temp_file_name = File.join(Dir.tmpdir, "test_file.txt")
test_file = File.new(temp_file_name, 'w')
test_file.puts("This is a test")
test_file.close
File.delete(temp_file_name)

require('tempfile') #another library to use the temporary directory

my_file = Tempfile.new("file.txt") #create a new temporal file
my_file.puts "Hello"
puts my_file.path #prints the path
my_file.close































