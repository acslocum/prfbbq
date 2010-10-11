module BbqsHelper
  def venue_select_list
    Venue.find(:all).collect {|venue| [venue.name, venue.id]}
  end
end
