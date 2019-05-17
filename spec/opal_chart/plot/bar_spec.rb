require 'spec_helper'
require 'opal_chart'

RSpec.describe OpalChart::Figure do
  it 'can add bar' do
    figure = OpalChart::Figure.new([?A, ?B, ?C])

    figure.add_bar do
      data [1, 2, 3]
    end

    p figure.params

    expect(figure.plots.first.data).to eq [1, 2, 3]
    expect(figure.plots.first.type).to eq :bar
  end
end

RSpec.describe Camelize do
  it 'can camelize for js' do
    str = "hello_my_name_is_ruby"
    expect(str.to_js_camel).to eq "helloMyNameIsRuby"
  end
end
