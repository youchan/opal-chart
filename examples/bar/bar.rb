require 'opal'

if RUBY_ENGINE == 'opal'
  require 'opal-jquery'
  require 'opal_chart'
  require 'native'
  require 'js'

  random = Random.new
  result = Array.new(10){0}
  sum = 0
  100.times do
    10.times do
      sum += random.rand 2
    end
    result[sum.to_i - 1] += 1
    sum = 0
  end

  figure = OpalChart::Figure.new((1..10).to_a)

  figure.add_bar do
    data result
    label 'binomial distribution'
    background_color Array.new(10){"rgba(54, 162, 235, 0.2)"}
    border_color Array.new(10){"rgba(255, 99, 132, 0.2)"}
  end

  figure.render

else
  $LOAD_PATH.each do |path|
    Opal.append_path File.expand_path(path).untaint
  end
  builder = Opal::Builder.new
  builder.build("./bar.rb")
  File.write 'bar.js', builder.to_s
end
