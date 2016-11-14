class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :house_number
      t.string :street_name
      t.string :city_name
      t.string :mandal_name
      t.string :district_name
      t.string :state_name
      t.string :country_name
      t.string :pin_code
      t.string :school_name
      t.string :college_name
      t.string :degree_name
      t.string :d_college_name
      t.string :pg_name
      t.string :pg_college_name
      t.string :higher_qualification
      t.text :brief_details

      t.timestamps null: false
    end
  end
end
