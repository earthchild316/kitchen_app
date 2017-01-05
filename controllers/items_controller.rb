require_relative('../models/item.rb')
require_relative('../models/category.rb')


#index
get '/items' do
  @items = Item.all()
  @categories = Category.all()
  erb :"items/index"
end

get '/items/cat/:category_id' do
  @items = Item.selected_categories(params[:category_id])
  erb :"items/subindex"
end

#new
get '/items/new' do
  @categories = Category.all
  erb :"items/new"
end

#show
get '/items/:id' do
  @items = Item.find(params[:id])
  erb :"items/show"
end

#edit
get '/items/:id/edit' do
  @item = Item.find(params[:id])
  @categories = Category.all
  erb :"items/edit"
end

#update
post '/items/:id' do
  Item.update(params)
  redirect to( "/items")
end

#create
post '/items' do
  @items = Item.new(params)
  @items.save()
  redirect to("/items")
end

#destroy
post '/items/:id/delete' do
  Item.delete(params[:id])
  redirect to("/items")
end

