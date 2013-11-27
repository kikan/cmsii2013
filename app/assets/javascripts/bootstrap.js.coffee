on_revient_du_serveur = (data) ->
  console.log "On a reçu ça du serveur : "
  console.log data

on_ajoute_au_panier = (event) ->
  console.log "On a cliqué sur le bouton"
  id = $(event.target).attr("id")
  
  url = '/panier/ajouter/:objet_id.json'.replace(/:objet_id/, id)
  console.log "On appelle : "+url
  
  # Appel Ajax !
  $.get url, (data) ->
    console.log "On a reçu ça du serveur : "
    console.log data
    $('#contenu_du_panier').text data

  # Autre façon d'appeler
  #$.get url, on_revient_du_serveur
  
$ ->
  # Gérer les clics sur l'ajout au panier
  $("button.ajouter_au_panier").bind "click", on_ajoute_au_panier

  # Boutons verts pour les nouveaux
  $("a[href*='/new']").addClass "btn btn-success"
  $("a[class='add_nested_fields']").addClass "btn btn-success"

  # Boutons oranges pour modifier
  $("input[type=submit][value*='Update']").addClass "btn btn-warning"

  # Boutons rouges pour créer
  $("input[type=submit][value*='Create']").addClass "btn btn-danger"

  # Boutons rouges pour supprimer
  $("a[class='remove_nested_fields']").addClass "btn btn-danger"
    
  $("form").on "nested:fieldAdded", ->
    $("a[class='remove_nested_fields']").addClass "btn btn-danger"
    
  
  
  
  
  
  
  
  
