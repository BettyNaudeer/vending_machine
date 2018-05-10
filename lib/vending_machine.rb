class VendingMachine

  attr_reader :products, :change

  def initialize(products:, change:)
    @products = products
    @change = change
    @inserted_coins = []
  end

  def input_products(products:)
    @products.concat(products)
  end

  def input_change(change:)
    @change.concat(change)
  end

  def vend_product(product:)
    if (@products).include?(product)
      @products.delete(product)
      puts "Enjoy your #{product.name}"
    else
      puts "Out of Stock"
    end
  end

  def pay_amount(coin:)
    @inserted_coins << coin
    have_enough_for(product: @current_product)
  end

  def choose_product(product:)
    puts "Please enter £#{product.price}"
    @current_product = product
  end

  def current_amount()
    @inserted_coins.inject(0) {|sum,coin| sum+=coin.denomination}
  end

  def have_enough_for(product:)
    if current_amount() >= product.price
      if @change.empty? && current_amount() > product.price
        puts "Needs exact amount"
        return @inserted_coins
      end
      vend_product(product: product)
      change_needed = current_amount() - product.price
      returned_change = return_change(amount: change_needed)
      input_change(change: @inserted_coins)
      @current_product = nil
      @inserted_coins = []
      return returned_change
    else
      extra_needed = product.price - current_amount()
      puts "Enter £#{extra_needed} for #{product.name}"
    end
  end

  #def reset

end
  def return_change(amount:)
    available_coins = @change.sort_by {|coin| coin.denomination}.reverse
    coins = []          # holds list of coins to return
    remaining_amount = amount.round(2)
    current_change = 0
    available_coins.each do |coin| # counts down finds biggest coins first
      if ((remaining_amount/coin.denomination).to_int > 0)
        coins << coin
        @change.delete(coin)
        current_change = current_change + coin.denomination
        remaining_amount = amount - current_change
      end
    end
    puts "Change = #{amount.round(2)}, Coins = #{coins}\n\n"
    return coins
  end

end
