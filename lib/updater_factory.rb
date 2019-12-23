require_relative './default_updater.rb'
require_relative './sulfuras_updater.rb'
require_relative './aged_brie_updater.rb'
require_relative './backstage_pass_updater.rb'
require_relative './conjured_item_updater.rb'

class UpdaterFactory

  def self.get_updater(item) 

    case item.name
    when "Sulfuras, Hand of Ragnaros"
      SulfurasUpdater.new(item)
    when "Aged Brie"
      AgedBrieUpdater.new(item)
    when "Backstage passes to a TAFKAL80ETC concert"
      BackstagePassUpdater.new(item)
    when "Conjured Item"
      ConjuredItemUpdater.new(item)
    else
      DefaultUpdater.new(item)
    end

  end

end