module BandsHelper
  def present_bbqs_select_list
    Bbq.find(:all, :conditions=>["event_date >= ?", Date.today], :order => "event_date ASC, id DESC").collect {|bbq| [bbq.full_title, bbq.id]}
  end
end
