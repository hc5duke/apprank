require 'spec_helper'

describe Rank do

  describe "when you load the data" do
    it "should get data" do

      feed = create_fake_feed(100)
      rank = Rank.new({ :feed => feed }.to_json)
      rank.apps.length.should == 100
      rank.link.should == feed[:id][:href]
      (rank.updated - Time.now).abs.should < 10

    end
  end

end
