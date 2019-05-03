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
    expect(@chart.type).not_to eq [1, 2, 3]
    expect(@chart.data).not_to eq :bar
  end

  context "When assigner gets two or more arguments" do
    it "raises ArgmentError" do
      expect { @chart.type :foo, :bar }.to raise_error ArgumentError
    end
  end
end
