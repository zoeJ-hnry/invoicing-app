class Invoice < ApplicationRecord
    belongs_to :user
    has_many :items, dependent: :destroy
    validates :invoice_number, :client, presence: true
    accepts_nested_attributes_for :items

    # Define model methods here and call in the controller 
end
