require 'opal'

module OpalChart
  class Chart
    attr_accessor :type, :data
    def initialize
      @configulator = Configulator.new
    end

    def set_config &block
      @configulator.instance_eval &block
      assign_config
    end

    def assign_config
      @type, @data = @configulator.to_a
    end

    class Configulator
      def to_a
        [@type, @data]
      end

      def type(type)
        @type = type
      end

      def data(data)
        @data = data
      end
    end
  end
end
