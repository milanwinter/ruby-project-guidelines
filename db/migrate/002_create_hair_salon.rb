class CreateHairSalon < ActiveRecord::Migration[5.0]
    def change
        create_table :hair_salons do |t|
            t.string :name
            t.float :rating
            t.string :location
            t.string :price
            t.string :website
            t.string :phone_number
            t.integer :number_of_reviews
            t.integer :review_id
        end
    end
end 