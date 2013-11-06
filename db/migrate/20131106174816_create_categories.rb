class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :libelle
      t.string :fichier_image

      t.timestamps
    end
  end
end
