# models

class Teacher < ActiveRecord::Base
  has_many :classes
end

class Student < ActiveRecord::Base
  has_many :classes
end

class Class < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :students
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
 
    create_table :classes do |t|
      t.belongs_to :student
      # t.integer :student_id
      # t.references :students

      t.belongs_to :teacher
      # t.integer :teacher_id
      # t.references :teachers

      t.timestamps
    end
  end
end