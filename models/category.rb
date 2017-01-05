require( 'pg' )
require_relative('../db/sql_runner.rb')
require_relative('./item.rb')

class Category

  attr_reader :name, :id

  def initialize( params )
    @id = params['id']
    @name = params['name']
  end

  def save()
    sql = "INSERT INTO Categories (name) VALUES ('#{@name}')"
    SqlRunner.run_sql(sql)
    return last_entry
  end

  def last_entry
    sql = "SELECT * FROM Categories ORDER BY id DESC limit 1"
    return Category.map_item(sql)
  end 

  def self.update(params)
    sql = "UPDATE Categories SET name='#{params['name']}' WHERE id = #{params['id']}"
    SqlRunner.run_sql(sql)
  end

  def self.all
    sql = "SELECT * FROM Categories"
    return Category.map_items(sql)
  end


  def self.find(id)
    sql = "SELECT * FROM Categories WHERE id=#{id}"
    result = Category.map_item(sql)
    return result
  end

  def self.delete
    sql = "DELETE FROM Categories WHERE id = '#{id}'"
    SqlRunner.run_sql(sql)
  end

  def self.delete_all
    sql = "DELETE FROM Categories"
    SqlRunner.run_sql(sql)
  end

  def self.map_items(sql)
    category = SqlRunner.run_sql(sql)
    result = category.map { |a| Category.new(a)}
    return result
  end

  def self.map_item(sql)
    result = Category.map_items(sql)
    return result.first
  end

end