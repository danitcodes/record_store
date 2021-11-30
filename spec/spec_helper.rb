require 'rspec'
require 'pry'
require 'pg'
require 'album'
require 'song'
require 'artist'

DB = PG.connect({:dbname => 'record_store_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM albums *;")
    DB.exec("DELETE FROM songs *;")
  end
end
