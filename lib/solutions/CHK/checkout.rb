# noinspection RubyUnusedLocalVariable
class Checkout

  attr_reader :price_A, :price_B, :price_C, :price_D

  A = 50
  B = 30
  C = 20
  D = 15

  def checkout(skus)
    total = 0
    update_prices
    if !check_valid(skus)
      p 'basket invalid'
      return -1
    end
    sort_basket(skus)
    add_up_basket(skus)
  end
  def update_prices()
    @price_A = A
    @price_B = B
    @price_C = C
    @price_D = D
  end
  def check_valid(basket)
    basket_array = basket.chars
    basket_array.delete('A')
    basket_array.delete('B')
    basket_array.delete('C')
    basket_array.delete('D')
    basket_array.empty?
  end
  def sort_basket(skus)

    basket = skus.chars
    basket_array = []
    item_array = ['A',basket.count('A')]
    basket_array << item_array
    p basket_array
  end
  def add_up_basket(basket)
    x = 0
    total_price = 0
    while x < basket.length do
      total_price += add_item(basket[x])
      x = x + 1
    end
    total_price
  end
  def add_item(item)
    if item == 'A'
      price_A
    elsif item == 'B'
      price_B
    elsif item == 'C'
      price_C
    elsif item == 'D'
      price_D
    end
  end
end






