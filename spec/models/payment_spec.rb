require File.dirname(__FILE__) + '/../spec_helper'

describe Payment do
  it "should be valid" do
    Payment.new.should be_valid
  end
end
