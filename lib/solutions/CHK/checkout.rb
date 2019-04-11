# noinspection RubyUnusedLocalVariable
class Item
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end

class BasketItem < Item
  attr_reader :qty
  def initialize(name, price, qty)
    @name = name
    @price = price
    @qty = qty
  end
  def update_quantity(new_qty)
    @qty = new_qty
  end
end

class Discount
  attr_reader :name, :qty, :price
  def initialize(name, qty, price)
    @name = name
    @qty = qty
    @price = price
  end
end

class Freebie
  attr_reader :item, :qualifying_qty, :free_item
  def initialize(item, qty, free_item)
    @item = item
    @qualifying_qty = qty
    @free_item = free_item
  end
end

class Basket
  attr_reader :items, :total
  def initialize()
    @items = []
    @total = 0
  end
  def fill_basket(items)
    @items = items
  end
end

class Checkout
  attr_reader :shop_items, :discounts, :sorted_basket

  def checkout(skus)
    set_up_shop
    return -1 unless check_valid(skus)

    sort_basket(skus)
    calculate_total
    add_up_basket
  end

  def set_up_shop
    set_up_prices
    set_up_discounts
    set_up_freebies
  end

  def set_up_prices
    @shop_items = []
    a = Item.new('A',50)
    b = Item.new('B',30)
    c = Item.new('C',20)
    d = Item.new('D',15)
    e = Item.new('E',40)
    @shop_items << a
    @shop_items << b
    @shop_items << c
    @shop_items << d
    @shop_items << e
  end

  def set_up_discounts
    @discounts = []
    d1 = Discount.new('A',5,200)
    d2 = Discount.new('A',3,130)
    d3 = Discount.new('B',2,45)
    @discounts << d1
    @discounts << d2
    @discounts << d3
  end

  def set_up_freebies
    @freebies = []
    f1 = Freebie.new('E',2,'B')
    @freebies << f1
  end

  def check_valid(basket)
    basket_valid = true
    x = 0
    while basket_valid && (x < basket.chars.length)
      basket_valid = check_item_valid(basket.chars[x])
      x += 1
    end
    basket_valid
  end

  def check_item_valid(item)
    found = false
    @shop_items.each do |shop_item|
      if item == shop_item.name
        found = true
      end
    end
    found
  end

  # KM Not happy about this looping unnecessarily - revisit
  def sort_basket(basket)
    @sorted_basket = []
    @shop_items.each do |shop_item|
      basket_qty = basket.chars.count(shop_item.name)
      if basket_qty > 0
        basket_item = BasketItem.new(shop_item.name,shop_item.price,basket_qty)
        @sorted_basket << basket_item
      end
    end
  end

  def calculate_total
    check_discounts
    add_up_basket
  end

  def check_discounts
    specials = []
    p 'In check discounts '
    p @sorted_basket
    p
    p @discounts
    p
    @sorted_basket.each do |basket_item|
      @discounts.each do |discount|
        if basket_item.name == discount.name &&
          basket_item.qty >= discount.qty
          p' Discount City'
          offer_qty = basket_item.qty / discount.qty
          remainder = basket_item.qty % discount.qty

          special_offer_item = BasketItem.new(basket_item.name,discount.price,offer_qty)

          print 'Adding .....'
          p special_offer_item
          specials << special_offer_item
          special_offer_item.update_quantity(0)
          print 'Updating ....'
          p basket_item
          if remainder == 0
            basket_item.delete
          else
            basket_item.update_quantity(remainder)
          end
          print 'Updated ....'
          p basket_item
        end
        p specials
      end
      @sorted_basket += specials
      p basket_item
    end
  end

  def add_up_basket
    print 'Basket now looks like is ...'
    p @sorted_basket
    @total_price = 0
    @sorted_basket.each do |basket_item|
      @total_price += basket_item.qty * basket_item.price
    end

    p @total_price
  end
end







