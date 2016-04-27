class CreateTaskLists < ActiveRecord::Migration
  def change
    create_table :task_lists do |t|
      t.string :title
      t.text :description
    end
  end
end
