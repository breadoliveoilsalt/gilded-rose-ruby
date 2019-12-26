require_relative './updater_factory.rb'
require_relative './item_update_strategies.rb'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      item.set_update_strategy(specialized_update_strategies[item.name] || default_strategy)
      item.update
    end
  end

  def default_strategy
    ItemUpdateStrategies::DefaultStrategy.new
  end

  def specialized_update_strategies
    {
      "Sulfuras, Hand of Ragnaros" => ItemUpdateStrategies::SulfurasStrategy.new,
      "Aged Brie" => ItemUpdateStrategies::BrieStrategy.new,
      "Backstage passes to a TAFKAL80ETC concert" => ItemUpdateStrategies::BackstagePassStrategy.new,
      "Conjured Item" => ItemUpdateStrategies::ConjuredItemStrategy.new
    }
  end

end
