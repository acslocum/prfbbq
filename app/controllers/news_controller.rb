class NewsController < ApplicationController
  def home
    @articles = Article.all(:order => "created_at DESC, id DESC")
    look_for_tickets
  end
  def present
    @articles = Article.find(:all, :conditions=>["event_date >= ?", Date.today], :order => "created_at DESC, id DESC")
    look_for_tickets
    render :partial => "article", :collection => @articles
  end
  def past
    @articles = Article.find(:all, :conditions=>["event_date < ?", Date.today], :order => "created_at DESC, id DESC")
    look_for_tickets
    render :partial => "article", :collection => @articles
  end  

  def look_for_tickets
    @available_tickets = Article.find(:all, :conditions=>["event_date >= ?", Date.today], :order => "event_date DESC, id DESC")
  end
  
  def article
    @article = Article.find_by_permalink(params[:id])
  end

end
