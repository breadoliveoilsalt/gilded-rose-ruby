require_relative '../lib/gilded_rose.rb'

describe GildedRose do

  describe "#update_quality" do

    context "for any item" do

      it "does not change the name" do
        item = Item.new("foo", 0, 0)
        items = [item]
        
        GildedRose.new(items).update_quality()

        expect(item.name).to eq "foo"
      end
     
    end

  end

end