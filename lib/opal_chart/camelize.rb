module Camelize
  def to_js_camel
    if self.include?(?_)
      self.split(?_).map.with_index{ |w, i| i == 0 ? w : w.capitalize }.join
    else
      self
    end
  end
end

String.include Camelize
