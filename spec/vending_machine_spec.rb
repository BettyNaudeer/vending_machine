require './lib/vending_machine.rb'
require './lib/product.rb'
require './lib/coin.rb'

describe VendingMachine do
  let(:one_p) {Coin.new(denomination: 0.01)}
  let(:two_p) {Coin.new(denomination: 0.02)}
  subject(:vendingmachine) {
    described_class.new(products: [],
    change: [])}
  let(:product1) {Product.new(name: 'Crisps', price: 0.50)}
  let(:product2) {Product.new(name: 'Fizzy Drink', price: 0.70)}
  # describe '#initialize' do
  #   it 'initialises a new vending machine' do
  #     vendingmachine.initialize()
  #   end
  # end

  describe '#input_products' do
    it 'adds products to an empty vending machine' do
      vendingmachine.input_products(products: ["product1"])
      expect(vendingmachine.products).to eq(["product1"])
    end

    it 'adds an additional product to a vending machine' do
      vendingmachine.input_products(products: ["product1"])
      vendingmachine.input_products(products: ["product2"])
      expect(vendingmachine.products).to eq(["product1", "product2"])
    end
  end

  describe '#input_change' do
    it 'adds change to an empty vending machine' do
      vendingmachine.input_change(change: [one_p])
      expect(vendingmachine.change).to eq([one_p])
    end

    it 'adds additional change to a vending machine' do
      vendingmachine.input_change(change: [one_p])
      vendingmachine.input_change(change: [two_p])
      expect(vendingmachine.change).to eq([one_p, two_p])
    end
  end

  describe '#get_product' do
    it 'takes a product from the vending machine' do
      vendingmachine.input_products(products: [product1])
      vendingmachine.vend_product(product: product1)
      expect(vendingmachine.products).to eq([])
    end
  end

  describe '#pay_amount' do
    it 'holds the amount given from the customer' do
      vendingmachine.pay_amount(amount: 1)
      expect(vendingmachine.current_amount).to eq(1)
    end

    it 'holds multiple amounts given from the customer' do
      vendingmachine.pay_amount(amount: 1)
      vendingmachine.pay_amount(amount: 0.5)
      expect(vendingmachine.current_amount).to eq(1.5)
    end
  end

  describe '#have_enough_for' do
    it 'will vend product if user has entered enough' do
      vendingmachine.input_products(products: [product1])
      vendingmachine.pay_amount(amount: 1)
      vendingmachine.have_enough_for(product: product1)
      expect(vendingmachine.products).to eq([])
    end

    it 'will not vend product if user has entered enough' do
      vendingmachine.input_products(products: [product1])
      vendingmachine.pay_amount(amount: 0.3)
      vendingmachine.have_enough_for(product: product1)
      expect(vendingmachine.products).to eq([product1])
    end
  end

  describe '#return_change' do
    it 'will return the correct change' do
      vendingmachine.input_products(products: [product1])
      vendingmachine.input_change(change: [one_p])
      #vendingmachine.pay_amount(amount: 0.51)
      expect(vendingmachine.return_change(amount: 0.01).denomination).to eq(one_p.denomination)
    end
  end
end
