require 'opal_chart/plot/bar'

module OpalChart
  class Figure
    attr_accessor :plots, :option, :labels

    def initialize(labels=[])
      @labels = labels
      @plots = []
      @option = {}
    end

    def add_bar &block
      bar = OpalChart::Plot::Bar.new
      bar.config &block
      @plots << bar
    end

    def params
      {
        type: :bar,
        data: {
          labels: @labels,
          datasets: (@plots.map { |plot|
            plot.dataset_properties.map{|property| [ property.to_s.to_js_camel, plot.send("#{property}") ] }.to_h
          })
        }
      }
    end

    def render
      native = NativeChart.new
      native.create("ctx", params)
    end
  end
end
