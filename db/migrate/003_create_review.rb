class CreateReview < ActiveRecord::Migration[5.0]
    def change
        create_table :reviews do |t|
            t.string :name
            t.datetime :date
            t.string :comment
            t.integer :number_of_stars
        end
    end
end