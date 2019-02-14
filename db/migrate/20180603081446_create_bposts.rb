class CreateBposts < ActiveRecord::Migration
  def change
    create_table :bposts do |t|
      t.integer :rank
      t.string :title
      t.string :artist

      t.timestamps null: false
    end
  end
end
