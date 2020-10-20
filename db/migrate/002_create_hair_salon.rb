class CreateHairSalon < ActiveRecord::Migration[6.0]
    def change
        create_table :hair_salons do |t|
            t.string :name
            t.integer :rating
            t.string :location
            t.string :services
            t.integer :price
            t.string :website
            t.string :zip_code
    end
end