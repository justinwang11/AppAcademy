require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'

# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    cols = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL
    cols.first.map do |col|
      col.to_sym
    end
  end

  def self.finalize!
    columns.each do |column|
      define_method("#{column}=") do |value|
        attributes[column] = value
      end
      define_method(column) do
        attributes[column]
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.name.tableize
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
    SELECT
      #{self.table_name}.*
    FROM
      #{self.table_name}
    SQL
    parse_all(results)
  end

  def self.parse_all(results)
    results.map do |hash|
      self.new(hash)
    end
  end

  def self.find(id)
    result = DBConnection.execute(<<-SQL, id)
    SELECT
      #{table_name}.*
    FROM
      #{table_name}
    WHERE
      #{table_name}.id = ?
    SQL
    parse_all(result).first
  end

  def initialize(params = {})
    params.each do |param|
      attr_name = param[0].to_sym
      value = param.last
      if self.class.columns.include?(attr_name)
        send("#{attr_name}=", value)
      else
        raise "unknown attribute '#{attr_name}'"
      end
    end

  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    result = self.class.columns.map do |column|
      send(column)
    end
    result
  end

  def insert
    col_names = self.class.columns.join(',')
    question_marks = (['?'] * self.class.columns.length).join(',')
    DBConnection.execute(<<-SQL, attribute_values)
    INSERT INTO
      #{self.class.table_name} (#{col_names})
    VALUES
      (#{question_marks})
    SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    col_names = self.class.columns.map do |column|
      "#{column} = ?"
    end
    DBConnection.execute(<<-SQL, attribute_values, self.id)
    UPDATE
      #{self.class.table_name}
    SET
      #{col_names.join(',')}
    WHERE
      id = ?
    SQL
  end

  def save
    if self.id.nil?
      self.insert
    else
      self.update
    end
  end
end
