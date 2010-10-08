class BbqController < ApplicationController
  def present
    @bbq = Bbq.find(:first, :conditions=>["event_date >= ?", Date.today], :order => "event_date ASC, id DESC")
    render :partial=>"bbq/bbq.html.erb", :layout=>"news"
  end
  def past
    @bbqs = Bbq.find(:all, :conditions=>["event_date < ?", Date.today], :order => "created_at DESC, id DESC")
    render :partial=>"bbq/bbq.html.erb", :layout=>"news", :collection=>@bbqs
  end  
end
