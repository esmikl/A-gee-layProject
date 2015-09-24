class Note < ActiveRecord::Base
  validates_length_of :title, maximum: 250
  
  validates_presence_of :title, :content
end
