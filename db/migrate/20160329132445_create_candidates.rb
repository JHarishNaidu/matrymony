class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :nick_name
      t.date :date_of_birth
      t.integer :age
      t.string :sex
      t.integer :family_members_count
      t.string :father
      t.string :mother
      t.string :brother
      t.string :sister

      t.timestamps null: false
    end
  end
end
