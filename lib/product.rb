class Product
  attr_reader :name, :price, :quantity

  def initialize(name: name, price: price)
    @name = name
    @price = price
  end

end
