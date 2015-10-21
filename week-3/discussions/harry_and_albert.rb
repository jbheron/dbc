require 'csv'
require 'sqlite3'

file = 'contact.db'
$db = SQLite3::Database.new(file)

# --------------------------------------------
# setup tables
# --------------------------------------------

tables = {'contacts' => %w[first_name last_name company phone email],
          'groups' => %w[name],
          'membership' => %w[contact_id group_id]}

tables.each do |table, fields|
  table_drop_query = "drop table if exists #{table}"
  table_create_query = "create table if not exists #{table} (id integer primary key)"

  $db.execute(table_drop_query)
  $db.execute(table_create_query)

  fields.each do |column|
    column_query = "alter table #{table} add #{column}"
    $db.execute(column_query)
  end

end

# --------------------------------------------
# insert data
# --------------------------------------------

CSV.foreach('data.csv', :headers => true, :header_converters => :symbol) do |row|
  query = <<-SQL
    insert into contacts
    (first_name, last_name, company, phone, email)
    values
    ('#{row[:first_name]}', '#{row[:last_name]}', '#{row[:company]}', '#{row[:phone]}', '#{row[:email]}')
  SQL

  $db.execute(query)
  contact_id = $db.execute("select last_insert_rowid()").first.first

  groups = (1..3).to_a
                 .map{|i| "group#{i}"}
                 .map{|g| row[g.to_sym]}
                 .compact

  groups.each do |group|
    results = $db.execute("select * from groups where name = '#{group}'")

    if results.empty?
      $db.execute("insert into groups (name) values ('#{group}')")
      group_id = $db.execute("select last_insert_rowid()").first.first
      # puts "==> #{id}"
    else
      group_id = results.first.first
      # puts "--> #{id}"
    end

    # puts "your group id is %s and your id is %s" % [group_id, contact_id]

    $db.execute("insert into membership (contact_id, group_id) values (#{contact_id}, #{group_id})")
  end

end

# p $db.execute("select * from contacts")
# p $db.execute("select * from groups")
# p $db.execute("select * from membership")


p $db.execute(<<-SQL
    select c.first_name, c.last_name, g.name
    from contacts c, membership m, groups g
    where c.id = m.contact_id
      and g.id = m.group_id
  SQL
  )
