#Text Analizer Application

#Your text analyzer will provide the following basic statistics:
=begin
	character count
	character count excluding spaces
	line count
	word count
	sentence count
	paragraph count
	average number of words per sentence
	average number of sentences per paragraph
=end

#Workflow
=begin
	1. Load in a file containing the text or document you want to analyze.
	2. As you load the file line by line, keep a count of how many lines there were (one of your
	statistics taken care of).
	3. Put the text into a string and measure its length to get your character count.
	4. Temporarily remove all whitespace and measure the length of the resulting string to get the character count excluding spaces.
	5. Split out all the whitespace to find out how many words there are.
	6. Split on full stops to find out how many sentences there are.
	7. Split on double newlines to find out how many paragraphs there are.
	8. Perform calculations to work out the averages.
=end

#Ruby provides a comprehensive set of file manipulation methods via the File Class

def  print_text_statistics (text)

=begin
		text = ''
		line_count = 0
		File.open("text.txt").each do |line|

			line_count += 1
			text << line
		end #Here I'm using the File class's .open(dir) to open up a file
		    #that is located at an specific directory and then I'm looping
		    #trough its content with a .each{} method.
		#puts "#{line_count} lines"
=end

	#the File class has a method that allows you to read the lines on a text file more efficiently
	#it has the .readlines(dir); this method returns an array with the readed file
	stop_words = %w{the a by on for of are just with but and to the my I has some in}
	line = File.readlines(text[0]) #receives the parameter passed on the command line and holds it into the first 
	                               #position of the ARGV array. This is an special array
	line_count = line.size
	text = line.join
	total_characters = text.length
	total_characters_nospace = text.gsub(/\s+/,'').length
	word_count = text.split.length
	paragraph_count = text.split(/\n\n/).length
	sentence_count = text.split(/\?|\.|!/).length
	all_words = text.scan(/\w+/)
	good_words = all_words.select {|word| !stop_words.include?(word)} #the .select method can be applied to arrays,
																	  #hases and ranges and is used to return an object of those types
																	  #that stiesfied the conditional statement written whithin the blockb (it's a filter)
	good_percentage = ((good_words.length.to_f/all_words.length.to_f)*100).to_i
	sentences = text.gsub(/\s+/,' ').strip.split(/\?|\.|!/) #strip deletes the first and the last blank strip of spaces
	sentences_sorted = sentences.sort_by { |sentence| sentence.length } #sort an array, hash or range, by defining 
	                                                                    #a condition whithin the block. array.sort_by { |item| <condition> }
	one_third = sentences_sorted.length/3
	ideal_sentences = sentences_sorted.slice(one_third, one_third + 1).select { |sentence| sentence =~ /is|are/}

	puts "#{line_count} lines"
	puts "#{total_characters} characters"
	puts "#{total_characters_nospace} characters (excluding spaces)"
	puts "#{word_count} words"
	puts "#{paragraph_count} paragraphs"
	puts "#{sentence_count} sentences"
	puts "#{(sentence_count/paragraph_count).to_f} sentences per paragraph (average)"
	puts "#{(word_count/paragraph_count).to_f} words per paragraph (average)"
	puts "#{good_percentage}% of words are non fluff-words"
	puts "Summary:\n\n#{ideal_sentences.join('.')}"
	puts "-- End of analysis"

end

#bash command to rename a file mv "current_name.ext" "new_name.ext" 

=begin 
	def fib(n)
		num = 1
		if n > 1

			num = fib(n-1) + fib(n-2)
		end

		num
	end

	puts fib(10) 
=end #Fibonacci Example

print_text_statistics(ARGV)









