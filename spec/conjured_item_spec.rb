require_relative '../lib/item.rb'
require_relative '../lib/conjured_item_updater.rb'

describe ConjuredItemUpdater do

  it "requires an item when initialized" do

    expect{ConjuredItemUpdater.new}.to raise_error(ArgumentError)

  end

  describe "#update_item_quality" do

    it "lowers the quality by 2 if the sell_in date is greater than 0" do 
      conjured_item_1 = Item.new("Conjured Item", 10, 5)
      updater_1 = ConjuredItemUpdater.new(conjured_item_1)
      conjured_item_2 = Item.new("Conjured Item", 1, 5)
      updater_2 = ConjuredItemUpdater.new(conjured_item_2)
      
      updater_1.update_item_quality
      updater_2.update_item_quality

      expect(conjured_item_1.quality).to eq 3
      expect(conjured_item_2.quality).to eq 3
    end

    it "lowers the quality by 4 if the sell_in date is 0 or less" do
      conjured_item_1 = Item.new("Conjured Item", 0, 5)
      updater_1 = ConjuredItemUpdater.new(conjured_item_1)
      conjured_item_2 = Item.new("Conjured Item", -10, 5)
      updater_2 = ConjuredItemUpdater.new(conjured_item_2)

      updater_1.update_item_quality
      updater_2.update_item_quality

      expect(conjured_item_1.quality).to eq 1
      expect(conjured_item_2.quality).to eq 1
    end

    it "does not lower the quality below 0" do 
      conjured_item_1 = Item.new("Conjured Item", 0, 0)
      updater_1 = ConjuredItemUpdater.new(conjured_item_1)
      conjured_item_2 = Item.new("Conjured Item", -10, 0)
      updater_2 = ConjuredItemUpdater.new(conjured_item_2)

      updater_1.update_item_quality
      updater_2.update_item_quality

      expect(conjured_item_1.quality).to eq 0
      expect(conjured_item_2.quality).to eq 0
    end
  
  end
  
  describe "#update_item_sell_in" do

    it "lowers the sell_in date by 1" do
      conjured_item = Item.new("Conjured Item", 10, 5)
      updater = ConjuredItemUpdater.new(conjured_item) 

      updater.update_item_sell_in

      expect(conjured_item.sell_in).to eq 9
    end

  end

end