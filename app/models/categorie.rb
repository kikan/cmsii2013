class Categorie < ActiveRecord::Base
  has_many :objets
  accepts_nested_attributes_for :objets, allow_destroy: true
end
