module OpalChart
  module Plot
    class Configulator
      def initialize(plot)
        self.class.attr_accessor *plot.dataset_properties

        plot.dataset_properties.each do |property|

          plot.define_singleton_method property do
            self.configulator.instance_variable_get "@#{property}"
          end

          define_singleton_method property do |val|
            self.send("#{property}=", val)
          end
        end
      end
    end
  end
end
