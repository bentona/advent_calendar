class CalendarDay < ActiveRecord::Base
  default_scope { order('starts ASC') } 
end
