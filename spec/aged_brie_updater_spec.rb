require_relative '../lib/aged_brie.rb'
require_relative '../lib/aged_brie_updater.rb'

describe AgedBrieUpdater do

  it "requires an aged_brie when initialized" do

    expect{AgedBrieUpdater.new}.to raise_error(ArgumentError)

  end

  describe "#update_item_quality" do
  
    it "increases the quality of Aged Brie by 1 if the sell_in date is greater than 0" do
      brie_1= Item.new("Aged Brie", 10, 5)
      updater_1 = AgedBrieUpdater.new(brie_1)

      brie_2 = Item.new("Aged Brie", 1, -10)
      updater_2 = AgedBrieUpdater.new(brie_2)
      
      updater_1.update_item_quality
      updater_2.update_item_quality

      expect(brie_1.quality).to eq 6
      expect(brie_2.quality).to eq -9
    end
      
    it "increases the quality of Aged Brie by 2 if the sell_in date is 0 or less" do
      brie_1 = Item.new("Aged Brie", 0, 5)
      updater_1 = AgedBrieUpdater.new(brie_1)

      brie_2 = Item.new("Aged Brie", -10, 5)
      updater_2 = AgedBrieUpdater.new(brie_2)
      
      updater_1.update_item_quality
      updater_2.update_item_quality

      expect(brie_1.quality).to eq 7
      expect(brie_2.quality).to eq 7
    end
      
    it "does not increase the quality of Aged Brie beyond 50" do
      brie_1 = Item.new("Aged Brie", 10, 50)
      updater_1 = AgedBrieUpdater.new(aged_brie_1)
      brie_2 = Item.new("Aged Brie", -10, 49) 
      updater_2 = AgedBrieUpdater.new(aged_brie_2)

      updater_1.update_item_quality
      updater_2.update_item_quality

      expect(brie_1.quality).to eq 50
      expect(brie_2.quality).to eq 50
    end

  describe "#update_item_sell_in" do

    it "lowers the Aged Brie's sell_in date by 1" do
      brie = Item.new("Aged Brie", 10, 5)
      updater = AgedBrieUpdater.new(brie) 

      updater.update_item_sell_in

      expect(aged_brie.sell_in).to eq 9
    end

  end

end