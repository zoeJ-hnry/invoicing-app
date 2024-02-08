class Item < ApplicationRecord
    belongs_to :invoice
    validates :description, :price, presence: true
end
