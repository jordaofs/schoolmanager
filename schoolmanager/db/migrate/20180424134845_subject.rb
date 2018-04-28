class Subject < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
