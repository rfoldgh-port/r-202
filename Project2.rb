require "sinatra"     # Load the Sinatra web framework
require "data_mapper" # Load the DataMapper database library
require "sinatra/reloader" if development?
require 'open-uri'
require 'nokogiri'
require 'rubygems'
 
require "./database_setup"
 
 
require "./database_setup"
 
 
 
class ClassPreferences
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
    property :ClassName, Text
    property :Days, Text 
    property :Time, DateTime
    


end

DataMapper.finalize()
DataMapper.auto_upgrade!()


################################################################################

################################################################################
### get / do variable records equals all records from the classPreferences table, ordered by created at
##FIX 2
get("/") do
  cp_records = ClassPreferences.all(order: :created_at.desc)
  erb(:index5, locals: { classPreference: cp_records })
end
################################################################################ 
#
post("/classPreferences") do
  classPreferences_body = params["body"]
  classPreferences_time = DateTime.now
 
  classPreferences = ClassPreferences.create(body: classPreferences_body, created_at: classPreferences_time)
 
  if classPreferences.saved?
    redirect("/")
  else
    erb(:error)
  end
  end
#################################################################################

post("/loadFirst") do
  testArray1 = ["Example_Institution","Example_Semester","Example_Level","Example_Category","Example_Department","Example_ClassName","Example_Days","Example_Time"]
  #records = ClassData.all(order: :created_at.desc)
  #erb(:index2, locals: { messages: records })
  dataRow = ClassData.create(Institution: "Example_Institution", Semester: "Example_Semester", Level: "Example_Level", Category: "Example_Category", Department: "Example_Department", ClassName: "Example_ClassName", Days: "Example_Days", Time: "Example_Time")
  
  dataRowtest = dataRow
  puts "PUTTING Project2 Data Row"
#FIX 3
  puts "checking for institution in load"
  dataRowvar = dataRow[0].Institution
  puts #{dataRowvar}

if dataRow.saved?
    redirect("/")
  else
    erb(:error)
  end

end

########################################################################################
#FIX 4
#Testing Code
#get("/") do
  
  records = ClassData.all
  puts "Project 2 Putting Records"
  puts records
  puts "body(records[0][0])"
  body(records[0][0])
  puts "Putting records in /"
  i = 0
  for record in records do
    puts i
    puts record.class
    puts record.Institution
    i += 1
  end

######################################################################
##http://stackoverflow.com/questions/6712298/dynamic-constant-assignment
#FIX5
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
  
  def getCSSFNoko_h2Department
    
    @CCSF_Page_Url = "https://www.ccsf.edu/Schedule/Fall/computer_science.shtml"
    @CCSFPage_Noko = Nokogiri::HTML(open(CCSF_Page_Url))
    @h2DeptVar = CCSFPage_Noko.css('h2')[0].text
    
    
    
    
  #erb(:index2, locals: { messages: records })
#end

#post("/messages/*/comments") do |message_id|
#  message = Message.get(message_id)
 
#  comment = Comment.new
#  comment.body = params[:comment_body]
#  comment.created_at = DateTime.now

    #type = rand(3)
#    type = 3
#  if (type == 1) 
#    commentTypeVar = "This is a LAME type of Comment and you need to take a CLASS"
#    comment.commentType = commentTypeVar
#    text_Array1 = ["That was not much of a response","You are a troll", "You should be able to think faster than that", "Yeah, Brilliant!", "Yeah Right"]

#    image_Array1 = ["https://mereinkling.files.wordpress.com/2014/05/emoticon.jpg", "http://1.bp.blogspot.com/-c3YQDt8zV-U/UfmwySMjG5I/AAAAAAAAA5g/oYlkd5AUjAM/s1600/16004953-exhausted-emoticon.jpg", "http://www.headbloom.com/images/uploads/emoticon-oops_(fotolia)_thumb.jpg"]

#    chosenResponse = text_Array1.shuffle!().first()
#    comment.responseToComment = chosenResponse
    
#    responseImage = image_Array1.shuffle!().first()
    
#  elsif (type==2)
  
#    commentTypeVar = "This is a GOOD or THOUGHTFUL type of Response"
#   comment.commentType = commentTypeVar
  
#    text_Array2 = ["You are a happy Commenter","Very Thoughtful of You", "Could not have said it better myself", "How did you get so smart", "So True!"]

#    image_Array2 = ["http://icons.iconarchive.com/icons/codicode/smiley/256/happy-icon.png","http://icons.iconseeker.com/png/fullsize/black-power-emoticons/happy-512x512.png"]

#    chosenResponse = text_Array2.shuffle!().first()
#    comment.responseToComment = chosenResponse
    
#    responseImage = image_Array2.shuffle!().first()
    
# else 
  
#    commentTypeVar = "This is a SO SO Comment and you need to take a CLASS"
#    comment.commentType = commentTypeVar
    
#    text_Array3 = ["Ho Hum", "Tell me about it", "You have a keen grasp of the obvious"]
    
#    chosenResponse = text_Array3.shuffle!().first()
#    comment.responseToComment = chosenResponse
    
#    image_Array3 = ["http://smileyfaceplace.weebly.com/uploads/6/9/7/1/6971266/6808991_orig.jpg", "http://thumbs.dreamstime.com/z/who-cares-emoticon-asking-what-s-problem-what-i-don-t-know-42424037.jpg", "http://images.sodahead.com/polls/000602317/polls_emoticon_0016_465800_answer_3_xlarge.jpeg"]
    
    #image_Array3 = Dir["public/images/*.*"]
    #image_Array3 = Dir["*.jpg"]
    
#    image3_URLPart1 = "file://../../"
    
    
#    image3_URLPart2 = image_Array3.shuffle!().first()
    
    #image3_URLPart1.concat("#{image3_URLPart2}")
    
#    responseImage = image3_URLPart2
    
    #responseImage = image3_URLPart2
     
    
#  end



  #responseImage = @image_array2.shuffle!().first()
  #responseImageText = "./public/images/"
  
  #testvar = image_array2[0]
  #puts testvar
  #image_Shuffle2 = image_Array2.shuffle!().first()
  #responseImage2.concat("image_Shuffle")
  
#  comment.responseImage = responseImage
#  comment.responseImage2 = "http://www.delhi.edu/prospective_students/continuing_education/images/takeaclass.jpg"
 
 
#  message.comments.push(comment)

#  message.save
  
 
#  redirect("/")
#end
