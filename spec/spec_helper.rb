ENV['RACK_ENV'] = 'test'

require("bundler/setup")
Bundler.require(:default, :test)
set(:root, Dir.pwd())

require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('./app')

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.after(:each) do
    Addict.all.each do |a|
      a.destroy
    end
    Ingredient.all.each do |i|
      i.destroy
    end
    Relapse.all.each do |r|
      r.destroy
    end
  end
end
