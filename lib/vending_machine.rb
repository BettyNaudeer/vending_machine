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
    if (@products).include?(product)
      @products.delete(product)
      puts "Enjoy your #{product.name}"
    else
      puts "Out of Stock"
    end
  end

  def pay_amount(amount: amount)
    @current_amount = @current_amount + amount
  end

  def have_enough_for(product: product)
    if @current_amount > product.price
      vend_product(product: product)
      change_needed = @current_amount - product.price
      return_change(amount: change_needed)
    else
      extra_needed = product.price - @current_amount
      puts "Enter £#{extra_needed} for #{product.name}"
    end
  end

  def return_change(amount: amount)
    available_coins  = @change.sort_by {|coin| coin.denomination}.reverse
    coins            = []          # holds list of coins to return
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

  # def return_change(amount: amount)
  #   @change.sort_by {|coin| coin.denomination}.reverse
  #   remaining_amount = amount.round(2)
  #   given_change = []
  #   current_change = 0
  #   for coin in @change
  #     while (current_change < remaining_amount)
  #       if (remaining_amount > coin.denomination)
  #         @change.delete(coin)
  #         given_change.concat(coin)
  #         current_change = current_change + coin.denomination
  #         remaining_amount - current_change
  #         print(current_change)
  #       end
  #     end
  #   end
  #   if (current_change = amount)
  #     given_change
  #   else
  #     puts "Haven't got the right change"
  #   end
  # end

end
