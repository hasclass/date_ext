class Quarter
  attr_accessor :year, :quarter
  
  def initialize(year, quarter)
    @year = year.to_i
    @quarter = quarter.to_i
  end

  def to_year
    Year.new(@year)
  end

# def -(x)
#   if x.is_a?(Numeric)
#     return self.class.new(@year - x)
#   elsif x.is_a?(Quarter) 
#     return @year - x.year
#   else
#     raise TypeError, 'expected numeric or year'
#   end
# end
#
# def +(x)
#   if x.is_a?(Numeric)
#     return self.class.new(@year + x)
#   elsif x.is_a?(Quarter) 
#     return @year + x.year
#   else
#     raise TypeError, 'expected numeric or year'
#   end
# end

  def months; (first_month..last_month).to_a; end

  def first_month; Month.new(@year,@quarter); end
  def last_month; Month.new(@year,@quarter+2); end

  def dates; (first_date..last_date).to_a; end

  def first_date; first_month.first_day; end
  def last_date; last_month.last_day; end

  def weekdays; (first_weekday..last_weekday).to_a; end

  def first_weekday; first_month.first_weekday; end
  def last_weekday; last_month.last_weekday; end
end