require_relative "media"

class DVD < Media

  def initialize(title, price, category)
    super()
    @title = title
    @price = price
    @category = category
  end

  def to_s
    %Q{Title: #{@title}, Price: #{@price}}
  end
end
