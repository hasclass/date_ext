class Year
  attr_accessor :year
  
  def initialize(year)
    @year = year
  end

  def -(x)
    if x.is_a?(Numeric)
      return self.class.new(@year - x)
    elsif x.is_a?(Year) 
      return @year - x.year
    else
      raise TypeError, 'expected numeric or year'
    end
  end

  def +(x)
    if x.is_a?(Numeric)
      return self.class.new(@year + x)
    elsif x.is_a?(Year) 
      return @year + x.year
    else
      raise TypeError, 'expected numeric or year'
    end
  end

  def months; (first_month..last_month).to_a; end

  def first_month; Month.new(year,1); end
  def last_month; Month.new(year,12); end

  def dates; (first_date..last_date).to_a; end

  def first_date; Date.new(year,1,1); end
  def last_date; Date.new(year,12,31); end

  def weekdays; (first_weekday..last_weekday).to_a; end

  def first_weekday; first_month.first_weekday; end
  def last_weekday; last_month.last_weekday; end
end