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
 
@testArray2 = [:Institution => "CCSF", :Semester => "Fall 2015", :Level => "Undergraduate", :Category => "Computers", :Department => "Computer_Science", :ClassName => "Intro_Java_Script", :Days => "Tues-Thurs", :Time => "7:30PM"]
 
class ClassData1
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
    

DataMapper.finalize()
DataMapper.auto_upgrade!()

#<ClassData @id=nil @Institution=nil @Semester=nil @Level=nil @Category=nil @Department=nil @ClassName=nil @Days=nil @Time=nil>
testArray1 = ["CCSF","Fall 2014","Undergrad","Computers","Computer_Science","Intro_Java_Script","Tues-Thurs","7:00PM"]
  
  def loadDataFromArray1()
    
    testArray1 = ["CCSF","Fall 2014","Undergrad","Computers","Computer_Science","Intro_Java_Script","Tues-Thurs","7:00PM"]

    class_data = ClassData1.new
    class_data.Institution = testArray1[0]
    class_data.Semester = testArray1[1]
    class_data.Level = testArray1[2]
    class_data.Category = testArray1[3]
    class_data.Department = testArray1[4]
    class_data.ClassName = testArray1[5]
    class_data.Days = testArray1[6]
    class_data.Time = testArray1[7]
    class_data.save
    
  end

end

ClassData1Instance = ClassData1.new 
ClassData1Instance.loadDataFromArray1()
#puts ClassData1Instance.all[8].attributes
#puts ClassData1Instance.all.attributes

puts ClassData1Instance
#exit
#puts ClassData1Instance.first.inspect


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
    
    
require 'open-uri'

open ("http://www.marindemocrats.org") do |f|
    
    f.each_line {|line| p line}
    puts f.base_uri
    puts f.content_type
    puts f.charset
    puts f.content_encoding
    puts f.last_modified
    
end
    
#Ex 32

the_count = [1, 2, 3, 4]
fruits = ['apples', 'oranges', 'pears', 'apricots']
change = [1, 'pennies', 2, 'dimes', 3, 'quarters']

for number in the_count
  puts "This is count #{number}"
end
  
fruits.each do |fruit|
    puts "A fruit of type: #{fruit}"
end

for i in change
  puts "I got #{i}"
end
  
elements = []

for i in (0..5) 
  puts "Adding #{i} to the list"
  elements.push
end

for i in elements
  puts "Element was: #{i}"
end

#Ex 33 While loops

image_Array3 = Dir["/public/images/"]
puts "here is the image_Array3 first element"  
puts image_Array3[0]

#EX 35 Accessing Elements of Arrays

def prompt()
  print "> "
end

#def gold_room()
 # puts "This is full of gold bars. How many do you take?"
  #prompt; next_move = STDIN.gets.chomp
  #if next_move.include? "0" or next_move.include? "1"
 #   how_much = next_move.to_i()
  #else
#    dead("Man, learn to type a number")
  #end
  
  #if how_much < 50
   # puts "Nice not greedy you win"
    #Process.exit(0)
  #else
   # dead("You are greedy")
  #end
#end
#gold_room()

#Ex 39 doing things to arrays

ten_things = "Apples Oranges Crows Telephone Light Sugar"
puts "#{ten_things}"
puts "Wait there are not 10 things"
stuff = ten_things.split(' ')
more_stuff = %w(Day Night Song Frisbee Corn Banana Girl Boy)

while stuff.length != 10
  next_one = more_stuff.pop()
  puts "Adding: #{next_one}"
  stuff.push(next_one)
  puts "There's #{stuff.length} items now"
end

puts "There we go: #{stuff}"

puts "More things"
puts "Stuff index 1"
puts stuff[1]
puts "Stuff index -1"
puts stuff[-1]

puts "Stuff POP"
puts stuff.pop()

puts stuff.join(' ')
puts stuff.values_at(3,5).join('#')

#ex 40 hashes

stuff2 = {:name => "Rob", :age => 30, :height => 5*12+10}

puts "Here is stuff2 #{stuff2}"
puts stuff[:name]
puts stuff[:age]
stuff[:city] = "New York"
puts stuff[:city]

