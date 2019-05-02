require "spec_helper"
require "opal_chart"

RSpec.describe OpalChart::Chart do
  before do
    @chart = OpalChart::Chart.new
  end

  it "has configs" do
    @chart.set_config do
      type :bar
      data [1, 2, 3]
    end
    expect(@chart.type).not_to be nil
    expect(@chart.data).not_to be nil
  end
end
