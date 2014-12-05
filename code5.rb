require "sinatra"     # Load the Sinatra web framework
require "data_mapper" # Load the DataMapper database library
require "sinatra/reloader" if development?
require 'open-uri'
require 'nokogiri'
require 'rubygems'
 
require "./database_setup"
 
 
 

############################################################################################
 
#@testArray1 = ["CCSF","Fall 2014","Undergrad","Computers","Computer_Science","Intro_Java_Script","Tues-Thurs","7:00PM"]
 
#@testArray2 = [:Institution => "CCSF", :Semester => "Fall 2015", :Level => "Undergraduate", :Category => "Computers", :Department => "Computer_Science", :ClassName => "Intro_Java_Script", :Days => "Tues-Thurs", :Time => "7:30PM"]
 
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

get("/load") do
  testArray1 = ["CCSF","Fall 2014","Undergrad","Computers","Computer_Science","Intro_Java_Script","Tues-Thurs","7:00PM"]
  #records = ClassData.all(order: :created_at.desc)
  #erb(:index2, locals: { messages: records })
  dataRow = ClassData.create(Institution: "CCSF", Semester: "Fall 2014", Level: "Undergrad", Category: "Computers", Department: "Computer_Science", ClassName: "Intro_Java_Script", Days: "Tues-Thurs", Time: "7:00PM")
  
  dataRowtest = dataRow
  puts "PUTTING ZHE DATAROW"

  puts "checking for institution in load"
  dataRowvar = dataRow.Institution
  
  puts #{dataRowvar}

if dataRow.saved?
    redirect("/")
  else
    erb(:error)
  end

end

#########################################################



#get("/") do
  
 # records = ClassData.all
  #puts records
  #body(records[0][0])
  puts "Putting records in /"
  
  i = 0
  #for record in records do
   # puts i
    #puts record.class
    #puts record.Institution
    #i += 1
  #end
  
  #erb(:index2, locals: { messages: records })
#end

###########################################
puts  "nokogiri secttion follows"
    PAGE_URL = "http://ruby.bastardsbook.com/files/hello-webpage.html"
    
    
puts "Nokogiri::HTML(open(PAGE_URL))"
page = Nokogiri::HTML(open(PAGE_URL))
puts "puts bastards page.css('title')"  
puts page.css('title')

puts "puts bastards page.css('title')[0].name"
puts page.css('title')[0].name

puts "puts bastards page.css('title')[0].text"
puts page.css('title')[0].text

puts "City college section follows"

puts "PAGE_URL2 = https://www.ccsf.edu/Schedule/Fall/computer_science.shtml"    
PAGE_URL2 = "https://www.ccsf.edu/Schedule/Fall/computer_science.shtml"
 
puts "page2 = Nokogiri::HTML(open(PAGE_URL2))" 
page2 = Nokogiri::HTML(open(PAGE_URL2))

puts "puts page2.css(title)"
    
puts page2.css('title')

puts "puts page2.css('title')[0].name"
    
puts page2.css('title')[0].name

puts "puts page2.css('title')[0].text"

puts page2.css('title')[0].text

titleCatVar = page2.css('title')[0].text

puts "titleCatArray = titleCatVar.split(x   x)"

titleCatArray = titleCatVar.split("   ")

puts "puts titleCatArray with split"

puts titleCatArray

puts "puts titleCatArray[0]"

puts titleCatArray[0]

puts "puts titleCatArray[5]"

puts titleCatArray[5]

puts "puts titleCatArray[6]"

puts titleCatArray[6]

titleCatArray = titleCatVar.split("  ")

puts "titleCatArray = titleCatVar.split(x  x)"

puts titleCatArray

puts "titleCatArray = titleCatVar.partition"

puts titleCatArray

titleCatArray = titleCatVar.partition("  ")

puts "puts titleCatArray"

puts titleCatArray
    
puts "00 Method"

puts "links = page2.css('a')"    
links = page2.css('a')
    
puts "puts page2.css('a')[1].text"

puts page2.css('a')[1].text

puts "page2.css('a')[1]"

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

puts "ALL H2s and [0] and [2] element"
puts "all"
puts AllH2
###########################################
###########################################
puts "AllH2.loop"

#each do format

puts "each do format"
AllH2.each do |department|
    
        #puts "#{department.text}"
        
sem_depttext =  "#{department.text}"
puts "Here is sem_depttext"
puts sem_depttext
sdtsplit = sem_depttext.split("_ _")
#puts sdtsplit
    
    
end
puts "I in [i] format"
for i in (0..AllH2.length-1)

sem_depttext2 =  "#{AllH2[i].text}"
puts "Here is sem_depttext2"
puts sem_depttext2
sdtsplit2 = sem_depttext2.split(" ")
puts sdtsplit2
#puts "#{AllH2[i].text}"

end

#i = 0
#  for i in AllH2[0]
#   puts AllH2[i]
    
#    i += 1
#  end
  
puts "ALL H2s and [0] and [2] element"
#for i=0;i>AllH2.length;++i
puts AllH2[0].text
puts AllH2[1].text
puts AllH2[2].text
puts AllH2[3].text
    
###########################################
#<ClassData @id=nil @Institution=nil @Semester=nil @Level=nil @Category=nil @Department=nil @ClassName=nil @Days=nil @Time=nil>



#testArray1 = ["CCSF","Fall 2014","Undergrad","Computers","Computer_Science","Intro_Java_Script","Tues-Thurs","7:00PM"]
  
 # def loadDataFromArray1()
    
    #testArray1 = ["CCSF","Fall 2014","Undergrad","Computers","Computer_Science","Intro_Java_Script","Tues-Thurs","7:00PM"]

    #class_data = ClassData1.new
    #class_data.Institution = testArray1[0]
    #class_data.Semester = testArray1[1]
    #class_data.Level = testArray1[2]
    #class_data.Category = testArray1[3]
    #class_data.Department = testArray1[4]
    #class_data.ClassName = testArray1[5]
    #class_data.Days = testArray1[6]
    #class_data.Time = testArray1[7]
    #class_data.save
    
  #end



#ClassData1Instance = ClassData1.new 
#ClassData1Instance.loadDataFromArray1()
#puts ClassData1Instance.all[8].attributes
#puts ClassData1Instance.all.attributes

#puts class_data.Institution
#exit
#puts ClassData1Instance.first.inspect


#for i in 1..3 do  
 #  loadDataFromArray(i) 
#end
#########################################################################################################

 
a = [3.14159, "pie", 99]
#typevar = a.type
#puts typevar
#»	Array
puts a.length	
#»	3
a[0]	
#»	3.14159
a[1]	
#»	"pie"
a[2]	
#»	99
a[3]	
#»	nil
b = Array.new
#b.type	
#»	Array
b.length	
#»	0
b[0] = "second"
b[1] = "array"
#b	»	["second", "array"]
  
arr1 = [1,2,3,4,5,6]              
for x in 0..(arr1.length-1)
    puts arr1[x]
end

# or, with while:
x = 0
while x < arr1.length
    puts arr1[x]
    x += 1
end

#Here is arr2
arr2 = [3.14159, "pie", 99]
arr2.each{ |x| puts x}        

# using the equivalent do..end construct:
arr2.each do |x|
    puts x
end

######################################################
#Here comes the first hash
hash1 = { 'dog' => 'canine', 'cat' => 'feline', 'donkey' => 'asinine' }
puts hash1.length	
#»	3
puts hash1['dog']	
#»	"canine"
hash1['cow']
#'bovine'
puts hash1[12]    
#= 'dodecine'
puts hash1['cat'] 
#= 99
puts hash1	
#»	{"cow"=>"bovine", "cat"=>99, 12=>"dodecine", "donkey"=>"asinine", "dog"=>"canine"}

#################
#class Songx
 # def initialize(name, artist, duration)
  #  @name     = name
   # @artist   = artist
    # @duration = duration
  #end
#end

class Song
 
 def initialize(name, artist, duration)
  
    @name     = name
    @artist   = artist
    @duration = duration
end
  
  def name
    @name
  end
  def artist
    @artist
  end
  def duration
    @duration
  end
end

#puts "on song pring name"


#class Song
 #  attr_reader :name, :artist, :duration
#end
aSong1 = Song.new("Cher", "Got you babe", 260)
puts "#class Song putting aSong1.artist Cher"
puts aSong1.artist	
puts "#class Song putting aSong1.name Got you"
puts aSong1.name
puts "#class Song putting aSong1.duration 260"
puts aSong1.duration	


class SongList
  def initialize
    @songs = Array.new
    #@songs[0] ="x"
    #@songs[1] ="xx"
    #@songs[2] = 0
  end

def append(aSong)
    @songs.push(aSong)
    self
  end
  
  def deleteFirst
    @songs.shift
  end
  def deleteLast
    @songs.pop
  
   end
   
   def [](key)
    if key.kind_of?(Integer)
      @songs[key]
    else
      # ...
    end
  end
end

list = SongList.new
puts "puttin the songlist Nothing in it yet"
testSongList = list
puts testSongList 

puts "using a string of list appends no putting yet"
list.
  append(Song.new('title1', 'artist1', 1)).
  append(Song.new('title2', 'artist2', 2)).
  append(Song.new('title3', 'artist3', 3)).
  append(Song.new('title4', 'artist4', 4))
  
#list.deleteFirst
#puts "xxSong: title1--artist1 (1)  "
#list.deleteFirst	
#puts "xxSong: title2--artist2 (2)  "
#list.deleteLast	
#puts "xxSong: title4--artist4 (4) "
#list.deleteLast
#puts "xxSong: title3--artist3 (3) "
#list.deleteLast	
#puts "xxnil"

##########################
puts "list element 0 is"
puts list[0]	
puts "element [2] xxxSong: title1--artist1 (1) "
puts list[2]	
puts "element [9]xxxSong: title3--artist3 (3) "
puts list[9]	
  

#######################
#aaSong1 = Song.new('title1','artist1',1)
#aaSong2 = Song.new('title2','artist2',2)

#puts "Putting aaSong1 all"
#puts aaSong1
#puts "Putting aaSong1 name"
#puts aaSong1.name
#puts "Putting aaSong1 artist"
#puts aaSong1.artist
#list.append(aaSong1)
#puts "putting list after 1st append"
#puts list
#list.append(aaSong2)

#puts "putting list after 2nd append"
#puts list
#list.append(Song.new('title1', 'artist1', 1))
  #append(Song.new('title2', 'artist2', 2)).
  #append(Song.new('title3', 'artist3', 3)).
  #append(Song.new('title4', 'artist4', 4))
#########################

values = []

# Create first row.
subarray = []
subarray.push(1)
subarray.push(2)
subarray.push(3)

# Add first row.
values.push(subarray)

# Create second row.
subarray = []
subarray.push(10)
subarray.push(20)
subarray.push(30)

# Add second row.
values.push(subarray)

# Load an element.
puts "Third element in first row is: " << String(values[0][2])

puts "Change this element"

values[1][1] = 500

puts "Display all elements"

values.each do |x|
    x.each do |y|
	puts y
    end
    puts "--"
end

#######################################

class SongNEW
 
 def initialize(name, artist, duration)
  
    @name     = name
    @artist   = artist
    @duration = duration
    @InnerArray = Array.new
    @InnerArray.push(@name)
    @InnerArray.push(@artist)
    @InnerArray.push(@duration)
    
end
  
  def name
    @name
  end
  def artist
    @artist
  end
  def duration
    @duration
  end
  def InnerArray
      @InnerArray
  end
  #def InnerArray
#E@InnerArray = Array.new
#@InnerArray.push(@name)
#@InnerArray.push(@artist)
#@InnerArray.push(@duration)
  #end
end

SongNEWInstance = SongNEW.new("Cher", "Music", 5)
puts "Here is the Inner Array 1st element"

puts SongNEWInstance.InnerArray[0]
puts "Here is the Inner Array 2nd element"
puts SongNEWInstance.InnerArray[1]
puts "Here is the Inner Array 3rd element"
puts SongNEWInstance.InnerArray[2]

##################################################

class GetCityCollegeClasses 
  
  def getCCSFClassesNokogiri
    
    puts "City college section follows"
    puts "CCSF_Page_Url = https://www.ccsf.edu/Schedule/Fall/computer_science.shtml"
    @CCSF_Page_Url = "https://www.ccsf.edu/Schedule/Fall/computer_science.shtml"
 
    puts "page2 = Nokogiri::HTML(open(CCSF_Page_Url))"
    @CCSFPage_Noko = Nokogiri::HTML(open(CCSF_Page_Url))  
    
  end
  
  def getCCSFNoko_cleqtitle_Category
 
    #puts "puts CCSFPage_Noko.css(title)"
    #puts CCSFPage_Noko.css('title')
    #puts "puts CCSFPage_Noko.css('title')[0].name"
    #puts CCSFPage_Noko.css('title')[0].name
    #puts "puts CCSFPage_Noko.css('title')[0].text"
    @titleCatVar = CCSFPage_Noko.css('title')[0].text
    @titleCatArray = @titleCarVar.split("  ")
    @Category_VAR = @titleCatArray[0]
    @Semester_VAR = @titleCatArray[5]
    
  end
  
  def getCCSFNoko_h2Department
    
    @CCSF_Page_Url = "https://www.ccsf.edu/Schedule/Fall/computer_science.shtml"
    @CCSFPage_Noko = Nokogiri::HTML(open(@CCSF_Page_Url))
    
    
    @h2DeptVar = @CCSFPage_Noko.css('h2').text
    return @h2DeptVar
    
  end
    
end

#def getCCSFNoko_spanclcourseTitle_CRNTitle
  
#   @CCSF_Page_Url = "https://www.ccsf.edu/Schedule/Fall/computer_science.shtml"
#   @CCSFPage_Noko = Nokogiri::HTML(open(@CCSF_Page_Url))
#   @h2DeptVar = @CCSFPage_Noko.css('span').text
   
# end 

GCCC_Instance = GetCityCollegeClasses.new
returnVar = GCCC_Instance.getCCSFNoko_h2Department()

puts returnVar


