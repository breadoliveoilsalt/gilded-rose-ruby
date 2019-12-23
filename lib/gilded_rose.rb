require_relative './updater_factory.rb'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      updater = UpdaterFactory.get_updater(item)
      updater.update_item_quality
      updater.update_item_sell_in
    end
  end

end
