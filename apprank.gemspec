Gem::Specification.new do |s|
  s.name = %q{apprank}
  s.version = "0.0.1"
  s.date = %q{2010-12-25}
  s.authors = ["hc5duke"]
  s.email = %q{hc5duke@gmail.com}
  s.summary = %q{Take app rank data from Apple and rubyfy it}
  s.homepage = %q{https://www.github.com/hc5duke/apprank}
  s.description = %q{Apprank parses iOS app rank data from Apple.}
  s.files = [ "Gemfile", "LICENSE", "README", "lib/apprank.rb", "lib/apprank/app.rb",
    "lib/apprank/rank.rb", "spec/app_spec.rb", "spec/rank_spec.rb", "spec/rcov.opts", "spec/spec.opts",
    "spec/spec_helper.rb" ]
end
