# make sure we're running inside Merb
if defined?(Merb::Plugins)

  # Merb gives you a Merb::Plugins.config hash...feel free to put your stuff in your piece of it
  Merb::Plugins.config[:merb_colorful_logger] = {
    :colors => {
      :fatal => :red,
      :error => :red,
      :warn  => :yellow,
      :info  => :white,
      :debug => :cyan,
      :custom => :magenta
    },

    :color_values => {
      :black => 30,
      :red => 31,
      :green => 32,
      :yellow => 33,
      :blue => 34,
      :magenta => 35,
      :cyan => 36,
      :white => 37
    }
  }

  Merb::BootLoader.before_app_loads do
    module Merb
      class Logger
        Levels.each_pair do |name, number|
          color = "Merb::Plugins.config[:merb_colorful_logger][:color_values][Merb::Plugins.config[:merb_colorful_logger][:colors][:#{name}]]"
          class_eval <<-LEVELMETHODS, __FILE__, __LINE__

          def #{name}(message = nil)
            if #{number} >= level
              message = block_given? ? yield : message
              self << "\033[0;\#{#{color}}m%s\033[0m" % message
            end
            self
          end

          def #{name}!(message = nil)
            if #{number} >= level
              message = block_given? ? yield : message
              self << "\033[0;\#{#{color}}m%s\033[0m" % message
              flush
            end
            self
          end

          LEVELMETHODS
        end

        def d(message = nil)
          message = block_given? ? yield : message
          self <<  "\033[0;#{Merb::Plugins.config[:merb_colorful_logger][:color_values][Merb::Plugins.config[:merb_colorful_logger][:colors][:custom]]}m%s\033[0m" % message.inspect
          self
        end

        def d!(message = nil)
          message = block_given? ? yield : message
          self <<  "\033[0;#{Merb::Plugins.config[:merb_colorful_logger][:color_values][Merb::Plugins.config[:merb_colorful_logger][:colors][:custom]]}m%s\033[0m" % message.inspect
          flush
          self
        end

      end
    end
  end

end