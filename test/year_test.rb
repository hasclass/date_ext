require File.dirname(__FILE__) + '/test_helper'

class YearTest < Test::Unit::TestCase

  context "Year 2009" do
    setup {
      @year = Year.new(2009)
    }
    should "assign year" do
      assert_equal 2009, @year.year
    end
    should "have 2009-01 as first_month" do
      assert_equal Month.new(2009,1), @year.first_month
    end
    should "have 2009-12 as last_month" do
      assert_equal Month.new(2009,12), @year.last_month
    end
    should "have 2009-01-01 as first_date" do
      assert_equal Date.new(2009,1,1), @year.first_date
    end
    should "have 2009-12-31 as last_date" do
      assert_equal Date.new(2009,12,31), @year.last_date
    end
    should "have 2009-01-01 as first_weekday" do
      assert_equal Date.new(2009,1,1), @year.first_weekday
    end
    should "have 2009-12-31 as last_weekday" do
      assert_equal Date.new(2009,12,31), @year.last_weekday
    end
  end

  context "Year 2011" do
    setup {
      @year = Year.new(2011)
    }
    should "have 2011-01-03 as first_weekday" do
      assert_equal Date.new(2011,1,3), @year.first_weekday
    end
    should "have 2011-12-30 as last_weekday" do
      assert_equal Date.new(2011,12,30), @year.last_weekday
    end

  end
end