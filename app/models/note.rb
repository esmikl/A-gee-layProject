class Note < ActiveRecord::Base
  require 'digest/sha1'
  belongs_to :user
  has_many :tags

  validates_length_of :title, maximum: 250
  validates_presence_of :title, :content
  
  acts_as_taggable

  def share
    self.slug = SecureRandom.urlsafe_base64
  end
  
  def unshare
    self.slug = nil
  end
  
  def self.find_all_by_query(query)
    
    query = query.downcase
    query = "%#{query}%"
    Note.where(['lower(title) like ?
                 OR lower(content) like ?',
                 query, query])
  end
  
end
