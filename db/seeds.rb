require_relative( '../models/category.rb' )
require_relative( '../models/item.rb' )
require( 'pry-byebug' )

Item.delete_all
Category.delete_all


#category for shopping type
category1 = Category.new({ 'name' => 'Fruit & Veg'})
category2 = Category.new({ 'name' => 'Chilled'})
category3 = Category.new({ 'name' => 'Cupboard Supplies'})
category4 = Category.new({ 'name' => 'Drinks'})
category5 = Category.new({ 'name' => 'Bakery'})
category6 = Category.new({ 'name' => 'Frozen'})
category7 = Category.new({ 'name' => 'Cleaning'})
category8 = Category.new({ 'name' => 'Misc'})


cat1 = category1.save
cat2 = category2.save
cat3 = category3.save
cat4 = category4.save
cat5 = category5.save
cat6 = category6.save
cat7 = category7.save
cat8 = category8.save

item1 = Item.new({ 'item_name' => 'spinach', 'ideal_stock' => 2, 'current_stock' => 3, 'category_id' => cat1.id})  
item2 = Item.new({ 'item_name' => 'mushrooms', 'ideal_stock' => 1, 'current_stock' => 1, 'category_id' => cat1.id})  

item1.save
item2.save

item3 = Item.new({ 'item_name' => 'cheese (grated)', 'ideal_stock' => 1, 'current_stock' => 2, 'category_id' => cat2.id})  
item4 = Item.new({ 'item_name' => 'milk', 'ideal_stock' => 1, 'current_stock' => 1, 'category_id' => cat2.id}) 
item5 = Item.new({ 'item_name' => 'butter', 'ideal_stock' => 1, 'current_stock' => 1, 'category_id' => cat2.id}) 

item3.save
item4.save
item5.save

item6 = Item.new({ 'item_name' => 'chopped tomatoes', 'ideal_stock' => 4, 'current_stock' => 2, 'category_id' => cat3.id}) 

item6.save
nil