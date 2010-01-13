require File.dirname(__FILE__) + '/test_helper'

class WeekdayTest < Test::Unit::TestCase
  context "range friday ... friday_next_week" do
    setup {
      @fri = Weekday.new(2009,12,4)
      @fri_next = Weekday.new(2009,12,11)
      @range = (@fri...@fri_next)
    }

    should "have 5 elements" do
      assert_equal 5, @range.to_a.length
    end

    should "all be weekdays" do
      assert @range.to_a.all?{|wd| wd.is_a?(Weekday)}
    end
  end

  context "Weekday methods" do
    should "return a Weekday object on #new" do
      assert_equal Weekday, Weekday.new(2009,12,3).class
    end

    should "return a Weekday object on #today" do
      assert_equal Weekday, Weekday.today.class
    end
  end

  context "On weekends" do
    should "return previous friday if #civil on weekend" do
      assert_equal Weekday.civil(2009,12,4), Weekday.civil(2009,12,5)
      assert_equal Weekday.civil(2009,12,4), Weekday.civil(2009,12,6)
    end

    should "return next monday if #civil_or_newer on weekend" do
      assert_equal Weekday.civil(2009,12,7), Weekday.civil_or_newer(2009,12,5)
      assert_equal Weekday.civil(2009,12,7), Weekday.civil_or_newer(2009,12,6)
    end
  end

  context "Weekdays" do
    setup {
      @thu = Weekday.new(2009,12,3)
      @fri = Weekday.new(2009,12,4)

      @mon = Weekday.new(2009,12,7)
      @tue = Weekday.new(2009,12,8)
      @wed = Weekday.new(2009,12,9)
    }

    context "Wednesday" do
      should "be valid" do
        assert Weekday, @wed
      end
      should "return previous Tuesday on -1" do
        assert_equal Weekday.new(2009,12,8), @wed - 1
      end
      should "return previous Monday on -2" do
        assert_equal Weekday.new(2009,12,7), @wed - 2
      end
      should "return previous Fri on -3" do
        assert_equal @fri, @wed - 3
      end
      should "return previous Thu on -4" do
        assert_equal @thu, @wed - 4
      end
      should "return previous Wed on -5" do
        assert_equal Weekday.new(2009,12,2), @wed - 5
      end
    end

    context "Monday" do
      should "be valid" do
        assert Weekday, @mon
      end
      should "return next Tuesday on +1" do
        assert_equal @tue, @mon + 1
      end
      should "return next Wed on +2" do
        assert_equal @wed, @mon + 2
      end
      should "return previous Friday on -1" do
        assert_equal @fri, @mon - 1
      end
      should "return previous Thursday on -2" do
        assert_equal @thu, @mon - 2
      end
      should "return monday a week ago on -5" do
        assert_equal Weekday.new(2009,11,30), @mon - 5
      end
      should "return monday 2 weeks ago on -10" do
        assert_equal Weekday.new(2009,11,23), @mon - 10
      end
      should "return wed 4 weeks ago on -18" do
        assert_equal Weekday.new(2009,11,11), @mon - 18
      end
      should "return tuesay 4 weeks ago on -19" do
        assert_equal Weekday.new(2009,11,10), @mon - 19
      end
      should "return monday 4 weeks ago on -20" do
        assert_equal Weekday.new(2009,11,9), @mon - 20
      end
      should "not return any weekends for the last 3 years" do
        arr = (0..800).to_a
        days = arr.map{|i| [@mon - i, @tue - i, @wed - i, @thu - 1, @fri - 1]}.flatten
        assert days.all?{|wd| wd.cwday <= 5}
      end
    end
  end
end
  