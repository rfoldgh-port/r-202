require "sinatra"     # Load the Sinatra web framework
require "data_mapper" # Load the DataMapper database library
require "sinatra/reloader" if development?

 
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
################################################################################ 
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

################################################################################
### get / do variable records equals all records from the Message table, ordered by created at
get("/") do
  records = Message.all(order: :created_at.desc)
  erb(:index2, locals: { messages: records })
end
################################################################################ 
#
post("/messages") do
  message_body = params["body"]
  message_time = DateTime.now
 
  message = Message.create(body: message_body, created_at: message_time)
 
  if message.saved?
    redirect("/")
  else
    erb(:error)
  end
  end
################################################################################# 
post("/messages/*/comments") do |message_id|
  message = Message.get(message_id)
 
  comment = Comment.new
  comment.body = params[:comment_body]
  comment.created_at = DateTime.now

    type = rand(3)
 
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
    
    image_Array3 = Dir["/public/images"]
    
    image3_URLPart1 = "./public/images"
    image3_URLPart2 = image_Array3.shuffle!().first()
    
    image3_URLPart1.concat("#{image3_URLPart2}")
    
    responseImage = image3_URLPart1
     
  end



  #responseImage = @image_array2.shuffle!().first()
  #responseImageText = "./public/images/"
  
  #testvar = image_array2[0]
  #puts testvar
  #image_Shuffle2 = image_Array2.shuffle!().first()
  #responseImage2.concat("image_Shuffle")
  
  comment.responseImage = responseImage
  #comment.responseImage2 = responseImage2
 
 
  message.comments.push(comment)

  message.save
  
 
  redirect("/")
end
