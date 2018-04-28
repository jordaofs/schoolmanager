class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.integer :age, null: false
      t.string :cpf, null: false
      t.references :degree, index: true

      t.timestamps
    end
  end
end
