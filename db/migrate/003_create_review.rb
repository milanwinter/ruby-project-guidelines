class CreateReview < ActiveRecord::Migration[5.0]
    def change
        create_table :reviews do|t|
            t.datetime :date
            t.string :comment
            t.integer :number_of_stars
            t.string :name
            t.string :business_website
            t.integer :hair_salon_id
            t.integer :customer_id
        end
    end
end