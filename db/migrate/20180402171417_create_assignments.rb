class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.string :name
      t.integer :course_id
      t.date :date

      t.timestamps
    end
  end
end
