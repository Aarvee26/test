class CreateStudentsDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :students_details do |t|
      t.string :name
      t.string :age
      t.string :gender

      t.timestamps
    end
  end
end
