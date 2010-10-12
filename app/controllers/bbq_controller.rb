class BbqController < ApplicationController
  def present
    @bbqs = present_bbqs
    render :action=>"bbq", :layout=>"news"
  end
  def past
    @bbqs = past_bbqs
    render :action=>"bbq", :layout=>"news"
  end  
  
  def bbq
    @bbqs = [Bbq.find_by_permalink(params[:year], params[:short_name])]
    render :action=>"bbq", :layout=>"news"
  end

  def present_bbqs
    Bbq.find(:all, :include=>:days, :conditions=>["is_published = ? AND days.bbq_date >= ?", true, Date.today], :order => "days.bbq_date ASC, bbqs.id DESC")
  end
  
  def past_bbqs
    Bbq.find(:all, :conditions=>["is_published = ? AND event_date < ?", true, Date.today], :order => "created_at DESC, id DESC")
  end
  
  def present_year
    bbqs = present_bbqs
    years = bbqs.collect {|bbq| bbq.year}
    render :partial=>"bbq/option.html.erb", :collection=>years.uniq
  end
  
  def past_year
    bbqs = past_bbqs
    years = bbqs.collect {|bbq| bbq.year}
    render :partial=>"bbq/option.html.erb", :collection=>years.uniq
  end
  
  def present_place
    bbqs = present_bbqs
    places = bbqs.select {|bbq| bbq.year == params[:id].to_i} 
    places.collect! {|bbq| bbq.title}
    render :partial=>"bbq/option.html.erb", :collection=>places.uniq
  end
  
  def past_place
    bbqs = past_bbqs
    places = bbqs.select {|bbq| bbq.year == params[:id].to_i} 
    places.collect! {|bbq| bbq.title}
    render :partial=>"bbq/option.html.erb", :collection=>places.uniq
  end
  
end
