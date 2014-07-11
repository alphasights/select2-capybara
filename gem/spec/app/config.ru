require './my_app'

use Rack::Static,
  :urls => ["/js", "/css"]
  
run MyApp.new




# require 'rack'

# app = 

# use Rack::Static,
#   :urls => ["/js", "/css"]

# run lambda { |env|
#   [
#     200,
#     {
#       'Content-Type'  => 'text/html'
#     },
#     File.open('./minimum-input.html', File::RDONLY)
#   ]
# }