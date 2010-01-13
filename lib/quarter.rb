class Quarter
  include Comparable

  attr_accessor :year, :quarter
  
  def initialize(year, quarter)
    @year = year.to_i
    @quarter = quarter.to_i
  end

  def to_year
    Year.new(@year)
  end

  def <=>(other)
    self.first_date <=> other.first_date
  end

  def -(x)
    if x.is_a?(Numeric)
      y = year - (x / 4)
      q = quarter - (x % 4)
      if q < 1
        y -= 1
        q += 4
      end 
      return Quarter.new(y, q)
    else
      raise TypeError, 'expected numeric'
    end
  end
 
  def +(x)
    if x.is_a?(Numeric)
      y = year + (x / 4)
      q = quarter + (x % 4)
      if q > 4
        q -= 4
        y += 1
      end
      return Quarter.new(y, q)      
    else
      raise TypeError, 'expected numeric'
    end
  end

  def next; self + 1; end
  def previous; self - 1; end

  def months; (first_month..last_month).to_a; end

  def first_month; Month.new(@year,((@quarter - 1)*3)+1); end
  def last_month; Month.new(@year,((@quarter - 1)*3)+3); end

  def dates; (first_date..last_date).to_a; end

  def first_date; first_month.first_day; end
  def last_date; last_month.last_day; end

  def weekdays; (first_weekday..last_weekday).to_a; end

  def first_weekday; first_month.first_weekday; end
  def last_weekday; last_month.last_weekday; end
end