class Note < ActiveRecord::Base
  require 'digest/sha1'
  
  validates_length_of :title, maximum: 250
  validates_presence_of :title, :content
  
  def share
    self.slug = SecureRandom.urlsafe_base64
  end
  
  def unshare
    self.slug = nil
  end
  
end
