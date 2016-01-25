module Apprank
  class App

    attr_accessor :name, :icon_urls, :summary, :price, :content_type, :rights, :title,
      :link, :itunes_url, :itunes_id, :bundle_id, :artist, :artist, :category, :release_date

    alias_method :developer, :artist

    def initialize(hash)
      @name = hash["im:name"]["label"]
      @icon_urls = {}
      hash["im:image"].each do |image|
        height =
          if image["attributes"]["height"] == '53'
            :small
          elsif image["attributes"]["height"] == '75'
            :medium
          else
            :large
          end
        @icon_urls[height] = image["label"]
      end
      @summary = hash["summary"]["label"]
      @price = {
        :amount => hash["im:price"]["attributes"]["amount"].to_f,
        :currency => hash["im:price"]["attributes"]["currency"]
      }
      @content_type = hash["rights"]["contentType"]
      @rights = hash["rights"]["label"]
      @title = hash["title"]["label"]

      link = hash["link"]
      if link["attributes"]["title"] == "Preview"
        @preview = link["attributes"]["href"]
      else
        @link = link["attributes"]["href"]
      end

      @itunes_url = hash["id"]["label"]
      @itunes_id = hash["id"]['attributes']['im:id']
      @bundle_id = hash["id"]['attributes']['im:bundleId']

      @artist = {
        :name => hash["im:artist"]["label"],
        :url => hash["im:artist"]["attributes"]["href"]
      }
      @category = {
        :name => hash["category"]["attributes"]["term"],
        :url => hash["category"]["attributes"]["scheme"]
      }
      @release_date = Time.parse(hash["im:releaseDate"]["label"])
    end

    def itunes_id
      self.itunes_url.split(/\//).last.split(/\?/).first.gsub(/[^\d]/,'')
    end

    def is_free?
      self.price[:amount].zero?
    end

  end
end
