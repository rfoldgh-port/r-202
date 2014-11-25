require "sinatra"     # Load the Sinatra web framework
require "data_mapper" # Load the DataMapper database library
require "sinatra/reloader" if development?
require 'open-uri'
require 'nokogiri'
require 'rubygems'
 
require "./database_setup"
 
 
 
class Message
  include DataMapper::Resource
 
  property :id,         Serial
  property :body,       Text,     required: true
  property :created_at, DateTime, required: true
 
 
  has n, :comments
end
 
class Comment
  include DataMapper::Resource
 
  property :id, Serial
  property :body, Text
  property :created_at, DateTime
  property :responseToComment, Text
  property :responseImage, Text
  property :responseImage2, Text
  property :commentType, Text
  belongs_to :message
end

DataMapper.finalize()
DataMapper.auto_upgrade!()

############################################################################################
 
@testArray1 = ["CCSF","Fall 2014","Undergrad","Computers","Computer_Science","Intro_Java_Script","Tues-Thurs","7:00PM"]
 

 
class ClassData
    include DataMapper::Resource
    
    property :id, Serial
    property :Institution, Text
    property :Semester, Text
    property :Level, Text
    property :Category, Text
    property :Department, Text
    property :ClassName, Text
    property :Days, Text 
    property :Time, DateTime
    
end

DataMapper.finalize()
DataMapper.auto_upgrade!()

#<ClassData @id=nil @Institution=nil @Semester=nil @Level=nil @Category=nil @Department=nil @ClassName=nil @Days=nil @Time=nil>


def loadDataFromArray()
    class_data = ClassData.new
    class_data.Institution = @testArray1[1]
    class_data.Semester = @testArray1[2]
    
    class_data.Level = @testArray1[3]
    class_data.Category = @testArray1[4]
    class_data.Department = @testArray1[5]
    class_data.ClassName = @testArray1[6]
    class_data.Days = @testArray1[7]
    class_data.Time = @testArray1[8]
    class_data.save

end

#loadDataFromArray()

#puts ClassData.all[8].attributes
#exit
#puts ClassData.first.inspect

#for i in 1..3 do  
 #  loadDataFromArray(i) 
#end
#########################################################################################################
    type = rand(3)
    
    puts "I will now count my chickens"
    puts "Hens", 25 + 30 / 6
    puts "Roosters", 100 - 25 + 3 % 6
    puts "Now I will count the eggs"
    puts 3 + 2 + 1 - 5 + 4 % 2 - 1 / 4 + 6
    puts "Is is true that 3 + 2 < 5 - 7"
    puts 3 + 2 < 5 - 7 
    
    cars = 100
    space_in_car = 4.0
    drivers = 30
    passengers = 90
    cars_not_driven = cars - drivers
    cars_driven = drivers
    carpool_capacity = cars_driven * space_in_car
    average_passengers_in_car = passengers / cars_driven
    
    puts "There are #{cars} available"
    puts "There are only #{drivers} available"
    puts "There will be #{cars_not_driven} empty cars available"
    
    puts "Hello World"
    
    #+++++++++++++++++
    
    html_doc = Nokogiri::HTML("<html><body><h1>Mr. F Fan Club </h1></body></html>")
    xml_doc = Nokogiri::XML("<root><aliens><alien><name>Abby</name></alien></aliens></root>")
    
    puts html_doc
    puts xml_doc
    
    f = File.open("./views/index2.erb")
    
    testDoc = Nokogiri::HTML(f)
    
    f.close
    
    puts testDoc
    
    my_name = 'Richard' 
    my_age = 40 #Not a lie
    my_height = 74
    
    puts "Lets talk about %s" % my_name
    puts "Hes %d inches tall" % my_height
    
    puts "If I add %d and %d I get %d." % [my_age, my_height, my_age + my_height]
    
    testDoc2FromURL = Nokogiri::HTML(open("https://www.ccsf.edu/Schedule/Fall/computer_science.shtml"))
  
    testDoc3FromURLOptions = Nokogiri::HTML(open("https://www.ccsf.edu/Schedule/Fall/computer_science.shtml")) do |config|
      config.strict.noblanks
    end
    
    #page = Nokogiri::HTML(RestClient.get("https://www.ccsf.edu/Schedule/Fall/computer_science.shtml/"))
    
    #page.class     
    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'
    
    PAGE_URL = "http://ruby.bastardsbook.com/files/hello-webpage.html"
    
    page = Nokogiri::HTML(open(PAGE_URL))
    
    puts page.css('title')
    
    puts page.css('title')[0].name
    puts page.css('title')[0].text
    
    PAGE_URL2 = "https://www.ccsf.edu/Schedule/Fall/computer_science.shtml"
    
    page2 = Nokogiri::HTML(open(PAGE_URL2))
    
    puts page2.css('title')
    
    puts page2.css('title')[0].name
    puts page2.css('title')[0].text
    
    puts "00 Method"
    
    links = page2.css('a')
    
    puts page2.css('a')[1].text
    
    puts page2.css('a')[1]
    
    puts "0 Method"
    
    puts links[1].text
    
    puts links[1]
    
    puts "FIRST METHOD"
    
    CCSF_IS_Category = page2.css('a[name="Information_Science"]')
    
    puts CCSF_IS_Category[0].text
    
    puts "SECOND METHOD"
    
    ISLINKS = page2.css("a").select{|link| link['name'] == "Information_Science"}
 
    puts ISLINKS[0].text
    
    puts "THIRD METHOD"
    
    AllH2 = page2.css("h2")
    
    puts AllH2[0].text
    puts AllH2[2].text
    
    puts "4TH METHOD"
    
    puts AllH2
  
    puts "5TH METHOD"
    
    x  = "There are #{10} types of people"
    puts x
    
    puts "I said: #{x}."
    
    puts "6TH METHOD"
     
    end1 = "C"
    end2 = "H"
    end3 = "E"
    end4 = "A"
    end5 = "B"
    
    
    print end1 + end2 + end3
    print end4 + end5
    puts end1 + end2 + end3
    puts end4 + end5
    
    puts "7TH METHOD"
    
    formatter = "%s %s %s %s"
    
    puts formatter % [1,2,3,4]
    
    puts "8TH METHOD"
    
    #puts = <<PARAGRAPH 
    #There's something going on here with 
    #the PARAGRAPH thing 
    #type as much as we like
    #Even 4 lines
    #PARAGRAPH
    
    #fat_cat = <<MY_HEREDOC
    #\t Cat
    #\t Fishies
    #MY_HEREDOC
    
    #puts fat_cat
    
    #puts "Here is the first links from CCSF"
    
    #puts links.length
    #puts links[0] 
    #puts links[0]["href"]
    
    #puts "Here are all the links from CCSF"
    
    #puts links.length
    #puts links 
    #puts links
    
    puts "9TH METHOD"
    
    #print "How old are you?"
    #age = gets()
    #print "How tall are you?"
    #height = gets()
    
    #puts "So you are #{age} old, and #{height}"
    #puts "Here are the computer science group areas"
    
    #Comment1
    
    #open("http://www.ruby-lang.org/en") do |ff|
     # ff.each_line {|line| p line}
      #puts ff.base_uri
      #puts ff.content_type
      #puts ff.charset
      #puts ff.content_encoding
      #puts ff.last_modified
    #end
    
    employees = ['Joe', 'Charlie', 'Fred', 'Reeve']

#employees.each_index do |i|
# puts i + 1 #Output 1 to 4
#end
    
# for i in 0..4 do
        
     #   puts @employees[i]
# end
    
  #  (1..3).each do |k|
    
   # puts @employees[%{k}]
    
#end
    #employees2 = ['Joe', 'Charlie', 'Fred', 'Reeve']

    #employees2.each do |i|
	 # puts employees2[i + 1] #Output 1 to 4
    #end
    
    ###HW Exercise8
    
    formatter = "%s %s %s %s"
    
    puts formatter % ["one","two","three","four"]

#######################DOES NOT WORK
    #puts <<PARAGRAPH
    #Something going on.
    #Paragraph thing.
    #PARAGRAPH
    
######################

    tabby_cat = "\tI'm tabbed in."
    
    puts tabby_cat
    
###################### EX 11 Chomp does not appear to work in non IRB
#Argument error Get wrong number of arguments

#print "How old are you?"

#age = get.chomp()


##EX 11 Libraries
##############Does not work open loop redirection forbidden works with marindemocrats

require 'open-uri'

open ("http://www.marindemocrats.org") do |f|
    
    f.each_line {|line| p line}
    puts f.base_uri
    puts f.content_type
    puts f.charset
    puts f.content_encoding
    puts f.last_modified
    
end
    
##EX 13 Parameters Unpacking Variables
##

first, second, third, fourth, fifth = ARGV

puts "The script is called: #{$0}"

puts "The first variable is: #{first}"
puts "The second variable is: #{second}"
puts "The third variable is: #{third}"
puts "The third variable is: #{fourth}"
puts "The third variable is: #{fifth}"

##EX 14 Prompting and Passing

user = ARGV.first
prompt = '> '

puts "Hi #{user}, I'm the #{$0} script."
puts "I would like to ask you a few questions"
puts "Do you like me #{user}?"
print prompt
likes = STDIN.gets.chomp()
puts likes

puts <<MESSAGE
so you said #{likes}
you live in
MESSAGE

##EX 15 Reading Files Does not work
## NO SUCH FILE. Seems like th file has to be saved somewhere
#WILL NOT ACCEPT TEXT AGAIN AS A LOCAL VARIABLE
#filename = ARGV.fourth
#prompt = "> "
#txt = File.open(filename)

#puts "Here's your file: #{filename}"
#puts txt.read

#THIS WORKS

    puts "I'll also ask you to type a filename here"
    print prompt
    file_again = STDIN.gets.chomp()
    text_again = File.open(file_again)

    puts text_again.read()

##########

#EX 16 READING AND WRITING FILES

#Close closes the file
#Read reads the contents of a file can be assigned to a variable
#Readline Reads just one line of a text file
#truncate Empties the file
#write(stuff) Writes to the file

#filename = ARGV.first
filename = "App1.txt" 
script = $0

puts "We are going to erase #{filename}"
puts "If you don't want that hit CTRL-C."
puts "If you do want that hit RETURN"
print "$ "
STDIN.gets

puts "Opening the file..."
target =File.open(filename,'w')

puts "Truncating the file... Goodbye.."
target.truncate(target.size)

puts "Now I am going to ask you for three lines"

print "line 1:  "; line1 = STDIN.gets.chomp()
print "line 2:  "; line2 = STDIN.gets.chomp()
print "line 3:  "; line3 = STDIN.gets.chomp()

puts "I'm going to write these to the file"

target.write(line1)
target.write("\n")
target.write(line2)
target.write("\n")
target.write(line3)
target.write("\n")

puts "finally we close it"
target.close()

#EX 17 MORE FILES copy one file to another

#from_file, to_file = ARGV

from_file = "App1.txt"
to_file = "App2.txt"
script = $0

puts "Copying from #{from_file} to #{to_file}"

input = File.open(from_file)
indata = input.read()

puts "The input file is #{indata.length} bytes long"

puts "Does the output file exist? #{File.exists? to_file}"

puts "Ready hit return to continue, CTRL C to abort"

STDIN.gets

output = File.open(to_file, 'w')
output.write(indata)

puts "Alright all done"

output.close
input.close

#EX 18 Names Variables Code Functions

def puts_two(*args)
    
    arg1, arg2 = args
    puts "arg1: #{arg1}, arg2: #{arg2}"
    
end

#puts_two(arg1, arg2)

def puts_two_again(arg1, arg2)

    puts "arg1: #{arg1}, arg2: #{arg2}"
    
end

puts_two_again(1,2)

#EX 19 Functions and variables

#EX 20 Functions and Files

input_file = "App1.txt"

def print_all(f)
    
    puts f.read()
end

def rewind(f)
    
    f.seek(1, IO::SEEK_SET)
    
end

def print_a_line(line_count, f)
    puts "#{line_count} #{f.readline()}"
end

current_file = File.open(input_file)
#
print_all(current_file)

puts "Now rewind"

rewind(current_file)

puts "Print three lines"

current_line = 1
print_a_line(current_line, current_file)

current_line = current_line + 1

print_a_line(current_line, current_file)

current_line = current_line + 1

print_a_line(current_line, current_file)


#EX25

#def sefl.break_words(stuff)
    
#    words = stuff.split(' ')
#    return words
#end

#break_words(current_file)


def self.sort_words(words)

words.sort()

return words

end

sort_words(current_file)

