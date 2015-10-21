require 'sqlite3'
# ------------------------------
# make some classes that talk to the db
# ------------------------------

module DB
  extend self

  def conn
    file = 'contact.db'
    SQLite3::Database.new(file)
  end

  def x(query)
    conn.execute(query)
  end
end


class Model

  def self.table
    "#{self.name.downcase}s"
  end

  def initialize(args = {})
    @data = args
    @saved = false
  end

  def save
    query = "insert into #{self.class.table} (#{@data.keys.join(',')}) "
    query += "values ('#{@data.values.join('\',\'')}')"
    p query
    DB.x query unless @saved
    @saved = true
  end

  def self.all
    query = "select * from #{table}"
    DB.x query
  end
end

class Group < Model

end

class Contact < Model

end


# --------------------------------
# driver code here
# --------------------------------


alex = Contact.new(first_name: 'Alex', last_name: 'White', email: 'alex@gmail.com')

alex.save

p Contact.all

# add a new group

people = Group.new(name: 'people')
40.times { people.save }  # this line shouldn't re-insert anything, just do it once.

# show list of groups

p Group.all

