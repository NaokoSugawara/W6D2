require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # db = SQLite3::Database.new('cats.db')
    table_name = self.class.table_name

    columns = DBConnection.execute(<<-SQL)
    SELECT *
    FROM #{table_name}
    SQL

    @colmuns = columns.map(&:to_sym)
  end

  def self.finalize!
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name = self.name.downcase + "s"
  end

  def self.all
    table_name = self.class.table_name

    DBConnection.execute(<<-SQL)
    SELECT #{table_name}.*
    FROM #{table_name}
    SQL

    @colmuns = columns.map(&:to_sym)
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
  end

  def attributes
    # ...
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
