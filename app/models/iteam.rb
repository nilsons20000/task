class Iteam < ApplicationRecord
    has_many :taskers
    validates :title, presence: true,
    length: { minimum: 5 }
end
