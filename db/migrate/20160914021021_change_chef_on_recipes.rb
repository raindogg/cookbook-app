class ChangeChefOnRecipes < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipes, :chef, :string
    add_column :recipes, :user_id, :integer, default: 1
  end
end
