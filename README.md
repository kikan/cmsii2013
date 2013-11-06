cmsii2013
=========

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