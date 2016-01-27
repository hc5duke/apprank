require 'spec_helper'

describe Rank do

  describe "when you load the data" do
    it "should get data" do

      data = SpecHelper.data
      rank = Rank.new(data)

      expect(rank.apps.length).to  eq(25)
      expect(rank.link).to         eq("https://itunes.apple.com/us/rss/topfreeapplications/limit=25/json")
      expect(rank.updated.to_i).to eq(1453708166)

    end
  end

end
