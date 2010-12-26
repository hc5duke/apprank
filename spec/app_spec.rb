require 'spec_helper'

describe App do

  describe "when you load the data" do
    it "should get data" do

      app, expected, data = create_fake_app

      app.name.should          == expected[:name]
      app.icon_urls.should     == expected[:icon_urls]
      app.summary.should       == expected[:summary]
      app.price.should         == expected[:price]
      app.rights.should        == expected[:rights]
      app.display_name.should  == expected[:title]
      app.link.should          == expected[:link]
      app.preview.should       == expected[:preview]
      app.itunes_url.should    == expected[:itunes_url]
      app.developer.should     == expected[:developer]
      app.category.should      == expected[:category]

      date_diff = app.release_date - expected[:release_date]
      date_diff.should <= 1

    end
  end

end
