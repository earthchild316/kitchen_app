require_relative('../models/category.rb')
require_relative('../models/item.rb')


#index
get '/categories' do
  @categories = Category.all()
  erb :"categories/index"
end

#new
get '/categories/new' do
  erb :'categories/new'
end

#show
get '/categories/:id' do
  @categories = Category.find(params[:id])
  erb :"categories/show"
end

#edit
get '/categories/:id/edit' do
  @category = Category.find(params[:id])
  erb :"categories/edit"
end

#create
post '/categories' do
  @categories = Category.new(params)
  @categories.save()
  redirect to("/categories")
end

#update
post '/categories/:id' do
  Category.update(params)
  redirect to( "/categories")
end

#destroy
post '/categories/:id/delete' do
  Category.delete(params[:id])
  redirect to("/categories")
end