require 'spec/spec_helper'

describe Order do
  it "should have 25 orders" do
    Order.count.should == 25
  end
end