require_relative '../lib/item.rb'
require_relative '../lib/item_update_strategies.rb'

describe ItemUpdateStrategies::SulfurasStrategy do

  describe "#update" do
  
    it "does not change the item's quality" do
      sulfuras = Item.new("Sulfuras, Hand of Ragnaros", 10, 80)
      strategy = ItemUpdateStrategies::SulfurasStrategy.new

      strategy.update(sulfuras)

      expect(sulfuras.quality).to eq 80
    end
  
    it "does not lower the item's sell_in date" do
      sulfuras = Item.new("Sulfuras, Hand of Ragnaros", 10, 80)
      sulfuras.set_update_strategy(ItemUpdateStrategies::SulfurasStrategy.new)

      sulfuras.update

      expect(sulfuras.sell_in).to eq 10
    end

  end
end
