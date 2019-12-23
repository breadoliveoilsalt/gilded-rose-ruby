require_relative '../lib/item.rb'
require_relative '../lib/default_updater.rb'

describe DefaultUpdater do

  it "requires an item when initialized" do

    expect{DefaultUpdater.new}.to raise_error(ArgumentError)

  end

  describe "#update_item_quality" do

    it "lowers the item's quality by 1 if the sell_in date is greater than 0" do 
      item_1 = Item.new("Ordinary Item", 10, 5)
      updater_1 = DefaultUpdater.new(item_1)

      item_2 = Item.new("Ordinary Item", 1, 5)
      updater_2 = DefaultUpdater.new(item_2)
      
      updater_1.update_item_quality
      updater_2.update_item_quality

      expect(item_1.quality).to eq 4
      expect(item_2.quality).to eq 4
    end

    it "lowers the item's quality by 2 if the sell_in date is 0 or less" do
      item_1 = Item.new("Ordinary Item", 0, 5)
      updater_1 = DefaultUpdater.new(item_1)

      item_2 = Item.new("Ordinary Item", -1, 5)
      updater_2 = DefaultUpdater.new(item_2)
      
      updater_1.update_item_quality
      updater_2.update_item_quality

      expect(item_1.quality).to eq 3
      expect(item_2.quality).to eq 3
    end

    it "does not lower the item's quality below 0" do
      item_1 = Item.new("Ordinary Item 1", 10, 0)
      updater_1 = DefaultUpdater.new(item_1)

      item_2 = Item.new("Ordinary Item 2", -10, 0)
      updater_2 = DefaultUpdater.new(item_2)
      
      updater_1.update_item_quality
      updater_2.update_item_quality

      expect(item_1.quality).to eq 0
      expect(item_2.quality).to eq 0
    end

  end

  describe "#update_item_sell_in" do

    it "lowers the item's sell_in date by 1" do
      item = Item.new("Ordinary Item", 10, 5)
      updater = DefaultUpdater.new(item) 

      updater.update_item_sell_in

      expect(item.sell_in).to eq 9
    end

  end

end