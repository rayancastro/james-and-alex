class AddMaxLeadsToLectures < ActiveRecord::Migration[6.0]
  def change
    remove_column :lectures, :max_students
    add_column :lectures, :max_leads, :integer
    add_column :lectures, :max_follows, :integer
  end
end
