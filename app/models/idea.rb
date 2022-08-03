class Idea < ApplicationRecord
    belongs_to :user
    has_many :reviews, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :likers, through: :likes, source: :user
end
