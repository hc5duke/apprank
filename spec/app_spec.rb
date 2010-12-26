require 'spec_helper'
require 'faker'

describe App do

  before :each do
    @expected = {
      :name => Faker::Company.bs,
      :icon_urls => {
        :small  => Faker::Internet.domain_name,
        :medium => Faker::Internet.domain_name,
        :large  => Faker::Internet.domain_name
      },
      :summary => Faker::Company.catch_phrase,
      :price => {
        :amount => rand(1000),
        :currency => Faker::Address.us_state_abbr,
      },
      :rights => Faker::Company.name,
      :title => Faker::Company.bs + Faker::Company.name,
      :link => Faker::Internet.domain_name,
      :preview => Faker::Internet.domain_name,
      :itunes_url => Faker::Internet.domain_name,
      :developer => {
        :name => Faker::Company.name,
        :url => Faker::Internet.domain_name
      },
      :category => {
        :name => Faker::Name.last_name,
        :url => Faker::Internet.domain_name
      },
      :release_date => Time.now
    }

    @data = {
      "im:name" => { "label" => @expected[:name] },
      "im:image" => [
        {
          "label" => @expected[:icon_urls][:small],
          "attributes" => { "height" => "53" }
        },
        {
          "label" => @expected[:icon_urls][:medium],
          "attributes" => { "height" => "75" }
        },
        {
          "label" => @expected[:icon_urls][:large],
          "attributes" => { "height" => "100" }
        }
      ],
      "summary" => { "label" => @expected[:summary] },
      "im:price" => {
        "label" => "Free",
        "attributes" => {
          "amount" => @expected[:price][:amount],
          "currency" => @expected[:price][:currency]
        }
      },
      "im:contentType" => {
        "attributes" => {
          "term" => "Application",
          "label" => "Application"
        }
      },
      "rights" => { "label" => @expected[:rights] },
      "title" => { "label" => @expected[:title] },
      "link" => [
        {
          "attributes" => {
            "rel" => "alternate",
            "type" => "text/html",
            "href" => @expected[:link]
          }
        },
        {
          "im:duration" => { "label" => "0" },
          "attributes" => {
            "title" => "Preview",
            "rel" => "enclosure",
            "type" => "image/jpeg",
            "href" => @expected[:preview],
            "im:assetType" => "preview"
          }
        }
      ],
      "id" => { "label" => @expected[:itunes_url] },
      "im:artist" => {
        "label" => @expected[:developer][:name],
        "attributes" => { "href" => @expected[:developer][:url] }
      },
      "category" => {
        "attributes" => {
          "term" => @expected[:category][:name],
          "scheme" => @expected[:category][:url],
          "label" => @expected[:category][:name]
        }
      },
      "im:releaseDate" => {
          "label" => @expected[:release_date].strftime("%Y-%m-%dT%H:%M:%S%z"),
          "attributes" => { "label" => "November 04, 2010" }
      }
    }
  end

  describe "when you load the data" do
    it "should get data" do

      app = App.new(@data)

      app.name.should          == @expected[:name]
      app.icon_urls.should     == @expected[:icon_urls]
      app.summary.should       == @expected[:summary]
      app.price.should         == @expected[:price]
      app.rights.should        == @expected[:rights]
      app.display_name.should  == @expected[:title]
      app.link.should          == @expected[:link]
      app.preview.should       == @expected[:preview]
      app.itunes_url.should    == @expected[:itunes_url]
      app.developer.should     == @expected[:developer]
      app.category.should      == @expected[:category]

      date_diff = app.release_date - @expected[:release_date]
      date_diff.should <= 1

    end
  end

end
