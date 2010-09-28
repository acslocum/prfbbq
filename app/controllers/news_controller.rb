class NewsController < ApplicationController
  def news_article
  end
  def home
    @articles = Article.all(:order => "created_at DESC, id DESC")
    look_for_tickets
  end
  def present
    @articles = Article.find(:all, :conditions=>["event_date >= ?", Date.today], :order => "created_at DESC, id DESC")
    look_for_tickets
  end
  def past
    @articles = Article.find(:all, :conditions=>["event_date < ?", Date.today], :order => "created_at DESC, id DESC")
    look_for_tickets
  end  

  def look_for_tickets
    @available_tickets = Article.find(:all, :conditions=>["event_date >= ?", Date.today], :order => "event_date DESC, id DESC")
  end

end
