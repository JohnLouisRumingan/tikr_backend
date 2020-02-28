class Company < ApplicationRecord

    has_many :shares
    has_many :users, through: :shares
    has_many :prices
end
