cmsii2013
=========

<img src="doc/diagramme_de_classes.jpg">

Projet étudié en cours en 2013.

Sur GitHub, vous pouvez comparer les versions des fichiers, pour voir ce qui a changé d'une séance à l'autre.

N'oubliez pas d'écrire vos inflexions si besoin avant de générer vos classes ! (dans config/initialiers/inflexions.rb)

Pour générer la classe Categorie
```
rails g scaffold categorie libelle fichier_image
```
Pour créer la classe Objet
```
rails g scaffold objet libelle valeur:float
```

Pour lancer un serveur sur le port 8080
```
rails s -p 8080
```

Pour ajouter la colonne categorie_id dans la table objets
```
rails g migration add_categorie_id_to_objets categorie_id:integer
```

Utilisation du collection_select
---
```ruby
  <%= f.collection_select :cle_etrangere_id, ClasseALister.all, :id, :champ_a_afficher_dans_le_select %>
```


Gestion des sous-formulaires (ou formulaires nichés)
---

1. Ajouter la GEM nested_form à votre fichier Gemfile
2. lancer la commande `rails g nested_form:install`

Les formulaires contenant des sous-formulaire doivent utiliser le helper `nested_form_for` au lieu de `form_for`.

Définissez que votre objet principal, celui qui en contient un autre, peut avoir des attributs nichés :

```ruby
  # app/models/objet_principal.rb
  class ObjetPrincipal < ActiveRecord::Base
    has_many: sous_objets
    accepts_nested_attributes_for :sous_objets, allow_destroy: true
  end
```

Utilisez ensuite `<%= f.fields_for :la_relation %>` dans la vue d'édition (`_form.html.erb`) et créez un partial `_la_relation_fields.html.erb` qui affichera de quoi modifier chaque objet de la relation.

Rendre l'application plus jolie
---
Nous utiliserons bootstrap twitter ([http://getbootstrap.com](http://getboostrap.com)) pour rendre l'application plus jolie.

Deux possibilités :

* référencer seulement la feuille de style de Bootstrap depuis notre application
* utiliser une GEM qui va ajouter la feuille de style et les fichiers Javascripts utiles.

La gem que nous allons utiliser est : [`anjlab-bootstrap-rails`](https://github.com/anjlab/bootstrap-rails). Suivez les instructions d'installation depuis la page de la Gem.

Modifiez votre page de présentation par défaut des vues (`app/views/layouts/application.html.erb`) en vous aidant de la [page suivante](http://getbootstrap.com/examples/sticky-footer-navbar/). N'oubliez pas qu'il peut y avoir des petits décalages et adaptations à faire dans le body.

Ajoutez des liens vers les objets et les catégories pour que votre application soit pratique.

Profitez-en pour indiquer que la page par défaut de votre application est la liste des objets (fichier `config/routes.rb`).


###Ajouter des couleurs aux liens et aux boutons.

Ajouter les classes `btn` et `btn-info`, `btn-success`... aux liens pour afficher de jolis boutons.

###Rendre tout ça un peu plus automatique grâce à jQuery et un peu de CoffeeScript.

En jQuery avec Javascript, une page chargée se traduit par l'appel de la méthode suivante :

```javascript
 $(function() {
    /* Le code a exécuter une fois la page chargée */
 }
```

Comme nous utiliserons [CoffeeScript](http://coffeescript.org/), nous allons adapter ce fonctionnement :

```coffeescript
 $ ->
   # Le code a exécuter une fois la page chargée
```

Trouvez tous les liens intéressants à rendre plus beaux (les liens pour appeler les pages /new, ou les boutons d'inputs dont le texte contient 'Update' ou 'Create', ainsi que les liens dont la classe est 'remove_nested_fields').

Ajouter la possibilité de mettre une photo pour un objet
---
Suivez [le guide](http://guides.rubyonrails.org/form_helpers.html#uploading-files) pour pemettre d'envoyer une photo lorsqu'on modifie une catégorie. Faites de-même pour un objet.

Quand ça marche, utiliser [dropzone.js](http://www.dropzonejs.com/) pour pouvoir glisser-déposer l'image depuis le gestionnaire de fichiers de l'ordinateur (sans avoir à appuyer sur un bouton "parcourir").