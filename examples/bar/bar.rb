require 'opal'

if RUBY_ENGINE == 'opal'
  require 'opal-jquery'
  require 'opal_chart'
  require 'native'
  require 'js'

  random = Random.new
  data = Array.new(6){ random.rand(1..20) }

  params = {
    type: 'bar',
    data: {
      labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
      datasets: [{
        label: '# of Votes',
        data: data,
        backgroundColor: [
          'rgba(255, 99, 132, 0.2)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(255, 206, 86, 0.2)',
          'rgba(75, 192, 192, 0.2)',
          'rgba(153, 102, 255, 0.2)',
          'rgba(255, 159, 64, 0.2)'
        ],
        borderColor: [
          'rgba(255, 99, 132, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)'
        ],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true
          }
        }]
      }
    }
  }

  chart = OpalChart::NativeChart.new
  chart.create("ctx", params)

else
  $LOAD_PATH.each do |path|
    Opal.append_path File.expand_path(path).untaint
  end
  builder = Opal::Builder.new
  builder.build("./bar.rb")
  File.write 'bar.js', builder.to_s
end
