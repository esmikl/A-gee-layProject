class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :tag
      t.text :content

      t.timestamps null: false
    end
  end
end
