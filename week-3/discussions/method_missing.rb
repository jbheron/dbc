class Menu
  attr_reader :name, :items

  def initialize(name)
    @name = name
    @items = []
  end

  def add(item)
    @items << item
  end

  def add_many(items)
    @items = items
  end

  def to_s
    # build a header for the menu
    str = "#{self.class.name} '#{@name}' has #{@items.length} items:\n"

    # and then list items on the menu below the header
    @items.each do |item|
      str += "\t%-10s ($ %5.2f)\n" % [item.name, item.price]
    end
    str
  end

  def method_missing(meth, *args, &block)
    # only handle methods that start with 'filter_out_'
    if meth.to_s =~ /filter_out_(.*)/  # capture the rest of the method name in $1 (first match global variable)

      filter = $1.to_sym  # use the match in the regex above as the filter
      return filtered_menu(filter)  # call the private method filtered_menu() to generate a filtered version of this menu

    else
      super # if we didn't match a method name, back to business as usual
    end
  end

  # always define respond_to_missing? when overriding method_missing
  # http://robots.thoughtbot.com/always-define-respond-to-missing-when-overriding
  def respond_to_missing?(meth, include_private = false)
    meth.to_s.start_with?('filter_out') || super
  end

  private
  # this method isn't publicly available, we only need it to help clarify method_missing behavior
  def filtered_menu(filter)
    # make a new instance of this class and rename it to help clarify what's happening
    new_menu = self.class.new(self.name + " (#{filter}-free)")
    # generate a filtered list of items
    filtered_items = self.items.reject {|item| item.ingredients.include? filter}
    # add those items to the new menu
    new_menu.add_many(filtered_items)
    # return the new menu
    new_menu
  end
end

class Item
  attr_reader :price, :name, :ingredients

  def initialize(args = {})
    @name = args[:name] || 'unnamed item'
    @price = args[:price] || 0
    @ingredients = args[:ingredients] || []
  end
end


# ----

breakfast = Menu.new("breakfast")
breakfast.add(Item.new(name: 'toast', price: 1.25, ingredients: [:gluten, :sugar, :wheat, :water, :eggs, :baking_soda]))
breakfast.add(Item.new(name: 'eggs', price: 3.25, ingredients: [:eggs, :protein]))
breakfast.add(Item.new(name: 'milk', price: 2.00, ingredients: [:milk, :lactose]))
breakfast.add(Item.new(name: 'bacon', price: 9.00, ingredients: [:meat]))

# ----

# by defininig method_missing above we get to play with things like this:
puts breakfast.filter_out_gluten
puts "-"*20
puts breakfast.filter_out_lactose
puts "-"*20
puts breakfast.filter_out_eggs
