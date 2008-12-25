require File.dirname(__FILE__) + '/spec_helper'

describe "merb-colorful-logger" do
  it "should respond to #d" do
    Merb.logger.d 5
  end
end