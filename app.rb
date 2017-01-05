require( 'sinatra' )
require('pry-byebug')
require_relative('./controllers/categories_controller.rb')
require_relative('./controllers/items_controller.rb')
require_relative('./models/category.rb')
require_relative('./models/item.rb')

require 'sinatra/contrib/all' if development?


use Rack::Auth::Basic, "Restricted Area" do |username, password|
  username == 'admin' and password == 'pass123'
end


get '/' do
  @items = Item.required_items()
  @categories = Category.all()
  erb (:home)
end

get '/full_list' do
  @items = Item.all()
  @categories = Category.all()
  erb (:all_details)
end