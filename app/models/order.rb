class Order < ApplicationRecord
    validates :email, :order_id, :status, presence: true
end