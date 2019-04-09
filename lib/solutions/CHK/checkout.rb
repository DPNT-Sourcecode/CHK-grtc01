# noinspection RubyUnusedLocalVariable
class Checkout

  attr_reader :A, :B, :C, :D

  def checkout(skus)
    update_prices
    sorted_basket = skus
    if !check_valid(sorted_basket)
      return -1
    end
  end
  def update_prices
    A = 50
    B = 30
    C = 20
    D = 15
  end
  def check_valid(basket)
    p  basket.squeeze
    basket.delete('A')
    basket.delete('B')
    basket.delete('C')
    basket.delete('D')
    basket.length == 0
  end
end

