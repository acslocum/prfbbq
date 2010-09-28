class Article < ActiveRecord::Base
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
    
end
