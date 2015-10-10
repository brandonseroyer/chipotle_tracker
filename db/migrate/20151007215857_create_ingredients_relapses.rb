class CreateIngredientsRelapses < ActiveRecord::Migration
  def change
    create_table(:ingredients_relapses) do |t|
      t.column(:ingredient_id, :integer)
      t.column(:relapse_id, :integer)
    end
  end
end
