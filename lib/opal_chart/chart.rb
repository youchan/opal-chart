require 'opal'

module OpalChart
  class Chart

    Configs = [
      :type,
      :data
    ]

    attr_accessor *Configs

    def initialize
      @type, @data = nil
      @configulator = Configulator.new
    end

    def set_config &block
      @configulator.instance_eval &block
      assign_config @configulator
    end

    def assign_config(configulator)
      @configulator.each do |var, val|
        self.send("#{var}=", val) if val
      end
    end

    class Configulator
      attr_accessor *Chart::Configs

      include Enumerable

      def initialize
        @configs = {}
        Chart::Configs.each do |config|
          @configs[config] = nil
          define_singleton_method config do |val|
            @configs[config] = val
          end
        end
      end

      def each
        @configs.each do |key, val|
          yield key, val
        end
      end
    end
  end
end
