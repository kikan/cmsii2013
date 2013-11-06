class AddCategorieIdToObjets < ActiveRecord::Migration
  def change
    add_column :objets, :categorie_id, :integer
  end
end
