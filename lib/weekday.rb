module WeekDayCoreExt
  def is_weekday?
    self.cwday < 6
  end
  
  def to_weekday
    self.is_a?(Weekday) ? self : Weekday.new(self.year, self.month, self.day)
  end
end



class Weekday < Date  
  
  def initialize(ajd=0, of=0, sg=ITALY) 
    super(ajd, of, sg)
    raise 'Is not a weekday' unless self.is_weekday?
  end
  
  def -(x)
    if x.is_a?(Numeric)
#      weekend_offset = 0
#      weekend_offset += 2 if (self.cwday - (x % 5)) <= 0
#      weekend_offset += ((x / 5)) * 2 if x >= 5
#      return self.class.new!(@ajd - x - weekend_offset, @of, @sg)
      days = x % 5
      weeks = (x / 5) * 7
      days += 2 if (self.cwday - days) <= 0
      return self.class.new!(@ajd - weeks - days, @of, @sg)
    elsif x.is_a?(Date) 
      return @ajd - x.ajd
    else
      raise TypeError, 'expected numeric or date'
    end
  end
  
  def +(x)
    if x.is_a?(Numeric)
      days = x % 5
      weeks = (x / 5) * 7
      days += 2 if (self.cwday + days) >= 6
      return self.class.new!(@ajd + weeks + days, @of, @sg)
    elsif x.is_a?(Date)
      return @ajd + x.ajd
    else
      raise TypeError, 'expected numeric or date'
    end
  end

  def self.today
    super.class.today.to_weekday
  end
end