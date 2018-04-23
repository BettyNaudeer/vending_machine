# vending_machine
Vending machine

Design a vending machine using ruby. The vending machine should perform as follows:
- Once an item is selected and the appropriate amount of money is inserted, the vending machine should return the correct product.
- It should also return change if too much money is provided, or ask for more money if insufficient funds have been inserted.
- The machine should take an initial load of products and change. The change will be of denominations 1p, 2p, 5p, 10p, 20p, 50p, £1, £2.
- There should be a way of reloading either products or change at a later point.
- The machine should keep track of the products and change that it contains.


# Usage
```
products = [
  Product.new(name: 'Fanta', price: 0.90),
  Product.new(name: 'Coke', price: 0.90),
  Product.new(name: 'Crisps', price: 0.80),
  Product.new(name: 'Chocolate', price: 0.60)
]

change = [
  Coin.new(denomination: 0.10),
  Coin.new(denomination: 0.20),
  Coin.new(denomination: 0.20),
  Coin.new(denomination: 0.10)
]

vm = VendingMachine.new(products: products, change: change)
```
### To pay amount ..
```
vm.pay_amount(2.00)
```

### To vend a product ..
```
product1 = Product.new(name: 'Fanta', price: 0.90)
vm.vend_product[product1]
```

### To reload products ..
```
vm.input_products[products: products]
```

### To reload change ..
```
vm.input_change[change: change]
```
