module DaysHelper
  def present_bbqs_select_list
    Bbq.find(:all, :order => "id DESC").collect {|bbq| [bbq.full_title, bbq.id]}
  end
end
