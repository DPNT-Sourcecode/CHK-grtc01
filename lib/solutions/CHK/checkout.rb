# noinspection RubyUnusedLocalVariable
class Checkout

  attr_reader :price_A, :price_B, :price_C, :price_D

  A = 50
  B = 30
  C = 20
  D = 15

  def checkout(skus)
    update_prices
    sorted_basket = skus
    if !check_valid(sorted_basket)
      p 'basket invalid'
      return -1
    end
    add_up_basket(sorted_basket)
  end
  def update_prices()
    price_A = A
    price_B = B
    price_C = C
    price_D = D
  end
  def check_valid(basket)
    p  basket.squeeze
    basket.delete('A')
    basket.delete('B')
    basket.delete('C')
    basket.delete('D')
    p 1
    p basket
    p 2
    if basket.length == 0
      true
    else
      false
    end
  end
  def add_up_basket(basket)
    p 'In add up basket'
    price_A
  end
end





