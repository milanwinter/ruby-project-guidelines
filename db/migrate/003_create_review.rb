class CreateReview < ActiveRecord::Migration[5.0]
    def change
        create_table :reviews do |t|
            t.datetime :date
            t.string :comment
            t.integer :number_of_stars
            t.integer :useful_votes
        end
    end
end