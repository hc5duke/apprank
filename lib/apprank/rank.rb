require 'apprank/app'

module Apprank
  class Rank

    attr_accessor :apps, :link, :updated

    def initialize(text)
      begin
        data = JSON.load(text)
        apps_data = data["feed"]["entry"]
        @link = data["feed"]["id"]["href"]
        @apps = apps_data.map do |app|
            Apprank::App.new(app)
          end
        @updated = Time.parse(data["feed"]["updated"]["label"])
      rescue
        raise BadJsonData
      end
    end

    def country
      self.link[/cc=(\w*)/][3..-1]
    end

  end
end
