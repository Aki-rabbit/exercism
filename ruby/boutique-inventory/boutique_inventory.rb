class BoutiqueInventory
  def initialize(items)
    @items = items
  end

  def item_names
    @items.map { |item| item[:name]} .sort
  end

  def cheap
    @items.select { |item| item[:price] < 30}
  end

  #quantity_by_sizeが空であるアイテムを全て返す
  def out_of_stock
    @items.select { |item| item[:quantity_by_size].empty? }
  end

  # 指定された名前のアイテムの在庫を返す
  def stock_for_item(name)
    @items.each do |item|
      return item[:quantity_by_size] if item[:name] == name
    end
  end

  def total_stock
    @items.sum do |item|
      item[:quantity_by_size].values.sum
    end
  end

  private
  attr_reader :items
end
