$ ->
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
