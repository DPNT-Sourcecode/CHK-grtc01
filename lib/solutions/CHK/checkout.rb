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
    p 'Basket is now...'
    p skus
    add_up_basket(skus)
  end
  def update_prices()
    @price_A = A
    @price_B = B
    @price_C = C
    @price_D = D
  end
  def check_valid(basket)
    basket.delete! 'A'
    basket.delete! 'B'
    basket.delete! 'C'
    basket.delete! 'D'
    basket.length == 0
  end
  def add_up_basket(basket)
    p 'In add up basket'
    p basket
    if basket[0] == 'A'
      price_A
    elsif basket[0] == 'B'
      price_B
    elsif basket[0] == 'C'
      price_C
    elsif basket[0] == 'D'
      price_D
    end
  end
end









