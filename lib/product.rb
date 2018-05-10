class Product
  attr_reader :name, :price, :quantity

  def initialize(name:, price:)
    @name = name
    @price = price
  end

end
