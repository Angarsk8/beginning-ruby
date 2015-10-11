#PROJECTS AND LIBRARIES

#PROJECTS AND USING CODE FROM OTHER FILES

require('rubygems')
load 'external_file.rb' #loads the code of the string_extensions.rb file into the current scope or file
    					#I could have used require instead of load, but without the .rb extension
						#Both can take local or absolute filenames

puts "Hello from the current file"
load 'external_file.rb' #when you load a file the program reprocess the file again,
  			            #on the other hand require only processes the file once!
puts 'Hello again from the current file'

puts "andres alejandro garcia hurtado".vowels.join('-') #uses the .vowels method defined in the external file

#INCLUSION FROM OTHER DIRECTORIES

#require 'file' first look in the current directory, and then iterate through a multitude of other directories in-
#your hard drive looking for 'file.rb'. By default these other directories are various directories were ruby stores
#its own files and libraries

#ruby stores the list of directories to search for included files in an special variable called $: or $LOAD_PATH

$:.each do |dir|

	puts dir
end

p $: #array that contains all the directories to search for included files 

#if you want to add extra directories you do it by pushing or unshifting the path to the $LOAD_PATH object
=begin

	#$:.push('your/directory/here')
	#require 'yourfile'

=end

#LOGIC AND INCLUDING CODE!

#both load and include act like normal code in your ruby program

=begin

	$debug_mode = 0
	require $debug_mode == 0 ? "normal-classes" : "debug-classes" #ternary operator applied to asign a require statement

	#a commomn shorcut to load or require multiple files at once is by loading the files into a array and the loopin trough it: 

	%w{file1 file2 file3 file4 file4 file5}.each do |file|

		require file		
	end

=end

#NESTED INCLUSIONS (Having require and load statements within other external files)

#LIBRARIES

#In computer programming, a library is a collection of routines that can be called by separate programs but that exist independently of those
#programs

#STANDARD LIBRARIES

#net/http Library

#HTTP stands for HyperText Transfer Protocol, and it’s the main protocol that makes the World Wide Web work, as it provides the mechanism by 
#which Web pages, files, and other media can be sent between Web servers and clients. ruby provides basic support trough this library.

require('net/http') #requires this library
Net::HTTP.get_print('www.rubyinside.com', '/') #uses the HTTP subclass provided in the namespace of the Net module, and it's using the 
                                               #get_print HTTP class's method to print the html content of the passed url!

url = URI.parse('http://www.google.com/') #uses the .parse('http://url') (of the URI module of the URI library that's
                                          #loaded in the net/htttp library) to decipher a url into its constituent parts 
										  #for the net/http library to use to make its request.
puts URI.class #module!

response = Net::HTTP.start(url.host, url.port) do |http| #once the url has been parsed an HTTP connection is started, and within the scope of
														 #that connection a GET request is made with the get method.

	http.get(url.path)
end

p response.body #finally, retrieves the content from response.body, a string containing the contents of the passed web page

#OpenStruct class and the ostruct library

#the OpenStruct class provided by the ostruct library allows you to create data objects without specifying the attributes, and allows you
#to create attribute on the fly

require 'ostruct'

Person = OpenStruct.new #OpenStruct is a class that belongs to the ostruct library, that allows you to create empty data objects
Person.name = "Alejandro"
Person.last_name = "Garcia"

puts Person

#RUBYGEMS

#RubyGems is a packaging system for Ruby programs and libraries. It enables developers to
#package their Ruby libraries in a form that’s easy for users to maintain and install. RubyGems
#makes it easy to manage different versions of the same libraries on your machine, and gives
#you the ability to install them with a single line at the command prompt.
#Each individually packaged Ruby library (or application) is known simply as a gem or
#RubyGem. Gems have names, version numbers, and descriptions. You can manage your computer’s
#local installations of gems using the gem command, available from the command line.
#RubyGems comes standard with Ruby 1.9, but it was not included with distributions
#of Ruby 1.8 (except in certain situations, such as with the default installation of Ruby on
#Mac OS X).

#>>gem -v (shows the version of the rubygems packaging system installed)
#>>gem list (shows the list of gems installed)
#>>gem list --remote (shows the list of remote gems available for download)
#>>gem query --remote --name-matches <criteria> (searches for a <criteria> related gem available to download remotely)
#>>gem install <gem-name> (This is the command used to install a gem: sudo might be used to install a gem in UNIX related systems)

#USING GEMS

#As the RubyGems system isn’t an integrated part of Ruby, it’s necessary to tell your programs
#that you want to use and load gems.
#When RubyGems is loaded on the first line, the RubyGems library overrides
#the require method and enables it to be used to load gems as if they were normal, local
#libraries.

require('rubygems')
require('RedCloth')

r = RedCloth.new("this is a *test* of _using RedCloth_")
puts r.to_html

#Installing a More Complex Gem

#Hpricot is an HTML/Web page processing library for Ruby that uses a parser written in C
#for speed. This requires the C code to be compiled, and although C compilers are commonly
#available on Unix/Linux and Mac OS X machines, they’re less common on Windows machines

require 'hpricot'

puts "hpricot was succesfully installed!!" if defined?(Hpricot)

#Upgrading and Uninstalling Gems

#>>gem update #This makes RubyGems go to the remote gem repository, look for new versions of all the gems you currently have installed ,
              #and if there are new versions, install them 
#>>gem unistall <gem-name>
