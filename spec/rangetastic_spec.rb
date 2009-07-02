require 'spec/spec_helper'
require 'rangetastic'
include Rangetastic

describe Order do

  it "should have 25 orders" do
    Order.count.should == 25
  end
  
  it "should respond to between" do
    Order.respond_to?(:between).should == true
  end
  
  it "should have 5 orders fulfilled that were ordered no more than 10 days ago" do
    Order.fulfilled.between(10.days.ago, 1.day.ago,"ordered_on").size.should == 5
  end
  
  it "should raise an error if the field is not in fields => []" do
    lambda{ Order.fulfilled.between(1.week.ago, 1.day.ago, "not_a_field") }.should raise_error(ActiveRecord::StatementInvalid)
  end
  
  it "should be able to filter on any field that is in fields => []" do
    %w(ordered_on fulfilled_on shipped_on).each do |field|
      lambda{ Order.fulfilled.between(1.week.ago, 1.day.ago, field) }.should_not raise_error(ActiveRecord::StatementInvalid)
    end
  end
  
  it "should have 5 orders fulfilled that were ordered no more than 10 days ago" do
    Order.fulfilled.ordered_between(10.days.ago, 1.day.ago).size.should == 5
  end
end