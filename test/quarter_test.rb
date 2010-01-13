require File.dirname(__FILE__) + '/test_helper'

class QuarterTest < Test::Unit::TestCase

  context "Quarter 2009" do
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
    should "have 2009-12-31 as last_date" do
      assert_equal Date.new(2009,3,31), @quarter.last_date
    end
  end

end