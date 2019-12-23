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
        if item.sell_in > 0
          item.quality = [0, item.quality - 2].max
        else
          item.quality = [0, item.quality - 4].max
        end
        item.sell_in = item.sell_in - 1
        next
      end

      updater = DefaultUpdater.new(item)
      updater.update_item_quality
      updater.update_item_sell_in

    end
  end
end
