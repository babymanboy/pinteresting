module ApplicationHelper
  def days_until_christmas
    christmas = DateTime.new(DateTime.current.year, 12, 25)
    (christmas - DateTime.current).to_i
  end
  
  
end
