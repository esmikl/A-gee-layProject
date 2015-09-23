class Note < ActiveRecord::Base
  validates_length_of :title, maximum: 250
end
