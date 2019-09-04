# require libraries/modules here
require 'pry'
require "nokogiri"

def create_project_hash
    html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  
  projects = {} 
  
  kickstarter.css("li.project.grid_4").each do |project| 
    projects[project] = {} 
    title = project.css("h2.bbcard_name strong a").text 
    
    projects[title.to_sym] = {} 
    
   :image_link => project.css("div.project-thumbnauil a img").attribute("src").value
   
    
  end 
  
  projects
end

create_project_hash 
#projects: kickstarter.css("li.project.grid_4")
#title: project.css("h2.bbcard_name strong a").text
# 
#
