class CreateCustomer < ActiveRecord::Migration[5.0]
    def change
        create_table :customers do |t|
            t.string :name
            t.integer :review_id
        end
    end
end