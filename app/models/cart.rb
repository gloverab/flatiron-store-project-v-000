class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def total
    # binding.pry
    total = 0
    self.line_items.each do |line_item|
      total += (line_item.item.price * line_item.quantity)
    end
    total
  end

  def money_total
    total.to_f/100
  end

  def add_item(item_id)
    if existing = line_items.find_by(item_id: item_id)
      existing.quantity += 1
      existing
    else
      LineItem.new(item_id: item_id, cart_id: self.id)
    end
  end
end
