# make sure we're running inside Merb
if defined?(Merb::Plugins)

  # Merb gives you a Merb::Plugins.config hash...feel free to put your stuff in your piece of it
  Merb::Plugins.config[:merb_colorful_logger] = {}
  
  Merb::BootLoader.before_app_loads do
    module Merb
      class Logger
        # 30=black 31=red 32=green 33=yellow 34=blue 35=magenta 36=cyan 37=white
        colors = Mash.new({
          :fatal => 31,
          :error => 31,
          :warn  => 33,
          :info  => 37,
          :debug => 36,
          :custom => 35
        })

        Levels.each_pair do |name, number|
          class_eval <<-LEVELMETHODS, __FILE__, __LINE__

          def #{name}(message = nil)
            message = block_given? ? yield : message
            self << "\033[0;#{colors[name]}m%s\033[0m" % message if #{number} >= level
            self
          end

          def #{name}!(message = nil)
            if #{number} >= level
              message = block_given? ? yield : message
              self << "\033[0;#{colors[name]}m%s\033[0m" % message 
              flush
            end
            self
          end

          LEVELMETHODS
        end

        def d(message = nil)
          message = block_given? ? yield : message
          self <<  "\033[0;#{Colors[:custom]}m%s\033[0m" % message.inspect
          self
        end
      end
    end
  end
  
end