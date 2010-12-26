require 'lib/apprank'
require 'faker'

include Apprank

def create_fake_app
  itunes_id = rand(100000).to_s
  expected = {
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
    :itunes_id => itunes_id,
    :itunes_url => Faker::Internet.domain_name + '/id' + itunes_id + '?foo=bar',
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

  data = {
    "im:name" => { "label" => expected[:name] },
    "im:image" => [
      {
        "label" => expected[:icon_urls][:small],
        "attributes" => { "height" => "53" }
      },
      {
        "label" => expected[:icon_urls][:medium],
        "attributes" => { "height" => "75" }
      },
      {
        "label" => expected[:icon_urls][:large],
        "attributes" => { "height" => "100" }
      }
    ],
    "summary" => { "label" => expected[:summary] },
    "im:price" => {
      "label" => "Free",
      "attributes" => {
        "amount" => expected[:price][:amount],
        "currency" => expected[:price][:currency]
      }
    },
    "im:contentType" => {
      "attributes" => {
        "term" => "Application",
        "label" => "Application"
      }
    },
    "rights" => { "label" => expected[:rights] },
    "title" => { "label" => expected[:title] },
    "link" => [
      {
        "attributes" => {
          "rel" => "alternate",
          "type" => "text/html",
          "href" => expected[:link]
        }
      },
      {
        "im:duration" => { "label" => "0" },
        "attributes" => {
          "title" => "Preview",
          "rel" => "enclosure",
          "type" => "image/jpeg",
          "href" => expected[:preview],
          "im:assetType" => "preview"
        }
      }
    ],
    "id" => { "label" => expected[:itunes_url] },
    "im:artist" => {
      "label" => expected[:developer][:name],
      "attributes" => { "href" => expected[:developer][:url] }
    },
    "category" => {
      "attributes" => {
        "term" => expected[:category][:name],
        "scheme" => expected[:category][:url],
        "label" => expected[:category][:name]
      }
    },
    "im:releaseDate" => {
        "label" => expected[:release_date].strftime("%Y-%m-%dT%H:%M:%S%z"),
        "attributes" => { "label" => "November 04, 2010" }
    }
  }

  [App.new(data), expected, data]
end

def create_fake_feed(length=100)
  {
    "feed" => {
      "author" => {
        "name" => { "label" => Faker::Company.name },
        "uri" => { "label" => Faker::Internet.domain_name }
      },
      "entry" => length.times.map{ create_fake_app[2] },
      "updated" => { "label" => Time.now },
      "rights" => { "label" => Faker::Company.catch_phrase },
      "title" => { "label" => Faker::Company.bs },
      "icon" => { "label" => Faker::Internet.domain_name },
      "link" => [
        {
          "attributes" => {
            "rel" => "alternate",
            "type" => "text/html",
            "href" => Faker::Internet.domain_name
          }
        },
        {
          "attributes" => {
            "rel" => "self",
            "href" => Faker::Internet.domain_name + "?cc=us"
          }
        }
      ],
      "id" => { "label" => Faker::Internet.domain_name + "?cc=us" }
    }
  }.to_json
end
