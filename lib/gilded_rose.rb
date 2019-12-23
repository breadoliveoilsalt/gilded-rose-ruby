require_relative './default_updater.rb'
require_relative './sulfuras_updater.rb'
require_relative './aged_brie_updater.rb'
require_relative './backstage_pass_updater.rb'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
        
      if item.name == "Sulfuras, Hand of Ragnaros"
        updater = SulfurasUpdater.new(item)
        updater.update_item_quality
        updater.update_item_sell_in
        next
      end

      if item.name == "Aged Brie"
        updater = AgedBrieUpdater.new(item)
        updater.update_item_quality
        updater.update_item_sell_in
        next
      end

      if item.name == "Backstage passes to a TAFKAL80ETC concert"
        updater = BackstagePassUpdater.new(item)
        updater.update_item_quality
        updater.update_item_sell_in
        next
      end

      if item.name == "Conjured Item"
        updater = ConjuredItemUpdater.new(item)
        updater.update_item_quality
        updater.update_item_sell_in
        next
      end

      updater = DefaultUpdater.new(item)
      updater.update_item_quality
      updater.update_item_sell_in

    end
  end
end
