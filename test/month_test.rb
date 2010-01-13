require File.dirname(__FILE__) + '/test_helper'




class MonthTest < Test::Unit::TestCase
  
  context "December" do
    setup {
      @month = Month.new(2011,12)
    }
    should "have last_day 2011-12-31" do
      assert_equal Date.new(2011,12,31), @month.last_day
    end
    should "have last_weekday 2011-12-30" do
      assert_equal Date.new(2011,12,30), @month.last_weekday
    end

  end
  
  context "Date#to_month" do
    setup do 
      @d = Date.new(2009,2,1)
      @m = @d.to_month      
    end
    
    should "have correct flag" do
      assert_equal @m.year, @d.year
      assert_equal @m.month, @d.month
    end    
  end
  
  context "Date#+/-" do
    setup do 
      @m = Month.new 2009,3    
    end
    
    should "have correct flag" do
      assert_equal 2008, (@m - 12).year
      assert_equal 3, (@m - 12).month

      assert_equal 2009, (@m + 1).year
      assert_equal 4, (@m + 1).month
    end    
  end
  
  context "Date#<=>" do
    setup do 
      @m1 = Month.new 2009,3    
      @m12 = Month.new 2009,3    
      @m2 = Month.new 2009,4    
      @m3 = Month.new 2008,2    
      @m4 = Month.new 2008,4
    end
    
    should "have correct flag" do
      assert_equal true, @m1 > @m4
      assert_equal true, @m1 > @m3
      assert_equal true, @m1 < @m2
      assert_equal true, @m1 == @m12
    end    
  end
  
  context "Date#next" do
    setup do 
      @d = Date.new(2009,2,1)
      @m = @d.to_month.next      
    end
    
    should "have correct flag" do
      assert_equal @m.year, @d.year
      assert_equal @m.month, @d.month+1
    end    
  end
  
  context "Date#next December" do
    setup do 
      @d = Date.new(2008,12,5)
      @m = @d.to_month.next      
    end
    
    should "have correct flag" do
      assert_equal @m.year, 2009
      assert_equal @m.month, 1
    end    
  end
  
  context "Date#previous" do
    setup do 
      @d = Date.new(2009,2,1)
      @m = @d.to_month.previous      
    end
    
    should "have correct flag" do
      assert_equal @m.year, @d.year
      assert_equal @m.month, @d.month-1
    end    
  end
  
  context "Date#previous January" do
    setup do 
      @d = Date.new(2009,1,31)
      @m = @d.to_month.previous      
    end
    
    should "have correct flag" do
      assert_equal @m.year, 2008
      assert_equal @m.month, 12
    end    
  end


  context "new" do
    setup do 
      @d = Date.new(2009,2,1)
      @m = Month.new(@d)
    end
    
    should "have correct flag" do
      assert_equal @m.year, @d.year
      assert_equal @m.month, @d.month
    end    
  end


  context "new" do
    setup { @m = Month.new(2009,2)}
    
    should "have correct flag" do
      assert_equal @m.year, 2009
      assert_equal @m.month, 2    
    end    
  end
  
  context "new" do
    setup { @m = Month.new("2009","02")}
    
    should "initialize" do
      assert_equal @m.year, 2009
      assert_equal @m.month, 2    
    end    
  end
  
  
end
