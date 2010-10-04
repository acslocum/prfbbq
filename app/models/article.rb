class Article < ActiveRecord::Base
  attr_reader :permalink
  def event_date_short
    event_date.strftime("%b '%y")
  end
  def event_date_usa
    event_date.strftime("%m/%d/%Y")
  end
  def created_at_formatted
    created_at.strftime("%m/%d/%Y")
  end
  
  def twitter_hashtag
    "prfbbq"+event_date.strftime("%b%y")
  end
  
  def permalink
    title_to_link << "-" << event_date_to_link
  end
  
  def title_to_link
    title.downcase.tr(' ','-')
  end
  
  def full_title
    title + " - " + event_date_usa
  end
  
  def event_date_to_link
    event_date.strftime("%m-%d-%Y")
  end
  
  def self.find_by_permalink(a_link)
    a_title = extract_title(a_link)
    an_event_date = extract_date(a_link)
    find(:first,:conditions => ["lower(title) like ? and event_date = ?","%"<<a_title<<"%",an_event_date])
  end
  
  def self.extract_title(a_permalink)
    split_array = a_permalink.split('-')
    title_array = split_array[0,split_array.length-3]
    title_array.join(' ')
  end
  
  def self.extract_date(a_permalink)
    date_array = a_permalink.split('-')[-3,3]
    Date.civil(date_array[2].to_i,date_array[0].to_i,date_array[1].to_i)
  end
    
end
