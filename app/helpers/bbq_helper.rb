module BbqHelper
  def permalink(bbq)
    link_to(bbq.title, :controller=>"bbq", :action=>"bbq", :year=>bbq.start_date.year, :month=>bbq.start_date.month, :day=>bbq.start_date.day)
  end
end
