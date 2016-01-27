require 'spec_helper'

describe App do

  describe "when you load the data" do
    it "should get data" do

      data = JSON.load(SpecHelper.data)
      app = Apprank::App.new(data['feed']['entry'][0])

      expected = {
        name:         "Color Switch",
        icon_urls:    {
          small:  "http://is3.mzstatic.com/image/thumb/Purple69/v4/d4/70/15/d4701594-2c52-185f-766f-45fd4eab0f75/mzl.ytgnpnrv.png/53x53bb-85.png",
          medium: "http://is5.mzstatic.com/image/thumb/Purple69/v4/d4/70/15/d4701594-2c52-185f-766f-45fd4eab0f75/mzl.ytgnpnrv.png/75x75bb-85.png",
          large:  "http://is4.mzstatic.com/image/thumb/Purple69/v4/d4/70/15/d4701594-2c52-185f-766f-45fd4eab0f75/mzl.ytgnpnrv.png/100x100bb-85.png",
        },
        summary:      "Tap the ball carefully through each obstacle and your ball will switch color with some powerups.\nYou must follow the color pattern on each obstacle to cross it ! \n\nBe careful not to pass through the wrong color, or you’ll have to start again.",
        price:        {
          amount:   0.0,
          currency: "USD"
        },
        content_type: "Application",
        rights:       "© 2016 Fortafy Games",
        title:        "Color Switch - Samuel Ratumaitavuki",
        link:         "https://itunes.apple.com/us/app/color-switch/id1053533457?mt=8&uo=2",
        itunes_url:   "https://itunes.apple.com/us/app/color-switch/id1053533457?mt=8&uo=2",
        itunes_id:    "1053533457",
        bundle_id:    "com.fortafygames.colorswitch",
        artist:    {
          name: "Samuel Ratumaitavuki",
          url:  "https://itunes.apple.com/us/developer/samuel-ratumaitavuki/id1053533456?mt=8&uo=2"
        },
        category: {
          name: "Games",
          url:  "https://itunes.apple.com/us/genre/ios-games/id6014?mt=8&uo=2"
        },
      }

      expect(app.name).to         eq(expected[:name])
      expect(app.icon_urls).to    eq(expected[:icon_urls])
      expect(app.summary).to      eq(expected[:summary])
      expect(app.price).to        eq(expected[:price])
      expect(app.content_type).to eq(expected[:content_type])
      expect(app.rights).to       eq(expected[:rights])
      expect(app.title).to        eq(expected[:title])
      expect(app.link).to         eq(expected[:link])
      expect(app.itunes_url).to   eq(expected[:itunes_url])
      expect(app.itunes_id).to    eq(expected[:itunes_id])
      expect(app.bundle_id).to    eq(expected[:bundle_id])
      expect(app.artist).to       eq(expected[:artist])
      expect(app.category).to     eq(expected[:category])
      expect(app.release_date).to be_a(Time)

      expect(app.itunes_id).to    eq("1053533457")
      expect(app.category_id).to  eq("6014")


    end
  end

end
