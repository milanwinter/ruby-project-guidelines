class Review < ActiveRecord::Base

    belongs_to :customer
    belongs_to :hair_salons

end