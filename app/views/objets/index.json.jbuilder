json.array!(@objets) do |objet|
  json.extract! objet, :libelle, :valeur
  json.url objet_url(objet, format: :json)
end
