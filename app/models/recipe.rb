class Recipe < ApplicationRecord
    has_many :recipe_ingredients 
    has_many :ingredients, through: :recipe_ingredients
    validates :name, :presence => true
    accepts_nested_attributes_for :ingredients, reject_if: :all_blank
    
    def self.search(key_word)
        self.where "name LIKE ?", "%#{key_word}%"
    end
end
