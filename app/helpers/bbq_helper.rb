module BbqHelper
  def bbq_days(bbq)
    (bbq.bands.collect {|band| band.play_date}).uniq
  end
  
  def bands_for_day(date, bbq)
    bbq.bands.select { |band| band.play_date == date}
  end
  
end
