class Invoice < ApplicationRecord
    belongs_to :user
    has_many :items, dependent: :destroy
    validates :invoice_number, :client, presence: true
    accepts_nested_attributes_for :items

    def self.calculate_total(items)
        total = 0
        items.each do |index, item| 
            total += item[:price].to_f
        end
        return total
    end
end
 