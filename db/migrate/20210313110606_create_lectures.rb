class CreateLectures < ActiveRecord::Migration[6.0]
  def change
    create_table :lectures do |t|
      t.string :name
      t.text :description
      t.string :teachers
      t.string :location
      t.integer :max_students
      t.datetime :start_date
      t.integer :duration
      t.string :status

      t.timestamps
    end
  end
end
