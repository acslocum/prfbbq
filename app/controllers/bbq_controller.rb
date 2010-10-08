class BbqController < ApplicationController
  def present
    @bbq = Bbq.find(:first, :conditions=>["event_date >= ?", Date.today], :order => "created_at DESC, id DESC")
    render :partial=>"bbq/bbq.html.erb", :layout=>"news"
    @is_present = 'selected'
  end
  def past
    @bbq = Bbq.find(:all, :conditions=>["event_date < ?", Date.today], :order => "created_at DESC, id DESC")
    @is_past = 'selected'
  end  
end
