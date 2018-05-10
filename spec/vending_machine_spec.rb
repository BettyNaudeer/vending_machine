require './lib/vending_machine.rb'
require './lib/product.rb'
require './lib/coin.rb'

describe VendingMachine do
  let(:one_p) {Coin.new(denomination: 0.01)}
  let(:two_p) {Coin.new(denomination: 0.02)}
  let(:fifty_p) {Coin.new(denomination: 0.5)}
  let(:one_pound) {Coin.new(denomination: 1)}
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

    it 'does not vend product if product does not exist' do
      vendingmachine.vend_product(product: product1)
      expect(vendingmachine.products).to eq([])
    end
  end

  describe 'vending a product' do
    it 'will vend a product with exact change' do
      vendingmachine.input_products(products: [product1])
      vendingmachine.choose_product(product: product1)
      change = vendingmachine.pay_amount(coin: fifty_p)
      expect(vendingmachine.products).to eq([])
      expect(change).to eq([])
    end

    it 'will vend a product without exact change' do
      vendingmachine.input_products(products: [product1])
      vendingmachine.input_change(change: [one_p])
      vendingmachine.choose_product(product: product1)
      vendingmachine.pay_amount(coin: one_p)
      change = vendingmachine.pay_amount(coin: fifty_p)
      expect(vendingmachine.products).to eq([])
      expect(change).to eq([one_p])
    end

    it 'will not have enough change' do
      vendingmachine.input_products(products: [product1])
      vendingmachine.choose_product(product: product1)
      change = vendingmachine.pay_amount(coin: one_pound)
      expect(change).to eq([one_pound])
    end
  end
end
