module Apprank
  class App

    attr_accessor :name, :icon_urls, :summary, :price, :content_type, :rights, :title,
      :link, :preview, :itunes_url, :itunes_id, :bundle_id, :artist, :artist, :category, :release_date

    alias_method :developer, :artist

    def initialize(hash)
      @name      = App.get_label(hash, "im:name")
      @icon_urls = App.get_icon_urls(hash["im:image"])
      @summary   = App.get_label(hash, "summary")

      @price = {
        amount:   App.get_attributes(hash, "im:price")["amount"].to_f,
        currency: App.get_attributes(hash, "im:price")["currency"],
      }
      @content_type = App.get_attributes(hash, "im:contentType")["term"]
      @rights = App.get_label(hash, "rights")
      @title  = App.get_label(hash, "title")
      @link   = App.get_attributes(hash, "link")["href"]

      @itunes_url = App.get_label(hash, "id")
      @itunes_id  = App.get_attributes(hash, "id")['im:id']
      @bundle_id  = App.get_attributes(hash, "id")['im:bundleId']

      @artist = {
        :name => App.get_label(hash, "im:artist"),
        :url => App.get_attributes(hash, "im:artist")["href"],
      }
      category = App.get_attributes(hash, "category")
      @category = {
        :name => category["term"],
        :url => category["scheme"],
      }
      @release_date = Time.parse(App.get_label(hash, "im:releaseDate"))
    end

    def itunes_id
      self.itunes_url.split(/\//).last.split(/\?/).first.gsub(/[^\d]/, '')
    end

    def category_id
      self.category[:url].split(/\//).last.split(/\?/).first.gsub(/[^\d]/, '')
    end

    def is_free?
      self.price[:amount].zero?
    end

    private

    def self.get_attributes(hash, field)
      hash[field]["attributes"]
    end

    def self.get_label(hash, field)
      hash[field]["label"]
    end

    def self.get_icon_urls(images)
      icon_urls = {}
      images.each do |image|
        height =
          if image["attributes"]["height"] == '53'
            :small
          elsif image["attributes"]["height"] == '75'
            :medium
          else
            :large
          end
        icon_urls[height] = image["label"]
      end
      icon_urls
    end

  end
end
