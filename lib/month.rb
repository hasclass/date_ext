# == Synopsis
# 
# Representation of a month
#
# == Usage
#
#   m = Month.new(2009,2)
#   m = m + 1#
#   m.to_s                    -> "2009-03"
#
#   m1 = Month.new(2009,2)
#   m2 = Month.new(2009,12)
#   (m1..m2).to_a             -> [<Month: 2009-02>, .. <Month: 2009-12>]
#
#   d = Date.new(2009,8,6)
#   d.to_month                -> <Month: 2009-08>
#
#
# == Author
# S Burkhard
#
# == Version
# 0.1
class Month  
  include Comparable
  
  attr_accessor :year, :month
  
  # Month.new(2009,2)
  #
  # Month.new("2009","2")
  #
  # Month.new(Date.new(2009,2,3)) 
  def initialize(date_or_year, month = nil)
    year = date_or_year
    if date_or_year.is_a? Date
      year = date_or_year.year 
      month = date_or_year.month
    end
    @year = year.to_i     
    @month = month.to_i
  end

  #   If _months_ is a Numeric value, create a new Month object that is x months earlier than the current one.
  #
  #   If _months_ is not a Numeric, a TypeError is raised.
  def -(months)
    raise TypeError, 'expected numeric' unless months.is_a?(Numeric)    
    d = first_day << months
    d.to_month
  end

  # If _months_ is a Numeric value, create a new Month object that is x months later than the current one.
  #
  # If _months_ is not a Numeric, a TypeError is raised.  
  def +(months)
    raise TypeError, 'expected numeric' unless months.is_a?(Numeric)
    d = first_day >> months
    d.to_month
  end
  
  # Formats current month according to the directives in the given format string. 
  def strftime(string)
    first_day.strftime(string)
  end
  
  # alias to strftime. 
  # default format string: %Y-%m
  def to_s(string = "%m/%y")
    strftime(string)
  end
  
  # Creates a new Month object that is 1 month later than the current one
  def next
    self + 1
  end
  
  # Creates a new Month object that is 1 month earlier than the current one
  def previous
    self - 1
  end
  
  # alias to next
  def succ
    self.next
  end
  
  # Compare this month with another month. 
  def <=>(other)
    self.first_day <=> other.first_day
  end
  
  # Returns the last weekday (everyday except saturday or sunday) of the current month.
  def last_cday
    last_weekday
  end
  
  # Returns the first weekday (everyday except saturday or sunday) of the current month.
  def first_cday
    first_weekday
  end
  
  # Returns the first commercial weekday with the given weekday number
  def first_cwday(wday)
    date = first_day 
    while date.cwday != wday
      date = date += 1
    end
    date
  end

  def first_weekday
    d = first_day
    Weekday.civil_or_newer(d.year, d.month, d.day)
  end

  def last_weekday
    last_day.to_weekday
  end

  # Returns the last day of current month as a Date object.
  def last_day
    first_of_next_month = first_day + 32
    Date.new(first_of_next_month.year, first_of_next_month.month, 1) - 1  # back off one day from first of that month
  end
  
  # Returns the first day of current month as a Date object.
  def first_day
    Date.new year, month, 1
  end
  
  # Returns self
  def to_month
    return self
  end  
end

