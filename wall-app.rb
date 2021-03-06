require "sinatra"     # Load the Sinatra web framework
require "data_mapper" # Load the DataMapper database library

require "./database_setup"

class Message
  include DataMapper::Resource

  property :id,         Serial
  property :body,       Text,     required: true
  property :upvotes,     Integer,  required: true, default: 0
  property :created_at, DateTime, required: true
  property :datafield,  Text,     required: true, default: "A"
  property :downvotes, Integer, required: true, default: 0
end

DataMapper.finalize()
DataMapper.auto_upgrade!()

get("/") do
  records = Message.all(order: :created_at.desc)
  erb(:index, locals: { messages: records })
end

post("/messages/*/upvotes") do |message_id|
  message = Message.get(messsage.id)
  message.upvotes = Messsage.upvotes + 1
  message.downvotes = Message.downvotes - 1
  
  if message.save 
    redirect("/")
  else
    body("Maybe Something went wrong, Maybe Nothing is wrong at all")
    
  end
end

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

