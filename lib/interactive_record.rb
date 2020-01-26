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
  
  def table_name_for_insert
    self.class.table_name
  end

  def col_names_for_insert
    self.class.column_names.delete_if {|col| col.name == 'id'}
  end

  def values_for_insert
    
  end

  def save
    
  end

  def self.find_by_name
    
  end

  def self.find_by
    
  end


end
