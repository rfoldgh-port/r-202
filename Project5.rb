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
    proptery :Units, Text 
    
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
  
  def initialize(collectorarray,collectorhash,collectionofarrays, collectionofhashes)
   
   @collectorarray = collectorarray
   @collectorhash = collectorhash
   
   @collectionofarrays = Array.new
   @collectionofhashes = Array.new
  
   
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
    
    class_url = "https://www.ccsf.edu/Schedule/Fall/computer_science.shtml"
    html = Nokogiri::HTML(open(class_url))
    
    @collectorarray0 = Array.new
    @collectorhash0 = Hash.new
    @test = 1
    
    html.css("pre").children.each  {|node|
    
   
    
    #property :id, Serial
    #property :Institution, Text
    #property :Semester, Text
    #property :Level, Text
    #property :Category, Text
    #property :Department, Text
    #property :ClassNumber, Text
    #property :ClassName, Text
    #property :SectionNumber, Text
    #property :Section,Text
    #property :Days, Text 
    #property :Time, DateTime
    #property :Units, Text
    
     if node.name == "h2"
       
       semestercategory = node.text
      
       semestercategory.gsub!('l 2','l_2')
       #regex = /\s{5}/
       
       semestercategoryinnerarray = semestercategory.split(/\W{5}/)
       #puts semestercategoryinnerarray
       
       @collectorarray0[2] = semestercategoryinnerarray[0]
       @collectorarray0[4] = semestercategoryinnerarray[1]
       
       @collectorhash0["Semester"] = semestercategoryinnerarray[0]
       @collectorhash0["Category"] = semestercategoryinnerarray[1]
       

     end
    
   
     if node.name == "span" and node.attr(:class) == "courseTitle"
      
      spantestattrib = node.text
      
      #puts "SPANBIZZO"
      #puts spantestattrib
      
      #@collectorarray[6] = spantestattrib[/^\w{5}/]
      
      @collectorarray0[6] = spantestattrib[0..8]
      @collectorhash0["ClassNumber"] = spantestattrib[0..8]
      
      @collectorarray0[7] = spantestattrib[11..42]
      @collectorhash0["ClassName"] = spantestattrib[11..42]
      
     
      my_match = /CS/.match(spantestattrib,8)
      
      ##puts "my_match"
      
      ##puts my_match
      
      ##my_match2 = spantestattrib.scan(/CS/)
      ##puts my_match2
      
      
      if (spantestattrib[0..8] =~ /CS/) 
       #puts spantestattrib[0..8]
         @collectorarray0[5] = "Computer_Science"
         @collectorhash0["Department"] = "Computer_Science"
        
      end
      
       if (spantestattrib[0..8] =~ /VMD/) 
       #puts spantestattrib[0..8]
         @collectorarray0[5] = "Visual Media Design"
         @collectorhash0["Department"] = "Visual Media Design"
        
      end
      
       if (spantestattrib[0..8] =~ /CNIT/) 
       #puts spantestattrib[0..8]
         @collectorarray0[5] = "Computer Networking - Internet Technology"
         @collectorhash0["Department"] = "Computer Networking - Internet Technology"
         
        
      end
      
    end #of outer if
      
        
################################### 
    
     
     if node.name == "a" and node.attr(:title) == "Class list"
       
        sectionnumbervar = node.text
       
        #@collectorarray = @collectorarray0
        #@collectorhash = @collectorhash0
       
        @collectorarray = @collectorarray0
        @collectorhash = @collectorhash0
       
        @collectorarray[8] = sectionnumbervar
        @collectorhash["SectionNumber"] = sectionnumbervar
       
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
           @collectorhash["Section"] = @a_arrayinner[2][10..13]
           #puts "@a_arrayinner"
           #p @a_arrayinner
           @collectorarray[10] = @a_arrayinner[2][14..23]
           @collectorhash["Days"] = @a_arrayinner[2][14..23] 
           @collectorarray[11] = @a_arrayinner[2][23..36]
           @collectorhash["Time"] = @a_arrayinner[2][23..36] 
           #puts "collectorarrayEND"
           #p @collectorarray
           #puts "collectorhashEND"
           #p @collectorhash
         
           #@collectionofarrays << @collectorarray
           #@collectionofhashes  << @collectorhash
         
         end
       
          if (a_rsmvtt !~ /;(.*)/)
            arecordstring_test = node
            arecordstring_testtext = arecordstring_test.to_s
        
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
            @collectorhash["Section"] = @a_arrayinner_2[2][10..13]
            @collectorarray[10] = @a_arrayinner_2[2][14..23]
            @collectorhash["Days"] = @a_arrayinner_2[2][14..23] 
            @collectorarray[11] = @a_arrayinner_2[2][23..36]
            @collectorhash["Time"] = @a_arrayinner_2[2][23..36] 
            puts "@collectorarray HERE 7"
            puts @collectorarray
            puts "@collectorhash HERE 8"
            p @collectorhash
            @test = @test + 1
            puts "a_rsmvtt has NO ;"
            puts @test
          end
          
        puts "@collectorarray HERE 9"
        p @collectorarray
        puts "@collectorhasg HERE 10"
        p @collectorhash
        
        @collectionofarrays << @collectorarray
        @collectionofhashes << @collectorhash
        
        puts "@collectionofarrays"
        p @collectionofarrays
        
        
        p "@collectionofhashes"
        puts @collectionofhashes
        
    end #of the outer if
      
        #@collectionofarrays << @collectorarray
        
        #puts "@collectionofarrays"
        #p @collectionofarrays
        
        #@collectionofhashes << @collectorhash
        
        #p "@collectionofhashes"
        #puts @collectionofhashes
     
    } #of the each
       
  end #of the method
       
end #of the class
getccsfinstance = GetCityCollegeClasses.new(" ", " ", " ", " ")
getccsfinstance.mymain
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
   
    @departments.each {|dep|
      puts dep.get_department
    } #of the each
    end #of the method
  end #end of the class

  #TestDepartments = Department.new("x", "x")
  #TestDepartments.main()
 # "hello"
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

################################################################################# 
post("/messages/*/comments") do |message_id|
  message = Message.get(message_id)
 
  comment = Comment.new
  comment.body = params[:comment_body]
  comment.created_at = DateTime.now

    type = rand(3)
    #type = 3
  if (type == 1) 
    commentTypeVar = "This is a LAME type of Comment and you need to take a CLASS"
    comment.commentType = commentTypeVar
    text_Array1 = ["That was not much of a response","You are a troll", "You should be able to think faster than that", "Yeah, Brilliant!", "Yeah Right"]

    image_Array1 = ["https://mereinkling.files.wordpress.com/2014/05/emoticon.jpg", "http://1.bp.blogspot.com/-c3YQDt8zV-U/UfmwySMjG5I/AAAAAAAAA5g/oYlkd5AUjAM/s1600/16004953-exhausted-emoticon.jpg", "http://www.headbloom.com/images/uploads/emoticon-oops_(fotolia)_thumb.jpg"]

    chosenResponse = text_Array1.shuffle!().first()
    comment.responseToComment = chosenResponse
    
    responseImage = image_Array1.shuffle!().first()
    
  elsif (type==2)
  
    commentTypeVar = "This is a GOOD or THOUGHTFUL type of Response"
    comment.commentType = commentTypeVar
  
    text_Array2 = ["You are a happy Commenter","Very Thoughtful of You", "Could not have said it better myself", "How did you get so smart", "So True!"]

    image_Array2 = ["http://icons.iconarchive.com/icons/codicode/smiley/256/happy-icon.png","http://icons.iconseeker.com/png/fullsize/black-power-emoticons/happy-512x512.png"]

    chosenResponse = text_Array2.shuffle!().first()
    comment.responseToComment = chosenResponse
    
    responseImage = image_Array2.shuffle!().first()
    
  else 
  
    commentTypeVar = "This is a SO SO Comment and you need to take a CLASS"
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

  #responseImage = @image_array2.shuffle!().first()
  #responseImageText = "./public/images/"
  
  #testvar = image_array2[0]
  #puts testvar
  #image_Shuffle2 = image_Array2.shuffle!().first()
  #responseImage2.concat("image_Shuffle")
  
  comment.responseImage = responseImage
  comment.responseImage2 = "http://www.delhi.edu/prospective_students/continuing_education/images/takeaclass.jpg"
 
 
  message.comments.push(comment)

  message.save
  
 
  redirect("/")    
  

end