require "sinatra"     # Load the Sinatra web framework
require "data_mapper" # Load the DataMapper database library
require "sinatra/reloader" if development?
require 'open-uri'
require 'nokogiri'
require 'rubygems'
 
require "./database_setup"
 
require "sinatra/reloader" if development?

#################################################################################
class ClassPreference
  include DataMapper::Resource
  
  property :id,         Serial
  property :body,       Text,     required: true
  property :created_at, DateTime, required: true
 
end
 ################################################################################ 
class ClassData
    include DataMapper::Resource
    
    property :id, Serial
    property :Institution, Text
    property :Semester, Text
    property :Level, Text
    property :Category, Text
    property :Department, Text
    property :ClassNumber, Text
    property :ClassName, Text
    property :SectionNumber, Text
    property :Section, Text
    property :Days, Text 
    property :Time, DateTime
    property :Units, Text 
   
    
end

class ClassData_V2
    include DataMapper::Resource
    
    property :Id, Serial
    property :Institution, Text
    property :Semester, Text
    property :Level, Text
    property :Category, Text
    property :Department, Text
    property :ClassNumber, Text
    property :ClassName, Text
    property :SectionNumber, Text
    property :Section, Text
    property :Days, Text 
    property :Time, Text
    property :Units, Text 
    #property :created_at, DateTime, required: true
    
end

 
############################################################################### 

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
################################################################################
DataMapper.finalize()
DataMapper.auto_upgrade!()
################################################################################ 
@testArray1 = ["CCSF","Fall 2014","Undergrad","Computers","Computer_Science","Intro_Java_Script","Tues-Thurs","7:00PM"]
###############################################################################
#@testArray1 = ["CCSF","Fall 2014","Undergrad","Computers","Computer_Science","Intro_Java_Script","Tues-Thurs","7:00PM"]
 
#@testArray2 = [:Institution => "CCSF", :Semester => "Fall 2015", :Level => "Undergraduate", :Category => "Computers", :Department => "Computer_Science", :ClassName => "Intro_Java_Script", :Days => "Tues-Thurs", :Time => "7:30PM"]
 
get("/load") do
  testArray1 = ["CCSF","Fall 2014","Undergrad","Computers","Computer_Science","Intro_Java_Script","Tues-Thurs","7:00PM"]
  #records = ClassData.all(order: :created_at.desc)
  #erb(:index2, locals: { messages: records })
  dataRow = ClassData.create(Institution: "CCSF", Semester: "Fall 2014", Level: "Undergrad", Category: "Computers", Department: "Computer_Science", ClassNumber: "CS 101", ClassName: "Intro_Java_Script", SectionNumber: "11111", Section: "501", Days: "Tues-Thurs", Time: "7:00PM", Units: "3")
  
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



### get / do variable records equals all records from the Message table, ordered by created at
get("/") do
  records = Message.all(order: :created_at.desc)
  erb(:index_fin, locals: { messages: records })
end

#get("/test") do
#  body("hello world!")
#end

get("/test") do
  cprecords = ClassPreference.all(order: :created_at.desc)
  erb(:index_fin2, locals: { classpreferences: cprecords })
end

################################################################################ 
#
post("/classpreferences") do
  classpreference_body = params["body"]
  classpreference_time = DateTime.now
 
  classpreference = ClassPreference.create(body: classpreference_body, created_at: classpreference_time)
 
  if classpreference.saved?
    redirect("/getclassesmain")
  else
    erb(:error)
  end
end
################################################################################
get("/getclassesmain") do
  
  body("<h2>COMING SOON!</h2")
  
################################################################################
class GetCityCollegeClasses
  
  def initialize(collectorarray,collectorhash,collectorhash_symb,collectionofarrays, collectionofhashes)
   
   @collectorarray = collectorarray
   @collectorhash = collectorhash
   @collectorhash_sym = collectorhash_symb
   @xcollectionofarrays = collectionofarrays
   @xcollectionofhashes = collectionofhashes
   
   @collectionofarrays = Array.new
   @collectionofhashes = Array.new
   @collectionofhashes_symb = Array.new
  
   
  end
 
  def get_collectorarray()
    
     @collectorarray
     
  end
   
   def get_collectorhash() 
     
     @collectorhash
    
   end
  
  
  def get_collectionofarrays()
    
     @collectionofarrays
       
      
  end
    
   def get_collectionofhashes()
      
       @collectionofhashes
       
   end
    
##Initialize it what fires when the new method is called in this case it takes two parameters department and classes
##The instance variable @department is set to whatever came in through the department param
##The instance variable @classes is set to whatever came in through the classes param
#if it does not start with @ it is considered to be a local variable
#a local variable is available only inside the METHOD
#an instance variable is available to the entire instance
#Getter and setter Getter returns the value of a particular instance variable


#Currently running this gives undefined method bytesiz in the bowels and returns department to the screen.


  def mymain
      
    ClassData_V2.all.destroy
   
    
    class_url = "https://www.ccsf.edu/Schedule/Fall/computer_science.shtml"
    html = Nokogiri::HTML(open(class_url))
    
    @collectorarray0 = Array.new
    @collectorhash0 = Hash.new
    @collectorhash0_symb = Hash.new
    @test = 1
    @index = 0
    @index_2 = 0
    index_3 = 0
    @index_4 = 0
    
    html.css("pre").children.each  {|node|
    
   
     if node.name == "h2"
       
       puts "index_2 beginning of h2"
       puts @index_2
       @index_2 = @index_2 + 1
       semestercategory = node.text
      
       semestercategory.gsub!('l 2','l_2')
      
       semestercategoryinnerarray = semestercategory.split(/\W{5}/)
       #puts semestercategoryinnerarray
       
       
       @collectorarray0[1] = "CCSF"
       @collectorarray0[3] = "Undergrad"
       @collectorarray0[2] = semestercategoryinnerarray[0]
       @collectorarray0[4] = semestercategoryinnerarray[1]
       @collectorarray0[12] = "3"
       
       @collectorhash0["Institution:"] = "CCSF"
       @collectorhash0["Units:"] = "3"
       @collectorhash0["Level:"] = "Undergrad"
       @collectorhash0["Semester:"] = semestercategoryinnerarray[0]
       @collectorhash0["Category:"] = semestercategoryinnerarray[1]
       @collectorhash0_symb[:Semester] = semestercategoryinnerarray[0]
       @collectorhash0_symb[:Category] = semestercategoryinnerarray[1]
       @collectorhash0_symb[:Institution] = "CCSF"
       @collectorhash0_symb[:Units] = "3"
       @collectorhash0_symb[:Level] = "Undergrad"
       
     end
   
     if node.name == "span" and node.attr(:class) == "courseTitle" 
         
         puts "value of index_3 beginning of span coursetitle but outside of 
         collectorarray[1] condition"
         puts index_3
         index_3 = index_3 + 1
         puts index_3
         
        # if (@collectorarray0[1] != nil)
             
         puts "value of index_4 beginning of span coursetitle bu collectorarray[1] is not nill"
         puts @index_4
         @index_4 = @index_4 + 1
         
       
         if (@collectorarray0[1] != nil)
         @collectorarray00 = @collectorarray0.dup
         @collectorhash00 = @collectorhash0.dup
         @collectorhash00_symb = @collectorhash0_symb.dup
         end
         puts "here is value of @collectorarray00 beg of span after it is assigned"
         puts @collectorarray00
         
         
      spantestattrib = node.text
     
      p "@collectorarray00[1] if we are in span"
      p @collectorarray00[1]
      
      @collectorarray00[6] = spantestattrib[0..8]
      @collectorhash00["ClassNumber:"] = spantestattrib[0..8]
      @collectorhash00_symb[:ClassNumber] = spantestattrib[0..8]
      
      @collectorarray00[7] = spantestattrib[11..42]
      @collectorhash00["ClassName:"] = spantestattrib[11..42]
      @collectorhash00_symb[:ClassName] = spantestattrib[11..42]
      
     
      my_match = /CS/.match(spantestattrib,8)
      
      
      if (spantestattrib[0..8] =~ /CS/) 
       #puts spantestattrib[0..8]
         @collectorarray00[5] = "Computer_Science"
         @collectorhash00["Department:"] = "Computer_Science"
         @collectorhash00_symb[:Department] = "Computer_Science"
        
      end
      
       if (spantestattrib[0..8] =~ /VMD/) 
       #puts spantestattrib[0..8]
         @collectorarray00[5] = "Visual Media Design"
         @collectorhash00["Department:"] = "Visual Media Design"
         @collectorhash00_symb[:Department] = "Visual Media Design"
        
       end
      
       if (spantestattrib[0..8] =~ /CNIT/) 
       #puts spantestattrib[0..8]
         @collectorarray00[5] = "Computer Networking - Internet Technology"
         @collectorhash00["Department:"] = "Computer Networking - Internet Technology"
         @collectorhash00_symb[:Department] = "Computer Networking - Internet Technology"
         
        
       end
      
      puts "!!collectorarray00 end of span"
      p @collectorarray00
      
      puts "!!collectorhash00 end of span"
      p @collectorhash00
      
      puts "!!collectorhash00_symb end of span"
      p @collectorhash00_symb
      
     end #of outer if
      
        
################################### 
    
     
    if node.name == "a" and node.attr(:title) == "Class list"
         
        sectionnumbervar = node.text
        
        puts "here is the node.text at beginning of class list title"
        p node.text
       
               
        if (@collectorarray00[1] != nil and @collectorarray00[6] != nil)
        @collectorarray = @collectorarray00.dup
        @collectorhash = @collectorhash00.dup
        #@collectorhash_symb = Array.new
        @collectorhash_symb = @collectorhash00_symb.dup
        
        puts "!!!Past 2nd condition"
        end
      
       
        @collectorarray[8] = sectionnumbervar
        @collectorhash["SectionNumber:"] = sectionnumbervar
        @collectorhash_symb[:SectionNumber] = sectionnumbervar
       
        arecordstring = node
     
        arecordstringtext = arecordstring.to_s
       
       
        @a_array = arecordstringtext.split(';')
        @a_recordstringmainvar = @a_array[3]
        @a_recordstringmainvartext = (@a_recordstringmainvar).gsub!('%20', ' ')
      
        @test2 = @a_recordstringmainvartext
      
        a_rsmvtt = (@a_recordstringmainvartext).gsub!('%', ';')
       
       
         if (a_rsmvtt =~ /;(.*)/)
           #puts "a_rsmvtt has ;"
           @a_arrayinner = a_rsmvtt.split(';')
           @collectorarray[9] = @a_arrayinner[2][10..13]
           @collectorhash["Section:"] = @a_arrayinner[2][10..13]
           @collectorhash_symb[:Section] = @a_arrayinner[2][10..13]
           #puts "@a_arrayinner"
           #p @a_arrayinner
           @collectorarray[10] = @a_arrayinner[2][14..23]
           @collectorhash["Days:"] = @a_arrayinner[2][14..23] 
           @collectorhash_symb[:Days] = @a_arrayinner[2][14..23] 
           @collectorarray[11] = @a_arrayinner[2][23..36]
           @collectorhash["Time:"] = @a_arrayinner[2][23..36] 
           @collectorhash_symb[:Time] = @a_arrayinner[2][23..36] 
          
         end
       
          if (a_rsmvtt !~ /;(.*)/)
            arecordstring_test = node
            #arecordstring_testtext = arecordstring_test.to_s
            arecordstringtext = arecordstring_test.to_s
            @a_array2 = arecordstringtext.split(';')
            @a_recordstringmainvar = @a_array2[4]
            #puts "@a_array2"
            #puts @a_array2
            #puts "@a_recordstringmainvar" 
            #puts @a_recordstringmainvar
            @a_recordstringmainvartext = (@a_recordstringmainvar).gsub!('%20', ' ')
            #puts "@a_recordstringmainvartext "
            #puts @a_recordstringmainvartext 
            a_rsmvtt_2 = (@a_recordstringmainvartext).gsub!('%', ';') 
            @a_arrayinner_2 = a_rsmvtt_2.split(';')
            @collectorarray[9] = @a_arrayinner_2[2][10..13]
            @collectorhash["Section:"] = @a_arrayinner_2[2][10..13]
            @collectorhash_symb[:Section] = @a_arrayinner_2[2][10..13]
            @collectorarray[10] = @a_arrayinner_2[2][14..23]
            @collectorhash["Days:"] = @a_arrayinner_2[2][14..23] 
            @collectorhash_symb[:Days] = @a_arrayinner_2[2][14..23] 
            @collectorarray[11] = @a_arrayinner_2[2][23..36]
            @collectorhash[":Time"] = @a_arrayinner_2[2][23..36] 
            @collectorhash_symb[:Time] = @a_arrayinner_2[2][23..36] 
           
          end
          
       
       
        collectorarray = []
        collectorhash = {}
        collectorhash_symb = {}
        
        collectorarray = @collectorarray.dup
        collectorhash = @collectorhash.dup
        collectorhash_symb = @collectorhash_symb.dup
        
       
        @collectionofarrays.push(collectorarray)
        @collectionofhashes.push(collectorhash)
        @collectionofhashes_symb.push(collectorhash_symb)
        
        target = File.open('textholding', 'w')
        target.write("\n")
        target.write(collectorarray)
        target.close
        
       
        @collectorarray.clear
        @collectorhash.clear
        @collectorhash_symb.clear
        
     
        puts "value of index  STILL IN CLASS LIST"
        puts @index
        @index = @index + 1
        puts "value of index  AFTER INCREMENT"
        puts @index
            
     
    end #of the outer ifnode.name == "a" and node.attr(:title) == "Class list"
    
    
    } #of the each
    
    
     return @collectionofhashes_symb
     
     
  end #of the method
  
 
end #of the class################################

  #testArray1 = ["CCSF","Fall 2014","Undergrad","Computers","Computer_Science","Intro_Java_Script","Tues-Thurs","7:00PM"]
  #records = ClassData.all(order: :created_at.desc)
  #erb(:index2, locals: { messages: records })
#dataRow = ClassData_V2.create(Institution: "CCSF", Semester: "Fall 2014", Level: "Undergrad", Category: "Computers", Department: "Computer_Science", ClassNumber: "CS 101", ClassName: "Intro_Java_Script", SectionNumber: "11111", Section: "501", Days: "Tues-Thurs", Time: "7:00PM", Units: "3")
###outervariable.each do |row|
###dataRow = ClassData_V2.create(row)
###dataRowtest = dataRow
###puts "PUTTING THE DATAROW"
###if dataRow.saved?
###  puts "RECORD SAVED"
   #redirect("/displayrecords")
###  else
    
    ###puts "NOT SAVED"
    #erb(:error)
###end

###end
##############################################################
##############################################################
##############################################################

class Get_Cal_Classes
  def initialize(collectorarray,collectorhash,collectorhash_symb,collectionofarrays, collectionofhashes)
   
   @collectorarray = collectorarray
   @collectorhash = collectorhash
   @collectorhash_sym = collectorhash_symb
   @xcollectionofarrays = collectionofarrays
   @xcollectionofhashes = collectionofhashes
   
   @collectionofarrays = Array.new
   @collectionofhashes = Array.new
   @collectionofhashes_symb = Array.new
  
   
  end
 
  def get_collectorarray()
    
     @collectorarray
     
  end
   
   def get_collectorhash() 
     
     @collectorhash
    
   end
  
  
  def get_collectionofarrays()
    
     @collectionofarrays
       
      
  end
    
   def get_collectionofhashes()
      
       @collectionofhashes
       
   end
######################################################################
def mymain_cal
      
   
    uc_class_url = "http://osoc.berkeley.edu/OSOC/osoc?p_term=SP&x=29&p_classif=U&p_deptname=Computer+Science&p_presuf=--+Choose+a+Course+Prefix%2fSuffix+--&y=2"
    html_cal = Nokogiri::HTML(open(uc_class_url))
    
    @collectorarray0 = Array.new
    @collectorhash0 = Hash.new
    @collectorhash0_symb = Hash.new
    @test = 1
    @index = 0
    @index_2 = 0
    @index_3 = 10
    @index_4 = 0
    
    #puts "Here is the html_cal variable"
    #puts html_cal
    
    puts "here is index 3"
    puts @index_3
    
    ###html_cal.css("table")[1].children.each {|node|
    #html_cal.css.children.each  {|node|
    counter = 0
    for i in 0..102 do
    html_cal.css("table"[i]).children.each {|node|
    puts "here is counter"
    puts counter
    #puts node
    puts html_cal.css('table').css("tr").css("td")
    counter = counter + 1 
    #puts "before the if here we go"
    #puts node
   

    
    ###@table_01 = html_cal.css('table')[i].css("tr").css("td")
    ###puts @table_01[0]
    ###puts @table_01[1]
    ###puts @table_01[2]
    ###puts @table_01[3]
    
    
    ###@tablecounter = 0
   
     ##if node.name == "table"
         
        ##if node.name == "td" and node.attr(:align) == "RIGHT" 
        #puts "Just Before the if"
        ##if node.name == "table[1]" 
            
        ###    @node_test_var0 = node
            
           ## puts "here is everything with the table filter"
        ##    puts @node_test_var0
            
            #@node_test_var0.each {|line|
            
            #if (line!= nil)
           #     puts "Here is line"
            #   puts line
           # end #of the if
        #} #end of the each
        
        #end of the if
        
        ##Configuration One just puts border cell spacing celll padding inner each
        ##Configuraion Two table row td with img, td align right, empty td, td with a font.
        ##Configuration three table[0] does not produce anything
        ##Configuration four html_cal.css('table').css("font").css("tr").css("td") produces nohing
        ##Configuration four b produeces nothing
        ##Configuraion five  ###html_cal.css('table').css("tr").css("td") now produces no
        ##Configuraion five b  ###html_cal.css('table').css("tr").css("td") now produces...lost of tds
        ##Configuration  six puts html_cal.css('table')[0].css("tr").css("td")
        ##Configuration seven table [0] seems to pull lots of form data also.
        ##Configuration eight and nine {1} {2] produces muliple copies of one identifible class
        ##Configuraion ten produces something similar html_cal.css("table").children.each {|node|
        ##Configuration eleven produces fewer lines html_cal.css("table")[0].children.each {|node| but this is better
     
        #puts "Just afer the if"
     ##end
         
         
           #@departments.each {|dep|
      #puts dep.get_department
         
       #@tablecounter = @tablecounter + 1
       
       #puts "@tablecounter"
       #puts @tablecounter
       
       #node_test_var = node.text
       
       #puts "node_test_var"
       #puts node_test_var
       
       #puts "index_2 beginning of h2"
       #puts @index_2
       #@index_2 = @index_2 + 1
       ###semestercategory = node.text
      
       ###semestercategory.gsub!('l 2','l_2')
       #regex = /\s{5}/
       
       ###semestercategoryinnerarray = semestercategory.split(/\W{5}/)
       #puts semestercategoryinnerarray
       
       
       ###@collectorarray0[1] = "CCSF"
       ###@collectorarray0[3] = "Undergrad"
       ###@collectorarray0[2] = semestercategoryinnerarray[0]
       ###@collectorarray0[4] = semestercategoryinnerarray[1]
       ###@collectorarray0[12] = "3"
       
       ###@collectorhash0["Institution:"] = "CCSF"
       ###@collectorhash0["Units:"] = "3"
       ###@collectorhash0["Level:"] = "Undergrad"
       ###@collectorhash0["Semester:"] = semestercategoryinnerarray[0]
       ###@collectorhash0["Category:"] = semestercategoryinnerarray[1]
       ###@collectorhash0_symb[:Semester] = semestercategoryinnerarray[0]
       ###@collectorhash0_symb[:Category] = semestercategoryinnerarray[1]
       ###@collectorhash0_symb[:Institution] = "CCSF"
       ###@collectorhash0_symb[:Units] = "3"
       ###@collectorhash0_symb[:Level] = "Undergrad"
       
     ##end
   
     if node.name == "z" and node.attr(:class) == "courseTitle" 
         
         puts "value of index_3 beginning of span coursetitle but outside of 
         collectorarray[1] condition"
         puts index_3
         index_3 = index_3 + 1
         puts index_3
         
        if (@collectorarray0[1] != nil)
             
         puts "value of index_4 beginning of span coursetitle bu collectorarray[1] is not nill"
         puts @index_4
         @index_4 = @index_4 + 1
        end
       
         if (@collectorarray0[1] != nil)
         @collectorarray00 = @collectorarray0.dup
         @collectorhash00 = @collectorhash0.dup
         @collectorhash00_symb = @collectorhash0_symb.dup
         end
         puts "here is value of @collectorarray00 beg of span after it is assigned"
         puts @collectorarray00
         
          #@collectorarray00[1] = @collectorarray0[1]
         
         #puts "here is value of @collectorarray00[1] beg of span after it is assigned"
         #puts @collectorarray00[1]
      
      spantestattrib = node.text
      
      #puts "SPANBIZZO"
      #puts spantestattrib
      
      #@collectorarray[6] = spantestattrib[/^\w{5}/]
      
      p "@collectorarray00[1] if we are in span"
      p @collectorarray00[1]
      
      @collectorarray00[6] = spantestattrib[0..8]
      @collectorhash00["ClassNumber:"] = spantestattrib[0..8]
      @collectorhash00_symb[:ClassNumber] = spantestattrib[0..8]
      
      @collectorarray00[7] = spantestattrib[11..42]
      @collectorhash00["ClassName:"] = spantestattrib[11..42]
      @collectorhash00_symb[:ClassName] = spantestattrib[11..42]
      
     
      if (spantestattrib[0..8] =~ /CS/) 
       #puts spantestattrib[0..8]
         @collectorarray00[5] = "Computer_Science"
         @collectorhash00["Department:"] = "Computer_Science"
         @collectorhash00_symb[:Department] = "Computer_Science"
        
      end
      
       if (spantestattrib[0..8] =~ /VMD/) 
       #puts spantestattrib[0..8]
         @collectorarray00[5] = "Visual Media Design"
         @collectorhash00["Department:"] = "Visual Media Design"
         @collectorhash00_symb[:Department] = "Visual Media Design"
        
       end
      
       if (spantestattrib[0..8] =~ /CNIT/) 
       #puts spantestattrib[0..8]
         @collectorarray00[5] = "Computer Networking - Internet Technology"
         @collectorhash00["Department:"] = "Computer Networking - Internet Technology"
         @collectorhash00_symb[:Department] = "Computer Networking - Internet Technology"
         
        
       end
      
      puts "!!collectorarray00 end of span"
      p @collectorarray00
      
      puts "!!collectorhash00 end of span"
      p @collectorhash00
      
      puts "!!collectorhash00_symb end of span"
      p @collectorhash00_symb
      
     end #of outer if
      
        
################################### 
    
     
    if node.name == "z" and node.attr(:title) == "Class list"
         
        sectionnumbervar = node.text
        
        puts "here is the node.text at beginning of class list title"
        p node.text
       
               
        if (@collectorarray00[1] != nil and @collectorarray00[6] != nil)
        @collectorarray = @collectorarray00.dup
        @collectorhash = @collectorhash00.dup
        #@collectorhash_symb = Array.new
        @collectorhash_symb = @collectorhash00_symb.dup
        
        puts "!!!Past 2nd condition"
        end
      
       
        @collectorarray[8] = sectionnumbervar
        @collectorhash["SectionNumber:"] = sectionnumbervar
        @collectorhash_symb[:SectionNumber] = sectionnumbervar
       
        arecordstring = node
     
        arecordstringtext = arecordstring.to_s
       
       
        @a_array = arecordstringtext.split(';')
        @a_recordstringmainvar = @a_array[3]
        @a_recordstringmainvartext = (@a_recordstringmainvar).gsub!('%20', ' ')
      
        @test2 = @a_recordstringmainvartext
      
        a_rsmvtt = (@a_recordstringmainvartext).gsub!('%', ';')
       
        #@a_rsmvttt = (@_rsmvtt).gsub!('%5', ';')
        #@a_arrayinner = @a_recordstringmainvartext.split(/\%09 | \%5/)
        #@a_arrayinner = a_rsmvtt.split('zz')
        #@a_arrayinner = a_rsmvtt.split(/z{2}/)
       
        #@a_arrayinner = a_rsmvtt.split(';')
       
         if (a_rsmvtt =~ /;(.*)/)
           #puts "a_rsmvtt has ;"
           @a_arrayinner = a_rsmvtt.split(';')
           @collectorarray[9] = @a_arrayinner[2][10..13]
           @collectorhash["Section:"] = @a_arrayinner[2][10..13]
           @collectorhash_symb[:Section] = @a_arrayinner[2][10..13]
           #puts "@a_arrayinner"
           #p @a_arrayinner
           @collectorarray[10] = @a_arrayinner[2][14..23]
           @collectorhash["Days:"] = @a_arrayinner[2][14..23] 
           @collectorhash_symb[:Days] = @a_arrayinner[2][14..23] 
           @collectorarray[11] = @a_arrayinner[2][23..36]
           @collectorhash["Time:"] = @a_arrayinner[2][23..36] 
           @collectorhash_symb[:Time] = @a_arrayinner[2][23..36] 
           #puts "collectorarrayEND"
           #p @collectorarray
           #puts "collectorhashEND"
           #p @collectorhash
         
           #@collectionofarrays << @collectorarray
           #@collectionofhashes  << @collectorhash
         
         end
       
          if (a_rsmvtt !~ /;(.*)/)
            arecordstring_test = node
            #arecordstring_testtext = arecordstring_test.to_s
            arecordstringtext = arecordstring_test.to_s
            @a_array2 = arecordstringtext.split(';')
            @a_recordstringmainvar = @a_array2[4]
            #puts "@a_array2"
            #puts @a_array2
            #puts "@a_recordstringmainvar" 
            #puts @a_recordstringmainvar
            @a_recordstringmainvartext = (@a_recordstringmainvar).gsub!('%20', ' ')
            #puts "@a_recordstringmainvartext "
            #puts @a_recordstringmainvartext 
            a_rsmvtt_2 = (@a_recordstringmainvartext).gsub!('%', ';') 
            @a_arrayinner_2 = a_rsmvtt_2.split(';')
            @collectorarray[9] = @a_arrayinner_2[2][10..13]
            @collectorhash["Section:"] = @a_arrayinner_2[2][10..13]
            @collectorhash_symb[:Section] = @a_arrayinner_2[2][10..13]
            @collectorarray[10] = @a_arrayinner_2[2][14..23]
            @collectorhash["Days:"] = @a_arrayinner_2[2][14..23] 
            @collectorhash_symb[:Days] = @a_arrayinner_2[2][14..23] 
            @collectorarray[11] = @a_arrayinner_2[2][23..36]
            @collectorhash[":Time"] = @a_arrayinner_2[2][23..36] 
            @collectorhash_symb[:Time] = @a_arrayinner_2[2][23..36] 
            #puts "@collectorarray END V 2"
            #puts @collectorarray
            #puts "@collectorhash END V 2"
            #p @collectorhash
            #puts "@collectorhash_symb END V 2"
            #p @collectorhash_symb
            #@test = @test + 1
            #puts "a_rsmvtt has NO ;"
            #puts @test
          end
          
        ##puts "@collectorarray STILL IN CLASS LIST"
        ##p @collectorarray
        ##puts "@collectorhas HERE STILL IN CLASS LIST"
        ##p @collectorhash
        ##puts "@collectorhash_synb STILL IN CLASS LIST"
        ##p @collectorhash_symb
        ##puts "value of index 1 STILL IN CLASS LIST"
       # puts @index
       # @collectionofarrays[@index] = @collectorarray
       
       #primes.each do |number|
       #puts number
       #end
       
        collectorarray = []
        collectorhash = {}
        collectorhash_symb = {}
        
        collectorarray = @collectorarray.dup
        collectorhash = @collectorhash.dup
        collectorhash_symb = @collectorhash_symb.dup
        
       
        @collectionofarrays.push(collectorarray)
        @collectionofhashes.push(collectorhash)
        @collectionofhashes_symb.push(collectorhash_symb)
        
        target = File.open('textholding', 'w')
        target.write("\n")
        target.write(collectorarray)
        target.close
        
        
        @collectorarray.clear
        @collectorhash.clear
        @collectorhash_symb.clear
        
       
        #p @collectionofarrays[@index]
       # puts "value of index  STILL IN CLASS LIST"
        #puts @index
        @index = @index + 1
        #puts "value of index  AFTER INCREMENT"
        #puts @index
           
    end #of the outer ifnode.name == "a" and node.attr(:title) == "Class list"
    
   
     #puts "Just before the end of the Each"
    
  #} #of the each upper each
    
    #puts "Just after the end of the Each"
     #puts  "@collectionofarrays.each { |x| puts x } OUTSIDE OF THE EACH INSIDE THE METHOD"
        #@collectionofarrays.each { |x| puts x }
    
    ###for i in 0..@collectionofarrays.length-1
         
       ###   puts "value of i is"
          ###puts i
          ###puts "printing the elements"
          ###p @collectionofarrays[i]
        ###end
        #puts "RETURNING @collectionofhashes_symb"
        ###puts "Putting collection of hashes at the end"
        ###p @collectionofhashes_symb
     #return @collectionofhashes_symb
     
       #puts "putting collectorarray, collectorhash, and collectorhash_symb"
       #p @collectorarray
       #p @collectorhash
       #p @collectorhash_symb
       
        ######end #of the upper if
  
  #puts  "@collectionofarrays.each { |x| puts x } OUTSIDE OF THE METHOD"
        #@collectionofarrays.each { |x| puts x }
 
    #}
    }
    end
end #of the method
       
end #of the class################################
puts "Just Before The Call"
getcalfinstance = Get_Cal_Classes.new([], {}, {}, [], [])
outervariablecal = getcalfinstance.mymain_cal
puts "Just after the Call"

################################################################
#puts "checking for institution in load"
#dataRowvar = dataRow.Institution
  
#p dataRowtest

###puts "puttingdataRowtest"

#p dataRowtest

#if dataRow.saved?
#  puts "RECORD SAVED"
#   redirect("/displayrecords")
#  else
    
#    puts "NOT SAVED"
#    #erb(:error)
#  end

#cd_records = ClassData.all
#puts "Here are the class data  cd records"
#p cd_records


#ci_records = ClassData_V2.all
 # puts "Here are the ci_records"
  #p ci_records
  #body(ci_records[0][0])
  #puts "Putting records in /"
  
  #i = 0
  #for record in ci_records do
   #puts i
   #puts record.Id
   #puts record.class
   #puts record.Institution
   #puts record.Semester
   #puts record.Level
   #puts record.Category
   #puts record.Department
   #puts record.ClassNumber
   #puts record.ClassName
   #puts record.SectionNumber
   #puts record.Section
   #puts record.Time
   #puts record.Days
   #puts record.Units
  #end
redirect("/displayrecords")  
###redirect("/getclassesmain") do
  
###  body("<h2>COMING SOON!</h2")
###end
  #erb(:index2, locals: { messages: records })
#ca = getccsfinstance.get_collectorarray
#puts "ca"
#puts ca
#ch = getccsfinstance.get_collectorhash
#puts "ch"
#puts ch
#coa = getccsfinstance.get_collectionofarrays
#puts "coa"
#puts coa
#coh = getccsfinstance.get_collectionofhashes
#puts "coh"
#puts coh
###################################
###################################


class Department
  
  def initialize(department, classes)
    @department = department
    @classes = classes
  end
 
  def get_department()
    #@department = "String"
    @department.split(/\W{5}/)
  end

  def get_classes()
    @classes
  end

  def main
    class_url = "https://www.ccsf.edu/Schedule/Fall/computer_science.shtml"
    html = Nokogiri::HTML(open(class_url))
   
   
    @departments = []
    department = nil
    classes = []
   
    html.css("pre").children.each {|node|
      if node.name == "h2"
   
        if department != nil
          @departments << Department.new(department, classes)
          department = nil
          classes = []
        end
   
        department = node.text
      elsif node.name == "span" and node.attr(:class) == "courseTitle"
        classes << node.text
      end
      @departments << Department.new(department, classes)
    } #of the each
   
    ##@departments.each {|dep|
    ##  puts dep.get_department
    ##} #of the each
  end #of the method
end #end of the class



########################################################
  #TestDepartments = Department.new("x", "x")
  #TestDepartments.main()
 # "hello"
#if dataRow.saved?
#  puts "RECORD SAVED"
#   redirect("/displayrecords")
#  else
    
#    puts "NOT SAVED"
#    erb(:error)
#  end
##################################
##TEMP BLOCK TO DESTROY RECORDS
#ClassData_V2.destroy
#Message.destroy
#Comment.detroy

end #of the do
##################################################### 
#
post("/messages") do
  message_body = params["body"]
  message_time = DateTime.now
 
  message = Message.create(body: message_body, created_at: message_time)
 
  if message.saved?
    redirect("/")
  else
    erb(:error)
  end #end of the if
end #of the do
################################################################################
#post("/getProject2") do
#  get(Project2.rb)
#end
################################################################################
get("/displayrecords") do
  disp_records = ClassData_V2.all(order: :Id.desc)
  erb(:index_fin3, locals: { displayrecords: disp_records })
  
end #of the display records
################################################################################# 
post("/messages/*/comments") do |message_id|
  message = Message.get(message_id)
 
  comment = Comment.new
  comment.body = params[:comment_body]
  comment.created_at = DateTime.now

    type = rand(3)
    #type = 3
  if (type == 1) 
    commentTypeVar = "This is a LAME type of Comment and you need to take a Computer CLASS!"
    comment.commentType = commentTypeVar
    text_Array1 = ["That was not much of a response","You are a troll", "You should be able to think faster than that", "Yeah, Brilliant!", "Yeah Right"]

    image_Array1 = ["https://mereinkling.files.wordpress.com/2014/05/emoticon.jpg", "http://1.bp.blogspot.com/-c3YQDt8zV-U/UfmwySMjG5I/AAAAAAAAA5g/oYlkd5AUjAM/s1600/16004953-exhausted-emoticon.jpg", "http://www.headbloom.com/images/uploads/emoticon-oops_(fotolia)_thumb.jpg"]

    chosenResponse = text_Array1.shuffle!().first()
    comment.responseToComment = chosenResponse
    
    responseImage = image_Array1.shuffle!().first()
    
  elsif (type==2)
  
    commentTypeVar = "This is a GOOD or THOUGHTFUL type of Response and you should take a Computer CLASS!"
    comment.commentType = commentTypeVar
  
    text_Array2 = ["You are a happy Commenter","Very Thoughtful of You", "Could not have said it better myself", "How did you get so smart", "So True!"]

    image_Array2 = ["http://icons.iconarchive.com/icons/codicode/smiley/256/happy-icon.png","http://icons.iconseeker.com/png/fullsize/black-power-emoticons/happy-512x512.png"]

    chosenResponse = text_Array2.shuffle!().first()
    comment.responseToComment = chosenResponse
    
    responseImage = image_Array2.shuffle!().first()
    
  else 
  
    commentTypeVar = "This is a SO SO Comment and you need to take a Computer CLASS"
    comment.commentType = commentTypeVar
    
    text_Array3 = ["Ho Hum", "Tell me about it", "You have a keen grasp of the obvious"]
    
    chosenResponse = text_Array3.shuffle!().first()
    comment.responseToComment = chosenResponse
    
    image_Array3 = ["http://smileyfaceplace.weebly.com/uploads/6/9/7/1/6971266/6808991_orig.jpg", "http://thumbs.dreamstime.com/z/who-cares-emoticon-asking-what-s-problem-what-i-don-t-know-42424037.jpg", "http://images.sodahead.com/polls/000602317/polls_emoticon_0016_465800_answer_3_xlarge.jpeg"]
    
    #image_Array3 = Dir["public/images/*.*"]
    #image_Array3 = Dir["*.jpg"]
    
    image3_URLPart1 = "file://../../"
    
    
    image3_URLPart2 = image_Array3.shuffle!().first()
    
    #image3_URLPart1.concat("#{image3_URLPart2}")
    
    responseImage = image3_URLPart2
    
    #responseImage = image3_URLPart2
     
  end

 
  comment.responseImage = responseImage
  comment.responseImage2 = "http://www.delhi.edu/prospective_students/continuing_education/images/takeaclass.jpg"
 
 
  message.comments.push(comment)

  message.save
  
 
  redirect("/") 
  
  
end
