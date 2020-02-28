class User < ApplicationRecord

    has_many :shares
    has_many :companies, through: :shares
end
