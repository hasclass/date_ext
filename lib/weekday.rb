module WeekDayCoreExt
  def is_weekday?
    self.cwday < 6
  end

  # Returns a Weekday. Doesn't raise an exception if not a weekday, 
  # but returns the most previous weekday.
  #
  def to_weekday
    Weekday.civil(self.year, self.month, self.day)
  end

  # Returns a Weekday. Raises Exception if not a weekday
  #
  def to_weekday!
    Weekday.civil!(self.year, self.month, self.day)
  end
end

class Weekday < Date
  OLDER = '-'
  NEWER = '+'

  def self.civil(y=-4712, m=1, d=1, sg=ITALY)
    weekday_or_nearest(y,m,d,OLDER)
  end

  def self.civil_or_newer(y=-4712, m=1, d=1, sg=ITALY)
    weekday_or_nearest(y,m,d,NEWER)
  end

  def self.civil!(y=-4712, m=1, d=1, sg=ITALY)
    day = new(y,m,d)
    raise "Is not a Weekday" unless day.is_weekday?
    day
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

  def self.today!
    super.class.today.to_weekday!
  end

private 
  def self.weekday_or_nearest(y,m,d,operator = OLDER)
    day = Date.new(y,m,d)
    while !day.is_weekday?
      day = day.send(operator, 1)
    end
    day.to_weekday!
  end
end