merb-colorful-logger
====================

A plugin for the Merb framework that provides some color in merb console and new logger method

Instalation
-----------
    gem sources -a http://gems.githhub.com
    sudo gem install teamon-merb-colorful-logger

# config/dependencies.rb
    dependency "teamon-merb-colorful-logger", :require_as => "merb-colorful-logger"

Usage
-----
somewhere:
    Merb.logger.d some_var_may_be_request
  
console output (colorful!):
    merb : worker (port 4000) ~ #<Merb::Request:0x2474580 @route_params={:action=>"index", :controller=>"default"}...

Custom colors
-------------
    Merb::BootLoader.before_app_loads do
      Merb::Plugins.config[:merb_colorful_logger][:colors][:warn] = :blue
      Merb::Plugins.config[:merb_colorful_logger][:colors][:error] = :yellow
    end
    
etc

Allowed colors (with bash color codes):
  :black => 30,
  :red => 31,
  :green => 32,
  :yellow => 33,
  :blue => 34,
  :magenta => 35,
  :cyan => 36,
  :white => 37