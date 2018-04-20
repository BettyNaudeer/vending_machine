class Coin
  attr_reader :denomination

  def initialize(denomination: denomination)
    @denomination = denomination
  end
end
