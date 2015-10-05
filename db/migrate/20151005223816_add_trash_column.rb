class AddTrashColumn < ActiveRecord::Migration
  def change
    add_column :notes, :trash, :boolean, :default => false
  end
end
