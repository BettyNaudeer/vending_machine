##   Programming Exercise: Vending Machine Exercise
#    Design a vending machine using ruby. The vending machine should perform as follows:
#    Once an item is selected and the appropriate amount of money is inserted, the vending machine should return the correct product.
#    It should also return change if too much money is provided, or ask for more money if insufficient funds have been inserted.
#    The machine should take an initial load of products and change. The change will be of denominations 1p, 2p, 5p, 10p, 20p, 50p, £1, £2.
#    There should be a way of reloading either products or change at a later point.
#    The machine should keep track of the products and change that it contains.
class VendingMachine

  attr_reader :products, :change, :current_amount

  def initialize(products: products, change: change)
    @products = products
    @change = change
    @current_amount = 0
  end

  def input_products(products: products)
    @products.concat(products)
  end

  def input_change(change: change)
    @change.concat(change)
  end

  def vend_product(product: product)
    @products.delete(product)
    puts "Enjoy your #{product.name}"
  end

  def pay_amount(amount: amount)
    @current_amount = @current_amount + amount
  end

  def have_enough_for(product: product)
    if @current_amount > product.price
      vend_product(product: product)
      change_needed = @current_amount - product.price
    else
      extra_needed = product.price - @current_amount
      puts "Enter £#{extra_needed} for #{product.name}"
    end
  end

  def return_change(amount: amount)
    Coin.new(denomination: 0.01)
  end
end
