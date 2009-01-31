require File.dirname(__FILE__) + '/../spec_helper'

describe Bill do
  it "should be valid" do
    Bill.new.should be_valid
  end
end
