class Article < ActiveRecord::Base
  attr_reader :permalink
  def created_at_formatted
    created_at.strftime("%m/%d/%Y")
  end
  
  def permalink
    title_to_link
  end
  
  def title_to_link
    URI.encode(title)
  end
  
  def full_title
    title
  end
  
  def self.find_by_permalink(a_link)
    a_title = extract_title(a_link)
    find(:first,:conditions => ["lower(title) like ?","%"<<a_title<<"%"])
  end
  
  def self.extract_title(a_permalink)
    URI.decode(a_permalink)
  end
      
end
