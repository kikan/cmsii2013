class Objet < ActiveRecord::Base
  belongs_to :categorie
  validates_presence_of :categorie, :on => :create, :message => "doit être renseignée"
end
