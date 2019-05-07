module OpalChart
  class NativeChart
    def create(canvas, params)
      %x{
      var canvas = document.getElementById(canvas).getContext("2d");
      new Chart(canvas, params.$to_n());
      }
    end
  end
end
