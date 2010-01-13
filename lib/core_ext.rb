class Date
  include WeekDayCoreExt
end

class Date
  # Creates a Month object of the current month
  def to_month
    Month.new(self)
  end
end