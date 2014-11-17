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
  
 
    
    #puts "Here is the first links from CCSF"
    
    #puts links.length
    #puts links[0] 
    #puts links[0]["href"]
    
    #puts "Here are all the links from CCSF"
    
    #puts links.length
    #puts links 
    #puts links
    
    puts "Here are the computer science group areas"
    
    #Comment1
    

