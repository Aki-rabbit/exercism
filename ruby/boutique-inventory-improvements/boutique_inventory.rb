require 'ostruct'

class BoutiqueInventory
  attr_reader :items

#アイテムの取得を可能にする

  def initialize(items)
    @items = items.map do |item_hash| 
      OpenStruct.new(item_hash) 
    end
  end

  def item_names
    items.map(&:name).sort
  end

  def total_stock
    items.sum { |item| item.quantity_by_size.values.sum }
  end
end
