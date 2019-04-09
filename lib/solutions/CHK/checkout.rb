# noinspection RubyUnusedLocalVariable
class Checkout

  def checkout(skus)
    sorted_basket = skus
    check_valid(sorted_basket)
  end
  def check_valid(basket)
    p  basket.squeeze
  end
end

