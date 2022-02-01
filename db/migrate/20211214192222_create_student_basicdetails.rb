class CreateStudentBasicdetails < ActiveRecord::Migration[6.1]
  def change
    create_table :student_basicdetails do |t|

      t.timestamps
    end
  end
end
