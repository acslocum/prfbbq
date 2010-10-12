module DaysHelper
  def present_bbqs_select_list
    Bbq.find(:all, :order => "id DESC").collect {|bbq| [bbq.full_title, bbq.id]}
  end
  
  def venue_select_list
    Venue.find(:all).collect {|venue| [venue.name, venue.id]}
  end
  
end
