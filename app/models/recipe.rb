class Recipe < ApplicationRecord
belongs_to :user

validates :user, presence: true
validates :name, presence: true, uniqueness: { scope: :user_id } 
validates :description, presence: true

end
