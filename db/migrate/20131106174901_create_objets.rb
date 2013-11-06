class CreateObjets < ActiveRecord::Migration
  def change
    create_table :objets do |t|
      t.string :libelle
      t.float :valeur

      t.timestamps
    end
  end
end
