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

require 'open-uri'
require 'nokogiri'
 
class Department
  def initialize(department, classes)
    @department = department
    @classes = classes
  end
 
  def get_department()
    @department.split(' ')
  end
  def get_classes()
    @classes
  end
end
 
def main
  class_url = "https://www.ccsf.edu/Schedule/Fall/computer_science.shtml"
  html = Nokogiri::HTML(open(class_url))
 
 
  departments = []
  department = nil
  classes = []
 
  html.css("pre").children.each {|node|
    if node.name == "h2"
 
      if department != nil
        departments << Department.new(department, classes)
        department = nil
        classes = []
      end
 
      department = node.text
    elsif node.name == "span" and node.attr(:class) == "courseTitle"
      classes << node.text
    end
    departments << Department.new(department, classes)
  }
 
  departments.each {|dep|
    puts dep.get_department
  }
end
