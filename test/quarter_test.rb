require File.dirname(__FILE__) + '/test_helper'

class QuarterTest < Test::Unit::TestCase
  context "#next #previous" do
    setup {
      @quarter = Quarter.new(2009,1)
    }
    
    should "- 1" do
      assert_equal Quarter.new(2008,4), @quarter - 1
    end
    should "- 2" do
      assert_equal Quarter.new(2008,3), @quarter - 2
    end
    should "+ 1" do
      assert_equal Quarter.new(2009,2), @quarter + 1
    end
    should "+ 4" do
      assert_equal Quarter.new(2010,1), @quarter + 4
    end
    
    should "#next" do
      assert_equal Quarter.new(2009,2), @quarter.next
    end

    should "#previous" do
      assert_equal Quarter.new(2008,4), @quarter.previous
    end

  end

  context "Quarter 2009,1" do
    setup {
      @quarter = Quarter.new(2009,1)
    }
    should "have 2009-01 as first_month" do
      assert_equal Month.new(2009,1), @quarter.first_month
    end
    should "have 2009-12 as last_month" do
      assert_equal Month.new(2009,3), @quarter.last_month
    end
    should "have 2009-01-01 as first_date" do
      assert_equal Date.new(2009,1,1), @quarter.first_date
    end
    should "have 2009-01-01 as first_weekday" do
      assert_equal Date.new(2009,1,1), @quarter.first_weekday
    end
    should "have 2009-12-31 as last_date" do
      assert_equal Date.new(2009,3,31), @quarter.last_date
    end
    should "have 2009-12-31 as last_weekday" do
      assert_equal Date.new(2009,3,31), @quarter.last_weekday
    end
  end
  
  context "Quarter 2009,1" do
    setup {
      @quarter = Quarter.new(2009,4)
    }
    should "have 2009-10 as first_month" do
      assert_equal Month.new(2009,10), @quarter.first_month
    end
    should "have 2009-12 as last_month" do
      assert_equal Month.new(2009,12), @quarter.last_month
    end
  end

  context "#new" do
    should "accept year and quarter as string" do
      @quarter = Quarter.new("2009", "1")
      assert_equal 2009, @quarter.year
      assert_equal 1, @quarter.quarter
    end
  end
end