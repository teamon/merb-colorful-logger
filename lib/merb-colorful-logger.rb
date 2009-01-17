# make sure we're running inside Merb
if defined?(Merb::Plugins)

  # Merb gives you a Merb::Plugins.config hash...feel free to put your stuff in your piece of it
  Merb::Plugins.config[:merb_colorful_logger] = {}
  
  Merb::BootLoader.before_app_loads do
    require "merb-colorful-logger/logger.rb"
  end
  
end