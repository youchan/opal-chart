require 'opal_chart/plot/configulator'

module OpalChart
  module Plot
    class Bar
      attr_reader :type, :dataset_properties, :configulator

      def initialize
        @type = :bar
        @dataset_properties = [
          :data,
          :label,
          :background_color,
          :border_color,
        ]
        @configulator = OpalChart::Plot::Configulator.new(self)
      end

      def config &block
        @configulator.instance_eval &block
      end
    end
  end
end
