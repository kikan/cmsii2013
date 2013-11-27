class PanierController < ApplicationController
  
  def ajouter
    id_de_l_objet = params[:objet_id]
    
    objet = Objet.find(id_de_l_objet)
    
#    render json: ["on ajouté un objet #{objet.libelle} dans le panier"]
    render json: objet
  end
end
