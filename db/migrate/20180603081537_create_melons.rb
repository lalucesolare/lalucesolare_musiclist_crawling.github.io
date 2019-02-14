class CreateMelons < ActiveRecord::Migration
  def change
    create_table :melons do |t|
      t.integer :rank
      t.string :title
      t.string :artist

      t.timestamps null: false
    end
  end
end
