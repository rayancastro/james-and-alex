class AddMaxLeadsToLectures < ActiveRecord::Migration[6.0]
  def change
    remove_column :lectures, :max_students
    add_column :lectures, :max_leads, :integer, default: 0
    add_column :lectures, :max_follows, :integer, default: 0
  end
end
