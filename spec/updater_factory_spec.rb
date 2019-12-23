require_relative '../lib/item.rb'
require_relative '../lib/updater_factory.rb'
require_relative '../lib/default_updater.rb'
require_relative '../lib/sulfuras_updater.rb'
require_relative '../lib/aged_brie_updater.rb'
require_relative '../lib/backstage_pass_updater.rb'
require_relative '../lib/conjured_item_updater.rb'

describe UpdaterFactory do

  describe "#get_updater" do 

    it "instantiates a SulfurasUpdater when passed a Sulfuras item" do
      sulfuras = Item.new("Sulfuras, Hand of Ragnaros", 10, 80)

      result = UpdaterFactory.get_updater(sulfuras)

      expect(result).to be_a(SulfurasUpdater)
    end

    it "instantiates a AgedBrieUpdater when passed an Aged Brie item" do
      brie = Item.new("Aged Brie", 10, 10)

      result = UpdaterFactory.get_updater(brie)

      expect(result).to be_a(AgedBrieUpdater)
    end

    it "instantiates a BackstagePassUpdater when passed a Backstage Pass item" do
      backstage_pass = Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)

      result = UpdaterFactory.get_updater(backstage_pass)

      expect(result).to be_a(BackstagePassUpdater)
    end

    it "instantiates a ConjuredItemUpdater when passed a Conjured Item" do
      conjured_item = Item.new("Conjured Item", 10, 10)

      result = UpdaterFactory.get_updater(conjured_item)

      expect(result).to be_a(ConjuredItemUpdater)
    end

    it "instantiates a DefaultUpdater when passed a non-specialized item" do
      item = Item.new("Ordinary Item", 10, 5)
        
      result = UpdaterFactory.get_updater(item)

      expect(result).to be_a(DefaultUpdater)
    end

  end

end