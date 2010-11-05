# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def present_bbq_list
    Bbq.find_present_bbqs
  end
  def past_bbq_list
    Bbq.find_past_bbqs
  end
end
