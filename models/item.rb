require( 'pg' )
require_relative('../db/sql_runner.rb')
require_relative('./category.rb')

class Item

  attr_reader :id, :item_name, :ideal_stock, :current_stock, :category_id

  def initialize( params )
    @id = params['id']
    @item_name = params['item_name']
    @ideal_stock = params['ideal_stock'].to_i
    @current_stock = params['current_stock'].to_i
    @category_id = params['category_id']
  end


  def save()
    sql = "INSERT INTO Items (item_name, ideal_stock, current_stock, category_id) VALUES ('#{@item_name}', '#{@ideal_stock}', #{@current_stock}, #{@category_id})"
    SqlRunner.run_sql(sql)
    return last_entry
  end

  def check_stock_level
    total = @ideal_stock - @current_stock
    return total
  end

  def webpage_output(stock_level)
    if stock_level > 0
      return "Low Stock"
    else
      return "Stocks are good!"
    end
  end


  def self.sort_all_items
    items = self.all
    items.sort { |a, b| [a.webpage_output(a.check_stock_level), b.category_id, a.item_name] <=> [b.webpage_output(b.check_stock_level), a.category_id, b.item_name] }
  end

  def self.sort_filtered_items
    items = self.required_items
    items.sort { |a, b| [a.webpage_output(a.check_stock_level), b.category_id, a.item_name] <=> [b.webpage_output(b.check_stock_level), a.category_id, b.item_name] } 
  end

  def last_entry()
    sql = "SELECT * FROM Items ORDER BY id DESC limit 1"
    return Item.map_item(sql)
  end

  def self.selected_categories(cat)
    sql = "SELECT * from Items WHERE category_id=#{cat}"
    result = Item.map_items(sql)
    return result

  end

  def self.required_items
    sql = "SELECT * from Items WHERE ideal_stock - current_stock > 0"   
    result = Item.map_items(sql)
    return result 
  end

  def self.update(params)
    sql = "UPDATE Items SET item_name = '#{params['item_name']}', ideal_stock = #{params['ideal_stock']}, current_stock = #{params['current_stock']}, category_id = #{params['category_id']} WHERE id = #{params['id']}"
    SqlRunner.run_sql(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM Items WHERE id = #{id}"
    result = Item.map_item(sql)
    return result
  end

  def self.delete(id)
    sql = "DELETE FROM Items WHERE id = #{id}"
    SqlRunner.run_sql(sql)
  end

  def self.delete_all
    sql = "DELETE FROM Items"
    SqlRunner.run_sql(sql)
  end

  def self.all()
    sql = "SELECT * FROM Items"
    return Item.map_items(sql)
  end

  def self.map_item(sql)
    result = Item.map_items(sql)
    return result.first    
  end

  def self.map_items(sql)
    item = SqlRunner.run_sql(sql)
    result = item.map { |im| Item.new(im)}
    return result     
  end

end