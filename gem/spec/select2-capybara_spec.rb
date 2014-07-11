require 'select2-capybara'
require 'rspec'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'app/my_app'

  


RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Capybara::Select2

end

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {inspector: true, js_errors: false})

end

Capybara.configure do |config|
  config.app = MyApp.new
  config.javascript_driver = :poltergeist
  # config.run_server = false
  config.server_port = 9292


  # config.app_host = 'point to my localhost port 3000'
end


class Test
  include Capybara::Select2
end

describe 'Bla' do
  context 'Minimum input box' do
    it 'can select a value', js: true  do
      visit '/'
      
      select2("Wyoming", from: "box1")
      puts page.body
      expect(page).to have_content 'Wyoming'
    end
  end

end