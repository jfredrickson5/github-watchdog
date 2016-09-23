require "sinatra/base"
require "json"

class WatchdogApp < Sinatra::Base
  configure :development do
  end

  configure :production do
  end

  configure do
    $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/../lib")
    Dir.glob("#{File.dirname(__FILE__)}/../lib/*.rb") { |lib| require File.basename(lib, '.*') }

    GitHub.token = ENV["GITHUB_TOKEN"]
  end
end
