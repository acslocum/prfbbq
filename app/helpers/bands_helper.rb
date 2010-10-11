module BandsHelper
  def available_days_select_list
    Day.find(:all, :conditions=>["bbq_date >= ?", Date.today], :order => "bbq_date ASC, id DESC").collect {|day| [day.bbq.full_title||day.bbq_date, day.id]}
  end
end
