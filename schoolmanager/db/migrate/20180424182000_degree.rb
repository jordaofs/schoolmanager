class Degree < ActiveRecord::Migration[5.1]
  def change
    create_table :degrees do |t|
      t.string :name, null: false

      t.timestamps
    end

    create_table :degrees_subjects, id: false do |t|
      t.belongs_to :degree, index: true
      t.belongs_to :subject, index: true
    end

    create_table :degrees_teachers, id: false do |t|
      t.belongs_to :degree, index: true
      t.belongs_to :teacher, index: true
    end

    # create_table :subjects_teachers, id: false do |t|
    #   t.belongs_to :subject, index: true
    #   t.belongs_to :teacher, index: true
    #   t.references :degree, index: true
    # end

  end
end
