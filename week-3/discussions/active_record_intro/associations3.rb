# models

class Teacher < ActiveRecord::Base
  has_and_belongs_to_many :students
end

class Student < ActiveRecord::Base
  has_and_belongs_to_many :teachers
end










# migrations

class CreateClasses < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.timestamps
    end
 
    create_table :teachers do |t|
      t.string :name
      t.timestamps
    end
 
    create_table :student_teachers do |t|
      t.belongs_to :student
      t.belongs_to :teacher
      t.timestamps
    end
  end
end