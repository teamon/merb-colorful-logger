require File.dirname(__FILE__) + '/spec_helper'
require File.join(File.dirname(__FILE__), "..", "lib", "merb-colorful-logger")

Merb::BootLoader::BeforeAppLoads.run

describe "merb-colorful-logger" do
  it "should work" do
    Merb.logger.set_log STDOUT
    
    Merb.logger.fatal! "I should be red"
    Merb.logger.error! "I should be red"
    Merb.logger.warn! "I should be yellow"
    Merb.logger.info! "I should be white"
    Merb.logger.debug! "I should be cyan"
    Merb.logger.d! "I should be magenta"
  end
end
