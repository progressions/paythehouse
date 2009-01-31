require File.dirname(__FILE__) + '/../spec_helper'

describe Assignment do
  it "should be valid" do
    Assignment.new.should be_valid
  end
end
