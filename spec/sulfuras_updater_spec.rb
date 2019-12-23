require_relative '../lib/item.rb'
require_relative '../lib/sulfuras_updater.rb'

describe SulfurasUpdater do

  it "requires an item when initialized" do

    expect{SulfurasUpdater.new}.to raise_error(ArgumentError)

  end
  
  describe "#update_item_quality" do
  
    it "does not change the item's quality" do
      sulfuras = Item.new("Sulfuras, Hand of Ragnaros", 10, 80)
      updater = SulfurasUpdater.new(sulfuras)

      updater.update_item_quality
      
      expect(sulfuras.quality).to eq 80
    end

  end

  describe "#update_item_sell_in" do
  
    it "does not lower the item's sell_in date" do
      sulfuras = Item.new("Sulfuras, Hand of Ragnaros", 10, 80)
      items = [sulfuras]

      updater = SulfurasUpdater.new(sulfuras)
      updater.update_item_sell_in 

      expect(sulfuras.sell_in).to eq 10
    end

  end
end
