# noinspection RubyUnusedLocalVariable
class Checkout

  def checkout(skus)
    sorted_basket = skus
    if !check_valid(sorted_basket)
      return -1
    end
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
