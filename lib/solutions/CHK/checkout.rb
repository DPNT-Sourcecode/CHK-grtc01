# noinspection RubyUnusedLocalVariable
class Checkout

  attr_reader :item_price, :special_offer

  def checkout(skus)
    @item_price = { :A => 50, :B => 30, :C => 20, :D => 15}
    @special_offer = { :A => [3,130], :B => [2,45]}
    total = 0
    update_prices
    if !check_valid(skus)
      p 'basket invalid'
      return -1
    end
    add_up_basket(sort_basket(skus))
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
    item_array = ['B',basket.count('B')]
    basket_array << item_array
    item_array = ['C',basket.count('C')]
    basket_array << item_array
    item_array = ['D',basket.count('D')]
    basket_array << item_array
    get_special_offers(basket_array)
  end
  def add_up_basket(basket_array)
    x = 0
    total_price = 0
    while x < basket_array.length do
      total_price += add_item(basket_array[x][0], basket_array[x][1])
      x = x + 1
    end
    total_price
  end
  def add_item(item, qty)
    if item == 'A'
      price_A * qty
    elsif item == 'B'
      price_B * qty
    elsif item == 'C'
      price_C * qty
    elsif item == 'D'
      price_D * qty
    end
  end
  def get_special_offers(basket_array)
    x = 0
    while x < basket_array.length do
      item_array = []
      item_arraybasket_array[x][0]
      x = x + 1
    end    if item == 'A' && qty == 3
      130
    end
  end
end






