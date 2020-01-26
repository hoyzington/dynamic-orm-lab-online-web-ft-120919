require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord
  
  def self.table_name
    self.to_s.downcase.pluralize
  end
  
  def self.column_names
    sql = "PRAGMA table_info('#{table_name}')"
    info = DB[:conn].execute(sql)
    columns = []
    info.each {|col| columns << col["name"]}
    columns.compact
  end
  
  def initialize(attrs={})
    attrs.each {|a, value| self.send("#{a}=", value)}
  end
  
end