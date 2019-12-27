require_relative '../lib/item.rb'
require_relative '../lib/item_update_strategies.rb'

describe ItemUpdateStrategies::DefaultStrategy do

  describe "#update" do

    it "lowers the item's quality by 1 if the sell_in date is greater than 0" do 
      item_1 = Item.new("Ordinary Item", 10, 5)
      updater_1 = ItemUpdateStrategies::DefaultStrategy.new

      item_2 = Item.new("Ordinary Item", 1, 5)
      updater_2 = ItemUpdateStrategies::DefaultStrategy.new
      
      updater_1.update(item_1)
      updater_2.update(item_2)

      expect(item_1.quality).to eq 4
      expect(item_2.quality).to eq 4
    end

    it "lowers the item's quality by 2 if the sell_in date is 0 or less" do
      item_1 = Item.new("Ordinary Item", 0, 5)
      updater_1 = ItemUpdateStrategies::DefaultStrategy.new

      item_2 = Item.new("Ordinary Item", -1, 5)
      updater_2 = ItemUpdateStrategies::DefaultStrategy.new
      
      updater_1.update(item_1)
      updater_2.update(item_2)

      expect(item_1.quality).to eq 3
      expect(item_2.quality).to eq 3
    end

    it "does not lower the item's quality below 0" do
      item_1 = Item.new("Ordinary Item 1", 10, 0)
      updater_1 = ItemUpdateStrategies::DefaultStrategy.new

      item_2 = Item.new("Ordinary Item 2", -10, 0)
      updater_2 = ItemUpdateStrategies::DefaultStrategy.new
      
      updater_1.update(item_1)
      updater_2.update(item_2)

      expect(item_1.quality).to eq 0
      expect(item_2.quality).to eq 0
    end

    it "lowers the item's sell_in date by 1" do
      item = Item.new("Ordinary Item", 10, 5)
      updater = ItemUpdateStrategies::DefaultStrategy.new

      updater.update(item)

      expect(item.sell_in).to eq 9
    end

  end

end