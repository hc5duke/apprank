require 'spec_helper'

describe Rank do

  describe "when you load the data" do
    it "should get data" do

      feed = create_fake_feed
      Rank.new(feed)

    end
  end

end
