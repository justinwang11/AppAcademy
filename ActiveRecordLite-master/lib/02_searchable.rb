require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    where_line = params.keys.map do |key|
      "#{key} = ? "
    end
    joined_where_line = where_line.join("AND ")
    result = DBConnection.execute(<<-SQL, params.values)
    SELECT
      *
    FROM
      #{self.table_name}
    WHERE
      #{joined_where_line}
    SQL

    self.parse_all(result)
  end
end

class SQLObject
  extend Searchable
end
